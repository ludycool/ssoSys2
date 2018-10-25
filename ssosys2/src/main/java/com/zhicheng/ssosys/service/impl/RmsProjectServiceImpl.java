package com.zhicheng.ssosys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhicheng.ssosys.entity.RmsProject;
import com.zhicheng.ssosys.mapper.CommonMapper;
import com.zhicheng.ssosys.mapper.RmsProjectMapper;
import com.zhicheng.ssosys.service.RmsProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
            String sqlstr = " delete from  rms_role_permission where roleid in(select id from  rms_role where projectid=" + id + ")";//删除角色 权限
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_userrole where roleid in(select id from  rms_role where projectid=" + id + ")";//删除 绑定的角色
            commonMapper.executeNonQuery(sqlstr);

            sqlstr = " delete from  rms_role where projectid=" + id;//删除角色
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_permission where projectid=" + id;//删除菜单
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
