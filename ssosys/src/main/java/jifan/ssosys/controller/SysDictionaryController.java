package jifan.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jifan.ssosys.entity.SysDictionary;
import jifan.ssosys.entity.common.ReSultMode;
import jifan.ssosys.mapper.CommonMapper;
import jifan.ssosys.service.SysDictionaryService;
import jifan.ssosys.service.impl.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/dictionary")
public class SysDictionaryController extends BaseController {

    @Autowired
    private SysDictionaryService opDao;

    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private CommonService commonService;

    @RequestMapping(value = "")
    public String Index(ModelMap map) {
        map.addAttribute("RuteUrl", routeUrl());
        map.addAttribute("toolbar", toolbar(2));
        return "sysdictionary";
    }
    @ResponseBody
    @RequestMapping("/getJson")
    public  String getJson(HttpServletRequest request) {
        String DicType =request.getParameter("DicType");
        QueryWrapper<SysDictionary> wrapper = new QueryWrapper<>();
        wrapper.eq("dictypeid",DicType);
        wrapper.eq("isdeleted",0);

        List<SysDictionary> listAll = opDao.list(wrapper);
        String jsonstring = opDao.GetTree(listAll);
        return jsonstring;
    }

    @ResponseBody
    @RequestMapping(value = "/editInfo")
    public ReSultMode editInfo(SysDictionary modle)
    {
        ReSultMode reSultMode = new ReSultMode();
        reSultMode.setCode(-11);
        reSultMode.setMsg("保存失败");

        QueryWrapper<SysDictionary> wrapper = new QueryWrapper<>();
        wrapper.eq("dicno", modle.getDicno());
        SysDictionary Rmodel = opDao.getOne(wrapper);
        if (Rmodel != null && Rmodel.getDicid() != modle.getDicid()) {
            reSultMode.setMsg("已经存在相同的编号");
            return reSultMode;
        }
        if (modle.getParentid() ==modle.getDicid())//父级不能等于自已
        {

            modle.setParentid(0);
        }

        boolean IsAdd = false;
        if (modle.getDicid() ==0)//id为空，是添加
        {
            IsAdd = true;
            modle.setCreatetime(new Date());
            modle.setIsvalid(true);
            modle.setIsdeleted(false);
        }
        if (IsAdd)
        {
            try
            {
              if( opDao.save(modle))
              {
                  reSultMode.setCode(11);
                  reSultMode.setData(String.valueOf(modle.getDicid()));
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
    public SysDictionary getInfo(int ID)
    {
        SysDictionary Rmodel = opDao.getById(ID);
        //  groupsBiz.Add(rol);
        return Rmodel;
    }

    @ResponseBody
    @RequestMapping(value = "/del")
    public ReSultMode del(String IDSet)
    {
       ReSultMode reSultMode = new ReSultMode();
        QueryWrapper<SysDictionary> wrapper = new QueryWrapper<>();
        wrapper.inSql("dicid", IDSet);
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

