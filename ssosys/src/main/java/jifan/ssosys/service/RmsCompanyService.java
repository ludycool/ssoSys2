package jifan.ssosys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import jifan.ssosys.entity.RmsCompany;


public interface RmsCompanyService extends IService<RmsCompany> {

    /// <summary>
    /// 删除公司  会删除公司的一切
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
     int deleteRmsCompany(int id);
}

