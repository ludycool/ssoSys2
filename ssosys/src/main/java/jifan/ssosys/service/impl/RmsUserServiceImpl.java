package jifan.ssosys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jifan.ssosys.mapper.CommonMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jifan.ssosys.entity.RmsUser;
import jifan.ssosys.mapper.RmsUserMapper;
import jifan.ssosys.service.RmsUserService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Slf4j
@Service
public class RmsUserServiceImpl extends ServiceImpl<RmsUserMapper,RmsUser> implements RmsUserService {

    @Autowired
    private CommonMapper commonMapper;
    /// <summary>
    /// 删除用户
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    @Transactional(rollbackFor = {Exception.class})
    public int deteUser(String id)
    {

        try
        {

            String sqlstr = " delete from  rms_userrole where userid='" + id + "'";//删除绑定的角色
            commonMapper.executeNonQuery(sqlstr);

            return super.removeById(id)?1:0;
        }
        catch (Exception ex)
        {
            log.error("RMS_UserBiz.deteUser", "删除用户出错", ex);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//事务回滚
            return 0;
        }

    }
}
