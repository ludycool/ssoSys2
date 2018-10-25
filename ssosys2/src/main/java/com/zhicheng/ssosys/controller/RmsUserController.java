package com.zhicheng.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhicheng.ssosys.entity.RmsUser;
import com.zhicheng.ssosys.entity.RmsUserrole;
import com.zhicheng.ssosys.entity.common.ReSultMode;
import com.zhicheng.ssosys.mapper.CommonMapper;
import com.zhicheng.ssosys.service.RmsUserService;
import com.zhicheng.ssosys.service.RmsUserroleService;
import com.zhicheng.ssosys.service.impl.CommonService;

import com.zhicheng.ssosys.tool.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping(value = "/user")
public class RmsUserController extends BaseController {

    @Autowired
    private RmsUserService opDao;

    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private CommonService commonService;

    @Autowired
    private RmsUserroleService rmsUserroleService;

    @RequestMapping(value = "")
    public String Index(ModelMap map) {
        map.addAttribute("RuteUrl", routeUrl());
        map.addAttribute("toolbar", toolbar(2));
        return "rmsuser";
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
        String tablename = "v_user_role";

        if (!StringHelper.isEmpty(sortField) && !StringHelper.isEmpty(sortOrder)) {
            if (sortOrder.toLowerCase().equals("desc")) {
                wrapper.orderByDesc(sortField);
            } else {
                wrapper.orderByAsc(sortField);
            }
        }
        String departmentId = request.getParameter("departmentId");
        if (!StringHelper.isEmpty(departmentId)) {
            wrapper.eq("departmentid", departmentId);
        }
        //if (!IsSysRole)//如果不是开发人员 只返回自已的
        //{
        wrapper.eq("companyid", getUserData().getCompanyid());
        //}
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
    public ReSultMode editInfo(RmsUser modle) {
        ReSultMode reSultMode = new ReSultMode();
        reSultMode.setCode(-11);
        reSultMode.setMsg("保存失败");

        long i = opDao.count(new QueryWrapper<RmsUser>().eq("loginname", modle.getLoginname()).ne("id", modle.getId()));
        if (i > 0) {
            reSultMode.setMsg("用户名已存在");
            return reSultMode;
        }
        boolean IsAdd = false;
        modle.setModifytime(new Date());
        if (!(!StringHelper.isEmpty(modle.getId()) && !modle.getId().equals("00000000-0000-0000-0000-000000000000")))//id为空，是添加
        {
            IsAdd = true;
            modle.setCreatetime(new Date());
            modle.setId(UUID.randomUUID().toString());
            modle.setCompanyid(getUserData().getCompanyid());
        }
        if (IsAdd) {
            try {
                if (StringHelper.isEmpty(modle.getPassword())) {
                    reSultMode.setMsg("密码为空");
                } else {
                    if (opDao.save(modle)) {
                        reSultMode.setCode(11);
                        reSultMode.setData(String.valueOf(modle.getId()));
                        reSultMode.setMsg("添加成功");
                    }
                }
            } catch (Exception e) {
                reSultMode.setCode(-13);
                reSultMode.setData(e.toString());
                reSultMode.setMsg("系统出错");
            }
        } else {


            List<String> nocolumns = new ArrayList<>();
            nocolumns.add("createtime");
            nocolumns.add("companyid");
            if (StringHelper.isEmpty(modle.getPassword()))//为空，密码不改
            {
                nocolumns.add("password");
            }
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
    public RmsUser getInfo(String ID) {
        RmsUser Rmodel = opDao.getById(ID);
        //  groupsBiz.Add(rol);
        return Rmodel;
    }

    @ResponseBody
    @RequestMapping(value = "/del")
    public ReSultMode del(String IDSet) {
        ReSultMode reSultMode = new ReSultMode();

        String[] idSet = IDSet.split(",");
        int cout = 0;
        for (String ids : idSet) {
            if (!StringHelper.isEmpty(ids)) {
                cout += opDao.deteUser(ids);
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
    @ResponseBody
    @RequestMapping(value = "/SetRole")
    public String SetRole(String UserId, String RoleId)
    {
        RmsUserrole Rmodel =rmsUserroleService.getOne(new QueryWrapper<RmsUserrole>().eq("userid",UserId).last(" LIMIT 1"));
        if (Rmodel == null)
        {
            Rmodel = new RmsUserrole();
            Rmodel.setUserid(UserId);
            Rmodel.setRoleid(RoleId);
            rmsUserroleService.save(Rmodel);
            return "ok";
        }
        else
        {
            Rmodel.setRoleid(RoleId);
            //  spmodel.GroupId = GroupId;
            if (rmsUserroleService.updateById(Rmodel))
            {
                return "ok";
            }
            else
            {
                return "Nok";
            }

        }

    }
}

