package com.zhicheng.ssosys.entity.common;

import lombok.Data;

import java.util.Map;

@Data
public class AdminUserInfo {

    /// <summary>
    /// 用户Id
    /// </summary>
    private String Id;
    /// <summary>
    /// 用户名
    /// </summary>
    private String UserName;
    /// <summary>
    /// 密码
    /// </summary>
    private String Password;
    /// <summary>
    /// 部门
    /// </summary>
    private int DepartmentId;
    /// <summary>
    /// 当前公司
    /// </summary>
    private int companyid;
    /// <summary>
    /// 当前公司
    /// </summary>
    private String companyName;

    /// <summary>
    /// 部门单位
    /// </summary>
    private String DepartmentName;
    /// <summary>
    /// 角色Id
    /// </summary>
    private String RoleId;
    /// <summary>
    /// 用户类型
    /// </summary>
    private int UserTypes;

    /// <summary>
    /// 拥有的 权限
    /// </summary>
    private Map<String, Manu> ListManusD;

}
