package com.zhicheng.ssosys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhicheng.ssosys.entity.SysDictionary;

import java.util.List;


public interface SysDictionaryService extends IService<SysDictionary> {

    /// <summary>
    /// 词典树型数据生成json！！
    /// </summary>
    /// <param name="Id">角色的Id</param>
    /// <returns></returns>
     String GetTree(List<SysDictionary> list);
}

