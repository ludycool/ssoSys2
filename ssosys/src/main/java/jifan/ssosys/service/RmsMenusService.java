package jifan.ssosys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import jifan.ssosys.entity.RmsMenus;
import jifan.ssosys.entity.VRmsMenus;
import jifan.ssosys.entity.common.TreeMenus;

import java.util.List;


public interface RmsMenusService extends IService<RmsMenus> {

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
    List<TreeMenus> GetTreeManus(List<VRmsMenus> list);

    /// <summary>
    /// 根据自己的id 返回所有子集包括自己 的部门
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    List<RmsMenus> GetSon(int id);
}

