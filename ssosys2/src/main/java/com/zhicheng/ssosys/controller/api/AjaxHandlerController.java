package com.zhicheng.ssosys.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhicheng.ssosys.controller.BaseController;
import com.zhicheng.ssosys.entity.common.AdminUserInfo;
import com.zhicheng.ssosys.mapper.CommonMapper;
import com.zhicheng.ssosys.multiple.DataSourceContextHolder;
import com.zhicheng.ssosys.tool.StringHelper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@Slf4j
@Api("基础数据")
@RestController
@RequestMapping("/AjaxHandler")
public class AjaxHandlerController extends BaseController {

    @Autowired
    private CommonMapper commonMapper;

    /// <summary>
    /// 获取公司列表
    /// </summary>
    /// <returns></returns>
    @ApiOperation(value = "获取公司列表")
    @RequestMapping("/GetCompany")
    public List<LinkedHashMap<String, Object>> GetCompany()
    {
        QueryWrapper wrapper = new QueryWrapper<>();
        if (!IsSysRole())//如果不是系统管理员 只返回自已的
        {
            wrapper.eq("id",getUserData().getCompanyid());
        }else {
            wrapper.eq("1",1);
        }
        List<LinkedHashMap<String, Object>> all=commonMapper.listMapByWrapper("*","rms_company" ,wrapper);
        return all;
    }

    /// <summary>
    /// 角色类型
    /// </summary>
    /// <param name="RoleTypes"></param>
    /// <returns></returns>
    @ApiOperation(value = "角色类型")
    @RequestMapping("/GetList")
    public  Map<String, Object> GetList(@RequestParam("RoleTypes")String RoleTypes)
    {
        QueryWrapper wrapper = new QueryWrapper<>();
        wrapper.eq("roletypes",RoleTypes);
        wrapper.eq("companyid",getUserData().getCompanyid());
        List<LinkedHashMap<String, Object>> tb =commonMapper.listMapByWrapper("id,projectname,rolename,remarks","v_role" ,wrapper);
        Map<String, Object> dic = new HashMap<>();
        // var mql = RMS_RoleSet.ControlId.NotEqual("");
        dic.put("rows", tb);
        dic.put("total", tb.size());

        return dic;
    }

    /// <summary>
    /// 获取用户数据
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    @ApiOperation(value = "获取用户数据")
    @GetMapping("/GetUser")
    public AdminUserInfo GetUser()
    {
        return getUserData();
    }

    /// <summary>
    /// 获取部门
    /// </summary>
    /// <returns></returns>
    @ApiOperation(value = "获取部门")
    @RequestMapping("/GetDepartment")
    public List<LinkedHashMap<String, Object>> GetDepartment()
    {
        QueryWrapper wrapper = new QueryWrapper<>();
         wrapper.eq("companyid",getUserData().getCompanyid());//只返回自己公司的
        List<LinkedHashMap<String, Object>> all=commonMapper.listMapByWrapper("*","rms_department" ,wrapper);
        return all;
    }

    /// <summary>
    /// 获取项目
    /// </summary>
    /// <returns></returns>
    @ApiOperation(value = "获取项目")
    @RequestMapping("/Getpoject")
    public List<LinkedHashMap<String, Object>> Getpoject()
    {
        QueryWrapper wrapper = new QueryWrapper<>();
        wrapper.eq("companyid",getUserData().getCompanyid());//只返回自己公司的
        List<LinkedHashMap<String, Object>> all=commonMapper.listMapByWrapper("*","rms_project" ,wrapper);
        return all;
    }

    /// <summary>
    /// 获取sysItem
    /// </summary>
    /// <param name="ItemType"></param>
    /// <param name="cn"></param>
    /// <returns></returns>
    @ApiOperation(value = "获取sysItem")
    @RequestMapping("/GetSysItem")
    public List<LinkedHashMap<String, Object>> GetSysItem(@RequestParam("ItemType")String ItemType,@RequestParam( value="cn", required=false) String cn)
    {
        if(!StringHelper.isEmpty(cn))
        {
            DataSourceContextHolder.setDataSource(cn);
        }
        QueryWrapper wrapper = new QueryWrapper<>();
        wrapper.eq("itemtype",ItemType);
        wrapper.eq("del_flag",0);
        wrapper.orderByAsc("orderid");
        List<LinkedHashMap<String, Object>> all=commonMapper.listMapByWrapper("*","sysitem" ,wrapper);

        if(!StringHelper.isEmpty(cn))
        {
            DataSourceContextHolder.clear();
        }
        return all;
    }



    /// <summary>
    /// 获取 类型
    /// </summary>
    /// <returns></returns>
    @ApiOperation(value = "获取词典类型 to easyui")
    @RequestMapping("/GetSys_DicTypeDataGrid")
    public Map<String, Object> GetSys_DicTypeDataGrid()
    {
        QueryWrapper wrapper = new QueryWrapper<>();
        wrapper.eq("del_flag",0);
        List<LinkedHashMap<String, Object>> all=commonMapper.listMapByWrapper("*","sys_dictype" ,wrapper);
        Map<String, Object> dic = new HashMap<String, Object>();
        dic.put("rows", all);
        dic.put("total", all.size());
        return dic;
    }

    @ApiOperation(value = "获取词典类型")
    @RequestMapping("/GetSys_DicTypeJson")
    public List<LinkedHashMap<String, Object>> GetSys_DicTypeJson()
    {
        QueryWrapper wrapper = new QueryWrapper<>();
        wrapper.eq("del_flag",0);
        List<LinkedHashMap<String, Object>> all=commonMapper.listMapByWrapper("*","sys_dictype" ,wrapper);
        return all;

    }
}

