package com.zhicheng.ssosys.entity.common;

import com.zhicheng.ssosys.entity.RmsPermission;
import lombok.Data;

import java.util.List;

@Data
public class Manu {

    /**
     * 菜单信息
     */
    private RmsPermission manuinfo;

    /// <summary>
    ///当前角色 在这个菜单 拥有的按钮
    /// </summary>
    private List<RmsPermission> havebuttonsD;
}
