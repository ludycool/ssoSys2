package jifan.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jifan.ssosys.entity.RmsMenubuttons;
import jifan.ssosys.entity.RmsMenus;
import jifan.ssosys.entity.VRmsMenus;
import jifan.ssosys.entity.common.ReSultMode;
import jifan.ssosys.entity.common.TreeMenus;
import jifan.ssosys.mapper.CommonMapper;
import jifan.ssosys.service.RmsMenubuttonsService;
import jifan.ssosys.service.RmsMenusService;
import jifan.ssosys.service.VRmsMenusService;
import jifan.ssosys.service.impl.CommonService;
import jifan.ssosys.tool.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping(value = "/manu")
public class RmsMenusController extends BaseController {

    @Autowired
    private RmsMenusService opDao;

    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private CommonService commonService;
    @Autowired
    private VRmsMenusService MDBiz;

    @Autowired
    private RmsMenubuttonsService MBDBiz;

    @RequestMapping(value = "")
    public String Index(ModelMap map) {
        map.addAttribute("RuteUrl", routeUrl());
        map.addAttribute("toolbar", toolbar(2));
        return "rmsmenus";
    }

    @ResponseBody
    @RequestMapping("/GetJson")
    public  List<TreeMenus> GetJson(HttpServletRequest request) {
        String projectid =request.getParameter("projectid");
        QueryWrapper wrapper=new QueryWrapper();

      //  if (!IsSysRole())//如果不是开发人员 只返回自已的
       // {
            wrapper.eq("companyid", getUserData().getCompanyid());
      //  }
        if (!StringHelper.isEmpty(projectid))
        {
            wrapper.eq("projectid",projectid );

        }


        List<VRmsMenus> listAll = MDBiz.list(wrapper);

        List<TreeMenus> listTree = opDao.GetTreeManus(listAll);
        return listTree;
    }

    @ResponseBody
    @RequestMapping(value = "/editInfo")
    public ReSultMode editInfo(RmsMenus modle)
    {
        ReSultMode reSultMode = new ReSultMode();
        reSultMode.setCode(-11);
        reSultMode.setMsg("保存失败");

        QueryWrapper<RmsMenus> wrapper = new QueryWrapper<>();
        wrapper.eq("url", modle.getUrl());
        wrapper.eq("projectid", modle.getProjectid());
        RmsMenus Rmodel = opDao.getOne(wrapper);
        if (Rmodel != null && Rmodel.getId() != modle.getId()) {
            reSultMode.setMsg("地址 url已存在");
            return reSultMode;
        }
        Boolean IsAdd = false;
        if (modle.getId()==0)//id为空，是添加
        {
            IsAdd = true;
        }
        if (modle.getParentmanuid() != 0)
        {

            RmsMenus parent = opDao.getById(modle.getParentmanuid());
            if (parent != null)
            {
                modle.setLevel((short) (parent.getLevel()+1));
            }
            if (!IsAdd)
            {
                List<RmsMenus> AllList =opDao.GetSon(modle.getId());//自己以下的树
                if (AllList.size() > 0)
                {
                    Boolean is_have = false;
                    for (int i = 0; i < AllList.size(); i++)
                    {
                        RmsMenus dep = AllList.get(i);
                        if (dep.getId() == modle.getParentmanuid())
                        {
                            is_have = true;
                            break;
                        }
                    }
                    if (is_have)
                    {

                        reSultMode.setMsg("上级不能选自己或自己的子项");
                        return reSultMode;
                    }
                }
            }
        }
        modle.setModifytime(new Date());

        if (IsAdd)
        {
            try
            {
                modle.setCreatetime(new Date());
                modle.setIsenable(true);
                modle.setIsshow(true);
                modle.setCompanyid(getUserData().getCompanyid());
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
            nocolumns.add("companyid");
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
    public RmsMenus getInfo(int ID)
    {
        RmsMenus Rmodel = opDao.getById(ID);
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
                cout += opDao.deletemenu(id);
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
    @ResponseBody
    @RequestMapping("/GetOneOut")
    public List<LinkedHashMap<String, Object>> GetOneOut(HttpServletRequest request)//获取菜单未添加的按钮
    {
        String ManuId =request.getParameter("ManuId");
        List<LinkedHashMap<String, Object>> list = commonMapper.listMapBySql(" select * from rms_buttons where id not in( select buttonid from rms_menubuttons where manuid='" + ManuId + "') order by orderno asc");

        return list;
    }
    @ResponseBody
    @RequestMapping("/GetOneIn")
    public List<LinkedHashMap<String, Object>> GetOneIn(HttpServletRequest request)//获取菜单已经添加的按钮
    {
        String ManuId =request.getParameter("ManuId");
        String sql = " select * from v_menubuttons where manuid='" + ManuId + "' order by orderno asc";
        List<LinkedHashMap<String, Object>> list = commonMapper.listMapBySql(sql);//已经添加的按钮
        return list;
    }

    /// <summary>
    /// //添加单按钮
    /// </summary>
    /// <param name="btnId"></param>
    /// <param name="ManuId"></param>
    /// <returns></returns>
    @ResponseBody
    @RequestMapping("/AddManuBtn")
    public String AddManuBtn(@RequestParam("BtnId")String BtnId, @RequestParam("ManuId")String ManuId, @RequestParam("OrderNo")String OrderNo)
    {

        //String sql = " select * from RmsMenubuttons where buttonid='" + BtnId + "' and manuid='" + ManuId + "'";
        QueryWrapper wrapper=new QueryWrapper();
        wrapper.eq("buttonid",BtnId);
        wrapper.eq("manuid",ManuId);
        RmsMenubuttons item = MBDBiz.getOne(wrapper);
        if (item != null)
        {
            item.setOrderno(Integer.parseInt(OrderNo));
            //  spmodel.GroupId = GroupId;
            if (MBDBiz.updateById(item))
            {
                return "OK";
            }
        }
        item = new RmsMenubuttons();
        //item.id = Guid.NewGuid().ToString();
        item.setButtonid(Integer.parseInt(BtnId));
        item.setManuid(Integer.parseInt(ManuId));
        item.setOrderno(Integer.parseInt(OrderNo));
        MBDBiz.save(item);
        return "OK";

    }
    /// <summary>
    /// //删菜单按钮
    /// </summary>
    /// <param name="btnId"></param>
    /// <param name="ManuId"></param>
    /// <returns></returns>
    @ResponseBody
    @RequestMapping("/delManuBtn")
    public String delManuBtn(@RequestParam("IdSet")String IdSet, @RequestParam("ManuId")String ManuId)
    {
        if (!IsSysRole())//如果不是系统开发员
        {
            return "Nok";
        }
        QueryWrapper<RmsMenubuttons> wrapper=new QueryWrapper<RmsMenubuttons>();
        wrapper.inSql("buttonid",IdSet);
        wrapper.eq("manuid",ManuId);
       // wrapper.last(" buttonid in (" + IdSet + ") and manuid='" + ManuId + "'");
        //List<String> ids = IdSet.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).ToList();
       MBDBiz.remove(wrapper);
        return "OK";
    }
}

