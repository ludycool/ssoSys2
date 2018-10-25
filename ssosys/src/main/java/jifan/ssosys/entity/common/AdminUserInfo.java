package jifan.ssosys.entity.common;

import java.util.Map;

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
    /// 拥有的菜单
    /// </summary>
    private Map<String, Manu> ListManusD;

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public int getDepartmentId() {
        return DepartmentId;
    }

    public void setDepartmentId(int departmentId) {
        DepartmentId = departmentId;
    }

    public int getCompanyid() {
        return companyid;
    }

    public void setCompanyid(int companyid) {
        this.companyid = companyid;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDepartmentName() {
        return DepartmentName;
    }

    public void setDepartmentName(String departmentName) {
        DepartmentName = departmentName;
    }

    public String getRoleId() {
        return RoleId;
    }

    public void setRoleId(String roleId) {
        RoleId = roleId;
    }

    public int getUserTypes() {
        return UserTypes;
    }

    public void setUserTypes(int userTypes) {
        UserTypes = userTypes;
    }

    public Map<String, Manu> getListManusD() {
        return ListManusD;
    }

    public void setListManusD(Map<String, Manu> listManusD) {
        ListManusD = listManusD;
    }
}
