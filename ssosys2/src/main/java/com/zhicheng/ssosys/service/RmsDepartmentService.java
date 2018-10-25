package com.zhicheng.ssosys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhicheng.ssosys.entity.RmsDepartment;

import java.util.List;


public interface RmsDepartmentService extends IService<RmsDepartment> {

    /// <summary>
    /// 删除部门
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    int deleteDepartment(int id);
    String GetTree(List<RmsDepartment> list);
}

