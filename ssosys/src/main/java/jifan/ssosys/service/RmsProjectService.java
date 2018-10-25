package jifan.ssosys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import jifan.ssosys.entity.RmsProject;


public interface RmsProjectService extends IService<RmsProject> {
    /// <summary>
    /// 删除项目
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
     int deleteProject(int id);
}

