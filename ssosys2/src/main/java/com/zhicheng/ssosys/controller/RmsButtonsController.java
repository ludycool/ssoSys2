package com.zhicheng.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhicheng.ssosys.entity.RmsButtons;
import com.zhicheng.ssosys.entity.RmsPermission;
import com.zhicheng.ssosys.entity.common.ReSultMode;
import com.zhicheng.ssosys.mapper.CommonMapper;
import com.zhicheng.ssosys.service.RmsButtonsService;
import com.zhicheng.ssosys.service.RmsPermissionService;
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
@RequestMapping(value = "/button")
public class RmsButtonsController extends BaseController {

    @Autowired
    private RmsButtonsService opDao;

    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private CommonService commonService;
    @Autowired
    private RmsPermissionService permissionService;

    @RequestMapping(value = "")
    public String Index(ModelMap map) {
        map.addAttribute("RuteUrl", routeUrl());
        //map.addAttribute("toolbar", toolbar(2));
        return "rmsbuttons";
    }


    @ResponseBody
    @RequestMapping(value = "/search")
    public Map<String, Object>Search(HttpServletRequest request) {
        int pageIndex = StringHelper.isEmpty(request.getParameter("page")) ? 1 : Integer.valueOf(request.getParameter("page"));
        int pageSize = StringHelper.isEmpty(request.getParameter("rows")) ? 10 : Integer.valueOf(request.getParameter("rows"));
        QueryWrapper wrapper = getQueryWrapper(request.getParameter("sqlSet"));
        ////字段排序
        String sortField = request.getParameter("sort");
        String sortOrder = request.getParameter("order");
        String fields = "*";
        String tablename = "rms_buttons";

        if (!StringHelper.isEmpty(sortField) && !StringHelper.isEmpty(sortOrder)) {
            if (sortOrder.toLowerCase().equals("desc")) {
                wrapper.orderByDesc(sortField);
            } else {
                wrapper.orderByAsc(sortField);
            }
        }

        if(wrapper.getExpression().getNormal().size()==0)//无条件 查所有
        {
            wrapper.eq("1",1);
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
    public ReSultMode editInfo(RmsButtons modle)
    {
        ReSultMode reSultMode = new ReSultMode();
        reSultMode.setCode(-11);
        reSultMode.setMsg("保存失败");
        boolean IsAdd = false;
        modle.setModifytime(new Date());
        if (modle.getId() ==0)//id为空，是添加
        {
            IsAdd = true;
            modle.setCreatetime(new Date());
        }
        if (IsAdd)
        {
            try
            {
              if( opDao.save(modle))
              {
                  reSultMode.setCode(11);
                  reSultMode.setData(String.valueOf(modle.getId()));
                  reSultMode.setMsg("添加成功");
              }
            }
            catch (Exception e)
            {
                reSultMode.setCode(-13);
                reSultMode.setData(e.toString());
                reSultMode.setMsg("系统出错");
            }
        }
        else
        {
            List<String> nocolumns = new ArrayList<>();
            nocolumns.add("createtime");
           if (commonService.updataByWrapperNotIn(modle, nocolumns,null) > 0)
               // if (opDao.updateById(modle))
            {
                reSultMode.setCode(11);
                reSultMode.setData("");
                reSultMode.setMsg("修改成功");
            }
            else
            {
                reSultMode.setCode(-11);
                reSultMode.setData("");
                reSultMode.setMsg("修改失败");
            }
        }
        return reSultMode;
    }
    @ResponseBody
    @RequestMapping(value = "/getInfo")
    public RmsButtons getInfo(int ID)
    {
        RmsButtons Rmodel = opDao.getById(ID);
        //  groupsBiz.Add(rol);
        return Rmodel;
    }

    @ResponseBody
    @RequestMapping(value = "/del")
    public ReSultMode del(String IDSet)
    {
       ReSultMode reSultMode = new ReSultMode();
       if(permissionService.count(new QueryWrapper<RmsPermission>().inSql("buttonid",IDSet))>0)
       {
           reSultMode.setCode(-11);
           reSultMode.setMsg("已被使用，不能删除");
           return reSultMode;
       }
        QueryWrapper<RmsButtons> wrapper = new QueryWrapper<>();
        wrapper.inSql("id", IDSet);
        if (opDao.remove(wrapper)) {
            reSultMode.setCode(11);
            reSultMode.setMsg("成功删除");
            return reSultMode;
        } else {
            reSultMode.setCode(-13);
            reSultMode.setMsg("删除失败");
            return reSultMode;
        }
    }
}

