package jifan.ssosys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import jifan.ssosys.entity.RmsRole;
import jifan.ssosys.entity.common.Manu;

import java.util.Map;


public interface RmsRoleService extends IService<RmsRole> {

    /// <summary>
    /// 从role  的json  根据角色 获取拥有的菜单 按钮等
    /// </summary>
    /// <param name="Jurisdiction">权限json字符串</param>
    /// <returns></returns>
     Map<String, Manu> GetRoleListManusD2(String Jurisdiction) ;

    /// <summary>
    /// 删除角色
    /// </summary>
    int deleteRole(String id);


    /// <summary>
    /// 根据角色 获取拥有的菜单 按钮等 
    /// </summary>
    /// <param name="RoleId"></param>
    /// <returns></returns>
    Map<String, Manu> GetRoleListManusD(String RoleId);

    /// <summary>
    /// 更新权限，重新生成权限json，保存到角色里
    /// </summary>
    /// <param name="RoleId"></param>
    /// <returns></returns>
    Boolean SetJurisdiction(String RoleId);
}



