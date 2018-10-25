package com.zhicheng.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhicheng.ssosys.config.appConfig;
import com.zhicheng.ssosys.entity.RmsButtons;
import com.zhicheng.ssosys.entity.RmsPermission;
import com.zhicheng.ssosys.entity.RmsRole;
import com.zhicheng.ssosys.entity.RmsRolePermission;
import com.zhicheng.ssosys.entity.common.ReSultMode;
import com.zhicheng.ssosys.mapper.CommonMapper;
import com.zhicheng.ssosys.service.RmsButtonsService;
import com.zhicheng.ssosys.service.RmsPermissionService;
import com.zhicheng.ssosys.service.RmsRolePermissionService;
import com.zhicheng.ssosys.service.RmsRoleService;

import com.zhicheng.ssosys.service.impl.CommonService;
import com.zhicheng.ssosys.tool.StringHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping(value = "/role")
public class RmsRoleController extends BaseController {

    @Autowired
    private RmsRoleService opDao;

    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private CommonService commonService;
    @Autowired
    private RmsPermissionService permissionService;
    @Autowired
    private RmsButtonsService rmsButtonsService;
    @Autowired
    private RmsRolePermissionService rolePermissionService;





    @RequestMapping(value = "")
    public String Index(ModelMap map) {
        map.addAttribute("RuteUrl", routeUrl());
        map.addAttribute("toolbar", toolbar(2));
        return "rmsrole";
    }


    @ResponseBody
    @RequestMapping(value = "/search")
    public Map<String, Object> search(HttpServletRequest request) {
        int pageIndex = StringHelper.isEmpty(request.getParameter("page")) ? 1 : Integer.valueOf(request.getParameter("page"));
        int pageSize = StringHelper.isEmpty(request.getParameter("rows")) ? 10 : Integer.valueOf(request.getParameter("rows"));
        QueryWrapper wrapper = getQueryWrapper(request.getParameter("sqlSet"));
        ////字段排序
        String sortField = request.getParameter("sort");
        String sortOrder = request.getParameter("order");
        String fields = "*";
        String tablename = "v_role";

        if (!StringHelper.isEmpty(sortField) && !StringHelper.isEmpty(sortOrder)) {
            if (sortOrder.toLowerCase().equals("desc")) {
                wrapper.orderByDesc(sortField);
            } else {
                wrapper.orderByAsc(sortField);
            }
        }
        if (!IsSysRole())//如果不是开发人员 只返回自已的
        {
            wrapper.ne("id", appConfig.getSysRoleId());
        }
        wrapper.eq("companyid", getUserData().getCompanyid());
        if (wrapper.getExpression().getNormal().size() == 0)//无条件 查所有
        {
            wrapper.eq("1", 1);
        }
        IPage page = new Page<>(pageIndex, pageSize);
        IPage<LinkedHashMap<String, Object>> ds = commonMapper.listMapByWrapper(page, fields, tablename, wrapper);
        Map<String, Object> dic = new HashMap<>();
        dic.put("rows", ds.getRecords());
        dic.put("total", page.getTotal());
        return dic;
    }

    @ResponseBody
    @RequestMapping(value = "/editInfo")
    public ReSultMode editInfo(RmsRole modle) {
        ReSultMode reSultMode = new ReSultMode();
        reSultMode.setCode(-11);
        reSultMode.setMsg("保存失败");
        boolean IsAdd = false;
        modle.setModifytime(new Date());
        if (!(!StringHelper.isEmpty(modle.getId()) && !modle.getId().equals("00000000-0000-0000-0000-000000000000")))//id为空，是添加
        {
            IsAdd = true;
            modle.setCreatetime(new Date());
            modle.setId(UUID.randomUUID().toString());
        }

        if (IsAdd) {
            try {
                modle.setCompanyid(getUserData().getCompanyid());
                modle.setModifyby(getUserData().getUserName());
                if (opDao.save(modle)) {
                    reSultMode.setCode(11);
                    reSultMode.setData(String.valueOf(modle.getId()));
                    reSultMode.setMsg("添加成功");
                }
            } catch (Exception e) {
                reSultMode.setCode(-13);
                reSultMode.setData(e.toString());
                reSultMode.setMsg("系统出错");
            }
        } else {
            List<String> nocolumns = new ArrayList<>();
            nocolumns.add("companyid");
            nocolumns.add("createtime");
            nocolumns.add("jurisdiction");//权限不能在这里更改s
            if (commonService.updataByWrapperNotIn(modle, nocolumns, null) > 0)
            // if (opDao.updateById(modle))
            {
                reSultMode.setCode(11);
                reSultMode.setData("");
                reSultMode.setMsg("修改成功");
            } else {
                reSultMode.setCode(-11);
                reSultMode.setData("");
                reSultMode.setMsg("修改失败");
            }
        }
        return reSultMode;
    }

