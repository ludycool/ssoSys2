package jifan.ssosys.entity.common;

import java.util.List;

public class TreeMenus {
    private int id;
    private int parentManuId;
    private int orderNo;
    private String name;
    private String url;
    private String iconCls;
    private String micon;

    private String remarks;
    /// <summary>
    /// 类型 0顶级 1集合（有子集 当包用） 2 连接（带地址 提供跳转功能）
    /// </summary>
    private short typeid;
    /// <summary>
    /// 值、编号
    /// </summary>
    private String valuename;
    /// <summary>
    /// 项目编号
    /// </summary>
    private String projectname;
    private List<TreeMenus> children;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getParentManuId() {
        return parentManuId;
    }

    public void setParentManuId(int parentManuId) {
        this.parentManuId = parentManuId;
    }

    public int getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(int orderNo) {
        this.orderNo = orderNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getMicon() {
        return micon;
    }

    public void setMicon(String micon) {
        this.micon = micon;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public short getTypeid() {
        return typeid;
    }

    public void setTypeid(short typeid) {
        this.typeid = typeid;
    }

    public String getValuename() {
        return valuename;
    }

    public void setValuename(String valuename) {
        this.valuename = valuename;
    }

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    public List<TreeMenus> getChildren() {
        return children;
    }

    public void setChildren(List<TreeMenus> children) {
        this.children = children;
    }
}
