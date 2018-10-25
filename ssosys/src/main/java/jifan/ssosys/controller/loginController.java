package jifan.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jifan.ssosys.entity.RmsDepartment;
import jifan.ssosys.entity.VUserrole;
import jifan.ssosys.entity.common.AdminUserInfo;
import jifan.ssosys.entity.common.ReSultMode;
import jifan.ssosys.mapper.CommonBusinessMapper;

import jifan.ssosys.mapper.VUserroleMapper;
import jifan.ssosys.service.RmsDepartmentService;
import jifan.ssosys.service.RmsRoleService;
import jifan.ssosys.tool.RandomValidateCodeUtil;
import jifan.ssosys.tool.StringHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "/login")
public class loginController extends BaseController {


    @Autowired
    private CommonBusinessMapper commonBusinessDao;
    @Autowired
    VUserroleMapper vUserroleMapper;

    @Autowired
    private RmsDepartmentService departmentDao;

    @Autowired
    private RmsRoleService roleDao;

    @RequestMapping(value = "")
    public String Index(ModelMap map) {

        map.addAttribute("RuteUrl", routeUrl());
        return "login";
    }


    @ResponseBody
    @RequestMapping(value = "/tologin" )
    public ReSultMode tologin(@RequestParam("loginName") String loginName, @RequestParam("passWrod") String passWrod, @RequestParam("code") String code) {
        ReSultMode res = new ReSultMode();
        res.setCode(-11);
        res.setMsg("登录失败");
        try {
            List<VUserrole> adminRole = null;
            String vcode = (String) request.getSession().getAttribute(RandomValidateCodeUtil.RANDOMCODEKEY);
            if (!StringHelper.isEmpty(vcode) && !vcode.equals(code)) {

                res.setMsg("验证码有误");
            }
            //List<VUserrole> test=vUserroleMapper.selectList(new QueryWrapper<>());
            //adminRole = vUserroleMapper.listwhere(" loginname='" + loginName + "' and  password='" + passWrod + "' ");
            QueryWrapper<VUserrole> wrapper = new QueryWrapper<>();
            wrapper.eq("loginname",loginName);
            wrapper.eq("password",passWrod);

            adminRole = vUserroleMapper.selectList(wrapper);
           // adminRole = commonBusinessDao.mylist();
            //  List<LinkedHashMap<String, Object>> list2=commonDao.listMapBySql("SELECT * from v_userrole where loginname='" + loginName + "' and password='" + passWrod + "' ");

            boolean IsHaveP = false;//是否有权限登录

            if ((adminRole != null && adminRole.size() > 0)) // 账号是否存在，添加权限配置
            {
                AdminUserInfo UserInfor = new AdminUserInfo();
                UserInfor.setUserTypes(adminRole.get(0).getUsertype());
                UserInfor.setId(adminRole.get(0).getId());
                UserInfor.setUserName(adminRole.get(0).getLoginname());
                UserInfor.setRoleId(adminRole.get(0).getRoleid());
                UserInfor.setPassword(adminRole.get(0).getPassword());
                UserInfor.setCompanyid(adminRole.get(0).getCompanyid());
                UserInfor.setCompanyName(adminRole.get(0).getCompanyname());
                if (adminRole.get(0).getDepartmentid() != 0) {
                    RmsDepartment dpItem = departmentDao.getOne( new QueryWrapper<RmsDepartment>().eq("id",adminRole.get(0).getDepartmentid()));
                    if (dpItem != null) {
                        UserInfor.setDepartmentId(dpItem.getId());
                        UserInfor.setDepartmentName(dpItem.getName());
                    }
                }
                IsHaveP = true;
                if (IsHaveP)//可以登录
                {
                    UserInfor.setListManusD(roleDao.GetRoleListManusD2(adminRole.get(0).getJurisdiction()));
                    if (UserInfor.getListManusD() == null) {
                        res.setMsg("无权限登录");
                    } else {
                        setUserData(UserInfor);
                        res.setCode(11);
                        res.setMsg("登录成功");
                    }
                }
            } else {
                //  return RedirectToAction("index", "Login");
                // 如果我们进行到这一步时某个地方出错，则重新显示表单
                res.setMsg("账号或者密码有误");
            }
        } catch (Exception ex) {
            res.setCode(-13);
            res.setMsg("系统出错" + ex.toString());
            log.error("登录出错",ex);
        }

        return res;
    }

    /**
     * 生成验证码
     */

    @RequestMapping(value = "/getVerify")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            log.error("获取验证码失败>>>>   ", e);
        }
    }

}
