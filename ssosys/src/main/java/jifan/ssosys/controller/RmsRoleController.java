package jifan.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jifan.ssosys.config.appConfig;
import jifan.ssosys.entity.*;
import jifan.ssosys.entity.common.ReSultMode;
import jifan.ssosys.mapper.CommonMapper;
import jifan.ssosys.service.*;
import jifan.ssosys.service.impl.CommonService;
import jifan.ssosys.tool.StringHelper;
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
    private RmsMenusService rmsMenusService;
    @Autowired
    private RmsButtonsService rmsButtonsService;
    @Autowired
    private RmsRolemanusService rmsRolemanusService;

    @Autowired
    private VRolemanubuttonsService v_rmbBiz;
    @Autowired
    private RmsRolemanubuttonsService rmsRolemanubuttonsService;

    @Autowired
    private RmsMenubuttonsService rmsMenubuttonsService;


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
        String sqlManu = "where 1=1 ";
        sqlManu += " and companyid=" + getUserData().getCompanyid() + " ";//只显示 自己公司的
        sqlManu += " and projectid=" + Rmodel.getProjectid() + " ";//只显示同一个项目
        if (!IsSysRole())//不是系统管理员的角色，只能返回自己的菜单
        {
            sqlManu += " and id in( select manuid from rms_rolemanus where roleid='" + getUserData().getRoleId() + "')";

        }
        qw1.last(sqlManu);
        List<RmsMenus> list = rmsMenusService.list(qw1);//菜单集
        List<RmsButtons> listControlButtons = rmsButtonsService.list(new QueryWrapper<RmsButtons>().eq("1", 1));//所有的按钮
        List<RmsRolemanus> listRoleColumns = rmsRolemanusService.list(new QueryWrapper<RmsRolemanus>().eq("roleid", Id));//这个角色已经添加的菜单

        List<VRolemanubuttons> listRoleMenuButtons = v_rmbBiz.list(new QueryWrapper<VRolemanubuttons>().eq("roleid", Id));//这个角色已经添加的角色按钮
        for (int i = 0; i < list.size(); i++) {
            final int index = i;
            if (list.stream().filter(p -> p.getId() == list.get(index).getParentmanuid()).count() == 0)//此项没有父级
            {

                menus += "{  \"MenuId\":\"" + list.get(i).getId() + "\",";
                menus += String.format("  \"Name\":\"%s\",", list.get(i).getManuname());
                menus += String.format("  \"iconCls\":\"%s\",", list.get(i).getIcon());
                String ControlId_Browse = "0";
                List<RmsRolemanus> rcItem = listRoleColumns.stream().filter(p -> p.getManuid() == list.get(index).getId()).collect(Collectors.toList());
                if (rcItem != null && rcItem.size() > 0) {
                    ControlId_Browse = "1";//如果存在

                }
                menus += String.format("  \"ControlId_Browse\":\"%s\",", ControlId_Browse);
                for (RmsButtons dd : listControlButtons)//添加列的数据
                {

                    String Ishave = "0";
                    List<VRolemanubuttons> rmbItem = listRoleMenuButtons.stream().filter(p -> p.getId() == dd.getId() && p.getManuid() == list.get(index).getId()).collect(Collectors.toList());
                    if (rmbItem != null && rmbItem.size() > 0) {
                        Ishave = "1";//如果角色有此按钮存在
                    }
                    menus += String.format("\"ControlId_%d\":\"%s\",", dd.getId(), Ishave);

                }
                menus += GetSonTreeManu(list, list.get(i), listControlButtons, listRoleColumns, listRoleMenuButtons);//添加children
                menus += "},";
            }
        }
        menus = menus.substring(0, menus.length() - 1);
        menus = menus + "]";

        return menus;
    }

    private String GetSonTreeManu(List<RmsMenus> listAll, RmsMenus SonItem, List<RmsButtons> listControlButtons, List<RmsRolemanus> listRoleColumns, List<VRolemanubuttons> listRoleMenuButtons) {
        String menus = "\"children\":[";
        List<RmsMenus> list = listAll.stream().filter(p -> p.getParentmanuid() == SonItem.getId()).collect(Collectors.toList());
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                final int index = i;

                menus += "{  \"MenuId\":\"" + list.get(i).getId() + "\",";
                menus += String.format("  \"Name\":\"%s\",", list.get(i).getManuname());
                menus += String.format("  \"iconCls\":\"%s\",", list.get(i).getIcon());
                String ControlId_Browse = "0";
                List<RmsRolemanus> rcItem = listRoleColumns.stream().filter(p -> p.getManuid() == list.get(index).getId()).collect(Collectors.toList());
                if (rcItem != null && rcItem.size() > 0) {

                    ControlId_Browse = "1";//如果存在

                }
                menus += String.format("  \"ControlId_Browse\":\"%s\",", ControlId_Browse);
                for (RmsButtons dd : listControlButtons)//添加列的数据
                {

                    String Ishave = "0";

                    List<VRolemanubuttons> rmbItem = listRoleMenuButtons.stream().filter(p -> p.getId() == dd.getId() && p.getManuid() == list.get(index).getId()).collect(Collectors.toList());
                    ;

                    if (rmbItem != null && rmbItem.size() > 0) {
                        Ishave = "1";//如果角色有此按钮存在

                    }

                    menus += String.format("\"ControlId_%d\":\"%s\",", dd.getId(), Ishave);

                }
                menus += GetSonTreeManu(listAll, list.get(i), listControlButtons, listRoleColumns, listRoleMenuButtons);//添加children
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
    public List<RmsMenubuttons> GetMenuButtonsData() {
        String sql = "where 1=1 ";
        if (!IsSysRole())//不是系统管理员的角色，只能返回自己的
        {
            sql += "and id  in( select menubuttonsid from rms_rolemanubuttons where roleid='" + getUserData().getRoleId() + "')";

        }
        List<RmsMenubuttons> listMenuButtons = rmsMenubuttonsService.list(new QueryWrapper<RmsMenubuttons>().last(sql));//菜单的按钮
        return listMenuButtons;
    }

    @ResponseBody
    @RequestMapping(value = "/SaveRoleOP")
    @Transactional(rollbackFor = {Exception.class})
    public String SaveRoleOP(@RequestParam("RoleManus") String RoleManus, @RequestParam("RoleManuButtons") String RoleManuButtons, @RequestParam("RoleId") String RoleId) {


        try {
            List<String> manu = Arrays.asList(RoleManus.split("_"));
            int res = 0;
            boolean f = rmsRolemanusService.remove(new QueryWrapper<RmsRolemanus>().eq("roleid", RoleId));
            for (int i = 0; i < manu.size(); i++) {

                if (!StringHelper.isEmpty(manu.get(i))) {
                    RmsRolemanus item = new RmsRolemanus();
                    //item.id = Guid.NewGuid().ToString();
                    item.setRoleid(RoleId);
                    item.setManuid(Integer.parseInt(manu.get(i)));
                    rmsRolemanusService.save(item);
                    res++;
                }
            }
            List<String> ManuButtons = Arrays.asList(RoleManuButtons.split("_"));
            boolean ff = rmsRolemanubuttonsService.remove(new QueryWrapper<RmsRolemanubuttons>().eq("roleid", RoleId));
            for (int i = 0; i < ManuButtons.size(); i++) {

                RmsRolemanubuttons item = new RmsRolemanubuttons();
                //item.id = Guid.NewGuid().ToString();
                String[] data = ManuButtons.get(i).split(":");
                if (!StringHelper.isEmpty(data[0]) && !StringHelper.isEmpty(data[1])) {
                    item.setRoleid(RoleId);

                    String sql = " manuid=" + data[0] + " and buttonid=" + data[1] + "";
                    RmsMenubuttons bItem = rmsMenubuttonsService.getOne(new QueryWrapper<RmsMenubuttons>().eq("manuid", data[0]).eq("buttonid", data[1]));
                    if (bItem != null) {
                        item.setMenubuttonsid(bItem.getId());
                    }
                    rmsRolemanubuttonsService.save(item);
                    res++;
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

