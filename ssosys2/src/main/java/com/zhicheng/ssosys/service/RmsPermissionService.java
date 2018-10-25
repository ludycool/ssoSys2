package com.zhicheng.ssosys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhicheng.ssosys.controller.api.TreeMenus;
import com.zhicheng.ssosys.entity.RmsPermission;
import com.zhicheng.ssosys.entity.VPermission;

import java.util.List;


public interface RmsPermissionService extends IService<RmsPermission> {

    /// <summary>
    /// 删除菜单
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    int deletemenu(int id);

    /// <summary>
    /// 转化数型菜单
    /// </summary>
    /// <param name="mql"></param>
    /// <returns></returns>
    List<TreeMenus> GetTreeManus(List<VPermission> list);

    /// <summary>
    /// 根据自己的id 返回所有子集包括自己 的部门
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    List<RmsPermission> GetSon(int id);
}

