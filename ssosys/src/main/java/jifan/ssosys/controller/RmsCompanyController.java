package jifan.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jifan.ssosys.entity.RmsCompany;
import jifan.ssosys.entity.common.ReSultMode;
import jifan.ssosys.mapper.CommonMapper;
import jifan.ssosys.service.RmsCompanyService;
import jifan.ssosys.service.impl.CommonService;
import jifan.ssosys.tool.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping(value = "/company")
public class RmsCompanyController extends BaseController {


    @Autowired
    private RmsCompanyService opDao;

    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private CommonService commonService;

    @RequestMapping(value = "")
    public String Index(ModelMap map) {
        map.addAttribute("RuteUrl", routeUrl());
        map.addAttribute("toolbar", toolbar(2));
        return "rmscompany";
    }


    @ResponseBody
    @RequestMapping(value = "/search")
    public Map<String, Object>search(HttpServletRequest request) {
        int pageIndex = StringHelper.isEmpty(request.getParameter("page")) ? 1 : Integer.valueOf(request.getParameter("page"));
        int pageSize = StringHelper.isEmpty(request.getParameter("rows")) ? 10 : Integer.valueOf(request.getParameter("rows"));
        QueryWrapper wrapper = getQueryWrapper(request.getParameter("sqlSet"));
        ////字段排序
        String sortField = request.getParameter("sort");
        String sortOrder = request.getParameter("order");
        String fields = "*";
        String tablename = "rms_company";

        if (!StringHelper.isEmpty(sortField) && !StringHelper.isEmpty(sortOrder)) {
            if (sortOrder.toLowerCase().equals("desc")) {
                wrapper.orderByDesc(sortField);
            } else {
                wrapper.orderByAsc(sortField);
            }
        }
        if (!IsSysRole())//如果不是开发人员 只返回自已的
        {
           wrapper.eq("id", getUserData().getCompanyid());
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
    public ReSultMode editInfo(RmsCompany EidModle)
    {
        ReSultMode reSultMode = new ReSultMode();
        reSultMode.setCode(-11);
        reSultMode.setMsg("保存失败");
        boolean IsAdd = false;
        EidModle.setModifytime(new Date());
        if (EidModle.getId() ==0)//id为空，是添加
        {
            IsAdd = true;
            EidModle.setCreatetime(new Date());
            EidModle.setIsvalid(true);
            EidModle.setIsdeleted(false);
        }
        if (IsAdd)
        {
            try
            {
              if( opDao.save(EidModle))
              {
                  reSultMode.setCode(11);
                  reSultMode.setData(String.valueOf(EidModle.getId()));
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
           if (commonService.updataByWrapperNotIn(EidModle, nocolumns,null) > 0)
               // if (opDao.updateById(EidModle))
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
    public RmsCompany getInfo(int ID)
    {
        RmsCompany Rmodel = opDao.getById(ID);
        //  groupsBiz.Add(rol);
        return Rmodel;
    }

    @ResponseBody
    @RequestMapping(value = "/del")
    public ReSultMode del(String IDSet)
    {
        ReSultMode reSultMode = new ReSultMode();
        if (!IsSysRole())//如果不是系统开发员
        {
            reSultMode.setCode(-13);
            reSultMode.setData("0");
            reSultMode.setMsg("删除失败！你不是系统开发员");
            return reSultMode;
        }
        String[] idSet = IDSet.split(",");
        int cout = 0;
        for (String ids : idSet)
        {
            if(!StringHelper.isEmpty(ids)) {
                int id = Integer.parseInt(ids.replace("'", ""));
                cout += opDao.deleteRmsCompany(id);
            }
        }

        if (cout > 0)
        {
            reSultMode.setCode(11);
            reSultMode.setData(String.valueOf(cout));
            reSultMode.setMsg("成功删除" + cout + "条数据");
            return reSultMode;
        }
        else
        {
            reSultMode.setCode(-13);
            reSultMode.setData(String.valueOf(cout));
            reSultMode.setMsg("删除失败");
            return reSultMode;
        }
    }
}