    @ResponseBody
    @RequestMapping(value = "/getInfo")
    public RmsRole getInfo(String ID) {
        RmsRole Rmodel = opDao.getById(ID);
        //  groupsBiz.Add(rol);
        return Rmodel;
    }

    @ResponseBody
    @RequestMapping(value = "/deg")
    public ReSultMode deg(String IDSet) {
        ReSultMode reSultMode = new ReSultMode();

        String[] idSet = IDSet.split(",");
        int cout = 0;
        for (String ids : idSet) {
            if (!StringHelper.isEmpty(ids)) {
                cout += opDao.deleteRole(ids);
            }
        }
        if (cout > 0) {
            reSultMode.setCode(11);
            reSultMode.setData(String.valueOf(cout));
            reSultMode.setMsg("成功删除" + cout + "条数据");
            return reSultMode;
        } else {
            reSultMode.setCode(-13);
            reSultMode.setData(String.valueOf(cout));
            reSultMode.setMsg("删除失败");
            return reSultMode;
        }
    }

    /// <summary>
    /// 获取某个角色的权限 数据不要乱改啊！！
    /// </summary>
    /// <param name="Id">角色的Id</param>
    /// <returns></returns>
    @ResponseBody
    @RequestMapping(value = "/GetManeOP")
    public String GetManeOP(String Id) {
        RmsRole Rmodel = opDao.getById(Id);//当前角色
        String menus = " [\n";
        QueryWrapper qw1 = new QueryWrapper();
        String sqlManu = "where typeid=0 ";
        sqlManu += " and companyid=" + getUserData().getCompanyid() + " ";//只显示 自己公司的
        sqlManu += " and projectid=" + Rmodel.getProjectid() + " ";//只显示同一个项目
        if (!IsSysRole())//不是系统管理员的角色，只能返回自己的菜单
        {
            sqlManu += " and id in( permissionid from rms_role_permission where roleid='" + getUserData().getRoleId() + "')";

        }
        qw1.last(sqlManu);
        List<RmsPermission> list = permissionService.list(qw1);//菜单集
        List<RmsButtons> listControlButtons = rmsButtonsService.list(new QueryWrapper<RmsButtons>().eq("1", 1));//所有的按钮

        List<RmsPermission> listRoleManu = permissionService.list(new QueryWrapper<RmsPermission>().eq("typeid",0).inSql("id", " select permissionid from rms_role_permission where roleid='" + Id + "'"));//这个角色已经添加的菜单

        List<RmsPermission> listRoleButtons = permissionService.list(new QueryWrapper<RmsPermission>().eq("typeid", 1).inSql("id", " select permissionid from rms_role_permission where roleid='" + Id + "'"));//这个角色已经添加的角色按钮
        for (int i = 0; i < list.size(); i++) {
            final int index = i;
            if (list.stream().filter(p -> p.getId() == list.get(index).getParentid()).count() == 0)//此项没有父级
            {

                menus += "{  \"MenuId\":\"" + list.get(i).getId() + "\",";
                menus += String.format("  \"Name\":\"%s\",", list.get(i).getPname());
                menus += String.format("  \"iconCls\":\"%s\",", list.get(i).getIcon());
                String ControlId_Browse = "0";
                List<RmsPermission> rcItem = listRoleManu.stream().filter(p -> p.getParentid() == list.get(index).getId()).collect(Collectors.toList());
                if (rcItem != null && rcItem.size() > 0) {
                    ControlId_Browse = "1";//如果存在

                }
                menus += String.format("  \"ControlId_Browse\":\"%s\",", ControlId_Browse);
                for (RmsButtons dd : listControlButtons)//添加列的数据
                {

                    String Ishave = "0";
                    List<RmsPermission> rmbItem = listRoleButtons.stream().filter(p -> p.getButtonid() == dd.getId() && p.getParentid() == list.get(index).getId()).collect(Collectors.toList());
                    if (rmbItem != null && rmbItem.size() > 0) {
                        Ishave = "1";//如果角色有此按钮存在
                    }
                    menus += String.format("\"ControlId_%d\":\"%s\",", dd.getId(), Ishave);

                }
                menus += GetSonTreeManu(list, list.get(i), listControlButtons, listRoleManu, listRoleButtons);//添加children
                menus += "},";
            }
        }
        menus = menus.substring(0, menus.length() - 1);
        menus = menus + "]";

        return menus;
    }

