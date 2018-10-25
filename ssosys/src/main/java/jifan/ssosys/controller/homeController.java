package jifan.ssosys.controller;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import jifan.ssosys.entity.RmsUser;
import jifan.ssosys.entity.common.AdminUserInfo;
import jifan.ssosys.entity.common.Manu;
import jifan.ssosys.entity.common.TreeMenus;
import jifan.ssosys.entity.common.m_v_rolemanus;
import jifan.ssosys.mapper.CommonMapper;
import jifan.ssosys.service.RmsUserService;
import jifan.ssosys.service.impl.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/home")
public class homeController extends BaseController {


    @Autowired
    private CommonService commonService;

    @Autowired
    private CommonMapper commonMapper;

    @RequestMapping(value = "")
    public String Index(ModelMap map) {

        map.addAttribute("RuteUrl", routeUrl());
        AdminUserInfo uinfo = getUserData();
        map.addAttribute("userName", uinfo.getUserName());
        map.addAttribute("companyName", uinfo.getCompanyName());
        return "home";
    }

    @ResponseBody
    @RequestMapping(value = "/getmenu")
    public List<TreeMenus> GetMenu() {
        Map<String, Manu> ListManusD = getUserData().getListManusD();//所有的子集 不包含自已
        List<m_v_rolemanus> listTwoSet = new ArrayList<>();//父级
        List<m_v_rolemanus> listTwoUrl = new ArrayList<>();//二级的连接

        for (Manu item : ListManusD.values()) {
            if (item.getManuinfo().getTypeid() == 2) {
                listTwoUrl.add(item.getManuinfo());
            } else {
                listTwoSet.add(item.getManuinfo());
            }
        }
        List<TreeMenus> listTree = GetTreeMenus(listTwoSet, listTwoUrl);
        return listTree;
    }

    private List<TreeMenus> GetTreeMenus(List<m_v_rolemanus> listTwoSet, List<m_v_rolemanus> listTwoUrl) {
        List<TreeMenus> resultList = new ArrayList<>();//总菜单
        for (m_v_rolemanus item : listTwoSet)//所有的二级集合
        {
            List<m_v_rolemanus> listson = new ArrayList<>();//这个二级的子集
            for (int i = 0; i < listTwoUrl.size(); i++) {
                if (listTwoUrl.get(i).getParentmanuid() == item.getManuid()) {
                    listson.add(listTwoUrl.get(i));
                    listTwoUrl.remove(i);
                    i--;
                }
            }
            resultList.add(GetMenus(item, listson));
        }
        return resultList;
    }


    /// <summary>
    /// 父亲 和子集
    /// </summary>
    /// <param name="item"></param>
    /// <param name="listson"></param>
    /// <returns></returns>
    private TreeMenus GetMenus(m_v_rolemanus item, List<m_v_rolemanus> listson) {
        List<TreeMenus> resultList = new ArrayList<>();
        int allcout = listson.size();
        for (int i = 0; i < allcout; i++) {
            TreeMenus resultItem = new TreeMenus();
            resultItem.setId(listson.get(i).getManuid());
            resultItem.setParentManuId(listson.get(i).getParentmanuid());
            resultItem.setOrderNo(listson.get(i).getOrderno());
            resultItem.setName(listson.get(i).getManuname());
            resultItem.setIconCls(listson.get(i).getIcon());
            resultItem.setMicon(listson.get(i).getMicon());
            resultItem.setUrl(listson.get(i).getUrl());
            resultList.add(resultItem);
        }
        TreeMenus ItemN = new TreeMenus();
        ItemN.setId(item.getManuid());
        ItemN.setParentManuId(item.getParentmanuid());
        ItemN.setOrderNo(item.getOrderno());
        ItemN.setName(item.getManuname());
        ItemN.setIconCls(item.getIcon());
        ItemN.setMicon(item.getMicon());
        ItemN.setUrl(item.getUrl());

        ItemN.setChildren(resultList);
        return ItemN;
    }

    @ResponseBody
    @RequestMapping(value = "/loginOut")
    public String loginOut() {
        setUserData(null);
        return "OK";
    }

    @RequestMapping(value = "/ChangePwd")
    public String ChangePwd(String NewPwd, String OldPwd) {
        AdminUserInfo userData = getUserData();
        if (!OldPwd.trim().equals(getUserData().getPassword())) {
            return "旧密码不成确";
        } else {
            UpdateWrapper wrapper = new UpdateWrapper<>();
            wrapper.eq("id", userData.getId());
            Map<String, Object> umap = new HashMap<>();
            umap.put("password", NewPwd);
            if (commonMapper.update("rms_user", umap, wrapper) > 0) {

                userData.setPassword(NewPwd);
                setUserData(userData);
                return "密码修改成功";
            } else {
                return "密码修改失败";
            }
        }
    }

    /// <summary>
    /// 修改当前公司
    /// </summary>
    /// <returns></returns>
    @ResponseBody
    @RequestMapping(value = "/ChangeCompany")
    public String ChangeCompany(String companyid, String companname) {
        AdminUserInfo userData = getUserData();
        userData.setCompanyid(Integer.valueOf(companyid));
        userData.setCompanyName(companname);
        setUserData(userData);
        return "当前公司：" + companname;

    }
}
