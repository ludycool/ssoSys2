package jifan.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jifan.ssosys.entity.RmsDepartment;
import jifan.ssosys.entity.common.ReSultMode;
import jifan.ssosys.mapper.CommonMapper;
import jifan.ssosys.service.RmsDepartmentService;
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
@RequestMapping(value = "/department")
public class RmsDepartmentController extends BaseController {

    @Autowired
    private RmsDepartmentService opDao;

    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private CommonService commonService;

    @RequestMapping(value = "")
    public String Index(ModelMap map) {
        map.addAttribute("RuteUrl", routeUrl());
        map.addAttribute("toolbar", toolbar(2));
        return "rmsdepartment";
    }

    @ResponseBody
    @RequestMapping("/getJson")
    public String getJson() {
        QueryWrapper<RmsDepartment> wrapper = new QueryWrapper<>();
        //if (!IsSysRole)//如果不是开发人员 只返回自已的
        //{
        wrapper.eq("companyid", getUserData().getCompanyid());
        //}
        List<RmsDepartment> listAll = opDao.list(wrapper);
        String jsonstring = opDao.GetTree(listAll);
        return jsonstring;
    }

    @ResponseBody
    @RequestMapping(value = "/editInfo")
    public ReSultMode editInfo(RmsDepartment modle) {
        ReSultMode reSultMode = new ReSultMode();
        reSultMode.setCode(-11);
        reSultMode.setMsg("保存失败");
        if (modle.getId() == modle.getParentid() && modle.getParentid() != 0) {
            reSultMode.setMsg("上级不能选自己");
            return reSultMode;

        }

        boolean IsAdd = false;
        modle.setModifytime(new Date());
        if (modle.getId() == 0)//id为空，是添加
        {
            IsAdd = true;
            modle.setCompanyid(getUserData().getCompanyid());
            modle.setCreatetime(new Date());
        }
        if (IsAdd) {
            try {
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
    public RmsDepartment getInfo(int ID) {
        RmsDepartment Rmodel = opDao.getById(ID);
        //  groupsBiz.Add(rol);
        return Rmodel;
    }

    @ResponseBody
    @RequestMapping(value = "/del")
    public ReSultMode del(String IDSet) {
        ReSultMode reSultMode = new ReSultMode();
        QueryWrapper<RmsDepartment> wrapper = new QueryWrapper<>();
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

