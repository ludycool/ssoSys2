package com.zhicheng.ssosys.controller.api;

import lombok.Data;

import java.util.List;

@Data
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

}
