package com.zhicheng.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhicheng.ssosys.entity.SysDictype;
import com.zhicheng.ssosys.entity.common.ReSultMode;
import com.zhicheng.ssosys.mapper.CommonMapper;
import com.zhicheng.ssosys.service.SysDictypeService;
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
@RequestMapping(value = "/dictype")
public class SysDicTypeController extends BaseController {


    @Autowired
    private SysDictypeService opDao;

    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private CommonService commonService;

    @RequestMapping(value = "")
    public String Index(ModelMap map) {
        map.addAttribute("RuteUrl", routeUrl());
        map.addAttribute("toolbar", toolbar(2));
        return "sysdictype";
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
        String tablename = "sys_dictype";

        if (!StringHelper.isEmpty(sortField) && !StringHelper.isEmpty(sortOrder)) {
            if (sortOrder.toLowerCase().equals("desc")) {
                wrapper.orderByDesc(sortField);
            } else {
                wrapper.orderByAsc(sortField);
            }
        }

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
    public ReSultMode editInfo(SysDictype EidModle) {
        ReSultMode reSultMode = new ReSultMode();
        reSultMode.setCode(-11);
        reSultMode.setMsg("保存失败");

        QueryWrapper<SysDictype> wrapper = new QueryWrapper<>();
        wrapper.eq("dictypenum", EidModle.getDictypenum());
        SysDictype Rmodel = opDao.getOne(wrapper);
        if (Rmodel != null && Rmodel.getDictypeid() != EidModle.getDictypeid()) {
            reSultMode.setMsg("已经存在相同的编号");
            return reSultMode;
        }


        boolean IsAdd = false;
        if (EidModle.getDictypeid() == 0)//id为空，是添加
        {
            IsAdd = true;
            EidModle.setCreatetime(new Date());
        }
        if (IsAdd) {
            try {
                if (opDao.save(EidModle)) {
                    reSultMode.setCode(11);
                    reSultMode.setData(String.valueOf(EidModle.getDictypeid()));
                    reSultMode.setMsg("添加成功");
                }
            } catch (Exception e) {
                reSultMode.setCode(-13);
                reSultMode.setData(e.toString());
                reSultMode.setMsg("系统出错");
            }
        } else {
            List<String> nocolumns = new ArrayList<>();
            nocolumns.add("createtime");
            if (commonService.updataByWrapperNotIn(EidModle, nocolumns, null) > 0)
            // if (opDao.updateById(EidModle))
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
    public SysDictype getInfo(int ID) {
        SysDictype Rmodel = opDao.getById(ID);
        //  groupsBiz.Add(rol);
        return Rmodel;
    }

    @ResponseBody
    @RequestMapping(value = "/del")
    public ReSultMode del(String IDSet) {
        ReSultMode reSultMode = new ReSultMode();
        QueryWrapper<SysDictype> wrapper = new QueryWrapper<>();
        wrapper.inSql("dictypeid", IDSet);
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
