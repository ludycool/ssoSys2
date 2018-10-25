package com.zhicheng.ssosys.config;

import com.zhicheng.ssosys.tool.StringHelper;
import org.springframework.context.ConfigurableApplicationContext;

public class appConfig {
  public  static ConfigurableApplicationContext context;

  private static String _sysRoleId="";

  /**
   * 获取系统管理员id
   * @return
   */
  public static String getSysRoleId() {
    if(StringHelper.isEmpty(_sysRoleId)&&context!=null)
    {
      _sysRoleId=context.getEnvironment().getProperty("myapp.sysRoleId");
    }
    return _sysRoleId;
  }

public  final  static String USER_SESSION_KEY="sso_session_user_info";
}