    private String GetSonTreeManu(List<RmsPermission> listAll, RmsPermission SonItem, List<RmsButtons> listControlButtons, List<RmsPermission> listRoleManu, List<RmsPermission> listRoleButtons) {
        String menus = "\"children\":[";
        List<RmsPermission> list = listAll.stream().filter(p -> p.getParentid() == SonItem.getId()).collect(Collectors.toList());
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                final int index = i;

                menus += "{  \"MenuId\":\"" + list.get(i).getId() + "\",";
                menus += String.format("  \"Name\":\"%s\",", list.get(i).getPname());
                menus += String.format("  \"iconCls\":\"%s\",", list.get(i).getIcon());
                String ControlId_Browse = "0";
                List<RmsPermission> rcItem = listRoleManu.stream().filter(p -> p.getParentid() == SonItem.getId()).collect(Collectors.toList());
                if (rcItem != null && rcItem.size() > 0) {

                    ControlId_Browse = "1";//如果存在

                }
                menus += String.format("  \"ControlId_Browse\":\"%s\",", ControlId_Browse);
                for (RmsButtons dd : listControlButtons)//添加列的数据
                {

                    String Ishave = "0";

                    List<RmsPermission> rmbItem = listRoleButtons.stream().filter(p -> p.getButtonid() == dd.getId() && p.getParentid() == list.get(index).getId()).collect(Collectors.toList());
                    ;

                    if (rmbItem != null && rmbItem.size() > 0) {
                        Ishave = "1";//如果角色有此按钮存在

                    }

                    menus += String.format("\"ControlId_%d\":\"%s\",", dd.getId(), Ishave);

                }
                menus += GetSonTreeManu(listAll, list.get(i), listControlButtons, listRoleManu, listRoleButtons);//添加children
                menus += "},";
            }
            menus = menus.substring(0, menus.length() - 1);
        }
        menus = menus + "]";
        return menus;
    }

    /// <summary>
    /// 获取列
    /// </summary>
    /// <returns></returns>
    @ResponseBody
    @RequestMapping(value = "/GetBtnColumn")
    public String GetBtnColumn() {

        String menus = " [\n";
        List<RmsButtons> list = rmsButtonsService.list(new QueryWrapper<RmsButtons>().eq("1", 1));
        if (list != null) {
            menus += "{  ";

            menus += "title:\"名称\",field:\"Name\", width: 100";
            menus += "},";
            menus += "{  ";

            menus += "title:\"浏览\",field:\"ControlId_Browse\", width: 30,editor:{type:'checkbox',options:{on:'1',off:'0'}}, formatter: formatCheck";
            menus += "},";

            for (RmsButtons item : list) {
                menus += "{  ";

                menus += "title:\"" + item.getButtonname() + "\",field:\"ControlId_" + item.getId() + "\", width: 30,editor:{type:'checkbox',options:{on:'1',off:'0'}}, formatter: formatCheck";
                menus += "},";
            }

        }

        menus = menus.substring(0, menus.length() - 1);
        menus = menus + "]";

        return menus;

    }

    /// <summary>
    /// 获取每个菜单有的按钮
    /// </summary>
    /// <returns></returns>
    @ResponseBody
    @RequestMapping(value = "/GetMenuButtonsData")
    public List<RmsPermission> GetMenuButtonsData() {
        QueryWrapper wrapper=     new QueryWrapper<RmsPermission>().eq("typeid",1);
        if (!IsSysRole())//不是系统管理员的角色，只能返回自己的
        {
            wrapper.eq("roleid", getUserData().getId());

        }
        List<RmsPermission> listMenuButtons = permissionService.list(wrapper);
        return listMenuButtons;
    }

    @ResponseBody
    @RequestMapping(value = "/SaveRoleOP")
    @Transactional(rollbackFor = {Exception.class})
    public String SaveRoleOP(@RequestParam("RoleManus") String RoleManus, @RequestParam("RoleManuButtons") String RoleManuButtons, @RequestParam("RoleId") String RoleId) {
        try {
            List<String> manu = Arrays.asList(RoleManus.split("_"));
            int res = 0;
            boolean f = rolePermissionService.remove(new QueryWrapper<RmsRolePermission>().eq("roleid", RoleId));//删除原有权限
            for (int i = 0; i < manu.size(); i++) {

                if (!StringHelper.isEmpty(manu.get(i))) {
                    RmsRolePermission item = new RmsRolePermission();
                    //item.id = Guid.NewGuid().ToString();
                    item.setRoleid(RoleId);
                    item.setPermissionid(Integer.parseInt(manu.get(i)));
                    rolePermissionService.save(item);//添加菜单
                    res++;
                }
            }
            List<RmsPermission> listMenuButtons = permissionService.list(new QueryWrapper<RmsPermission>().eq("typeid",1));// 所有的菜单 按钮
            List<String> ManuButtons = Arrays.asList(RoleManuButtons.split("_"));

            for (int i = 0; i < ManuButtons.size(); i++) {

                RmsRolePermission item = new RmsRolePermission();
                //item.id = Guid.NewGuid().ToString();
                String[] data = ManuButtons.get(i).split(":");
                if (!StringHelper.isEmpty(data[0]) && !StringHelper.isEmpty(data[1])) {
                    int manuid=Integer.parseInt(data[0]);
                    int buttonid=Integer.parseInt(data[1]);

                    List<RmsPermission> bItem= listMenuButtons.stream().filter(p -> p.getParentid()==manuid&&p.getButtonid()==buttonid).collect(Collectors.toList());
                    if (bItem != null&&bItem.size()>0) {
                        item.setRoleid(RoleId);
                        item.setPermissionid(bItem.get(0).getId());
                        rolePermissionService.save(item);//添加按钮
                        res++;
                    }
                }
            }
            Boolean isSucces = true;//操作是否成功
            if (isSucces)//是否成功
            {
                Boolean ies = opDao.SetJurisdiction(RoleId);//保存 权限json
                return "ok";

            } else {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//事务回滚
                return "Nok";

            }

        } catch (Exception ex) {
            log.error("RoleController.SaveRoleOP", "角色设置出错", ex);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//事务回滚
            return "Nok";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/Refreshpermissions")
    public ReSultMode Refreshpermissions(String roleid) {
        ReSultMode reSultMode = new ReSultMode();
        boolean issusess = opDao.SetJurisdiction(roleid);
        if (issusess) {

            reSultMode.setCode(11);
            reSultMode.setMsg("刷新权限成功");
        } else {
            reSultMode.setCode(-11);
            reSultMode.setMsg("刷新权限失败");
        }

        return reSultMode;


    }

}

