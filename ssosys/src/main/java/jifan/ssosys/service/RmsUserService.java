package jifan.ssosys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import jifan.ssosys.entity.RmsUser;


public interface RmsUserService extends IService<RmsUser> {
    /// <summary>
    /// 删除用户
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    int deteUser(String id);
}

