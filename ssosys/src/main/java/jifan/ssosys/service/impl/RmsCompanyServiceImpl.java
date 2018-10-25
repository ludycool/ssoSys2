package jifan.ssosys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jifan.ssosys.mapper.CommonMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jifan.ssosys.entity.RmsCompany;
import jifan.ssosys.mapper.RmsCompanyMapper;
import jifan.ssosys.service.RmsCompanyService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Slf4j
@Service
public class RmsCompanyServiceImpl extends ServiceImpl<RmsCompanyMapper,RmsCompany> implements RmsCompanyService {

    @Autowired
    private CommonMapper commonMapper;

    /// <summary>
    /// 删除公司  会删除公司的一切
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    @Transactional(rollbackFor = {Exception.class})
    public int deleteRmsCompany(int id)
    {
        try
        {
            String sqlstr = " delete from  rms_department where companyid=" + id;//删除部门
            commonMapper.executeNonQuery(sqlstr);

            sqlstr = " delete from  rms_project where companyid=" + id;//删除项目
            commonMapper.executeNonQuery(sqlstr);

            sqlstr = " delete from  rms_userrole where userid in( select id from rms_user where companyid=" + id + ")";//删除用户绑定的角色
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_user where companyid=" + id;//删除用户
            commonMapper.executeNonQuery(sqlstr);

            sqlstr = " delete from  rms_rolemanus where roleid in ( select id from rms_role where companyid=" + id + ")";//删除角色菜单
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_rolemanubuttons where roleid in ( select id from rms_role where companyid=" + id + ")";//删除角色按钮
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = "  delete from rms_role where companyid=" + id;//删除角色
            commonMapper.executeNonQuery(sqlstr);

            sqlstr = " delete from  rms_menubuttons where manuid in ( select id from rms_menus where companyid=" + id + ")";//删除菜单按钮
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete  from rms_menus where companyid=" + id;//删除菜单
            commonMapper.executeNonQuery(sqlstr);

            if (super.removeById(id))
            {
                return 1;
            }
            else
            {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                return 0;
            }
        }
        catch (Exception ex)
        {
            log.error("RmsCompanyServiceImpl.deleterms_company", "删除公司出错", ex);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//事务回滚
            return 0;
        }


    }
}
