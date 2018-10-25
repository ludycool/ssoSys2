package jifan.ssosys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jifan.ssosys.mapper.CommonMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jifan.ssosys.entity.RmsProject;
import jifan.ssosys.mapper.RmsProjectMapper;
import jifan.ssosys.service.RmsProjectService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Slf4j
@Service
public class RmsProjectServiceImpl extends ServiceImpl<RmsProjectMapper,RmsProject> implements RmsProjectService {
    @Autowired
    private CommonMapper commonMapper;
    /// <summary>
    /// 删除项目
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    @Transactional(rollbackFor = {Exception.class})
    public int deleteProject(int id)
    {

        try
        {
            String sqlstr = " delete from  rms_rolemanubuttons where roleid in(select id from  rms_role where projectid=" + id + ")";//删除角色菜单按钮
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_rolemanus where roleid in(select id from  rms_role where projectid=" + id + ")";//删除角色菜单
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_menubuttons where manuid in (select id from  rms_menus where projectid=" + id + ")";//删除菜单按钮
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_role where projectid=" + id;//删除角色
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_menus where projectid=" + id;//删除菜单
            commonMapper.executeNonQuery(sqlstr);

            if (super.removeById(id))
            {
                return 1;
            }
            else
            {

                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//事务回滚
                return 0;
            }

        }
        catch (Exception ex)
        {
            log.error("rms_projectBiz.deleteproject", "删除项目出错", ex);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//事务回滚
            return 0;
        }
    }
}
