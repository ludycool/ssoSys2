package com.zhicheng.ssosys.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhicheng.ssosys.annotation.DataSource;
import com.zhicheng.ssosys.entity.Teacher;
import com.zhicheng.ssosys.enums.DataSourceEnum;
import com.zhicheng.ssosys.mapper.TeacherMapper;
import com.zhicheng.ssosys.service.TeacherService;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper,Teacher> implements TeacherService {

    @Override
    @DataSource(DataSourceEnum.DB2)
    public boolean save(Teacher entity) {
        return super.save(entity);
    }

    @Override
    @DataSource(DataSourceEnum.DB2)
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }

    @Override
    @DataSource(DataSourceEnum.DB2)
    public boolean updateById(Teacher entity) {
        return super.updateById(entity);
    }

    @Override
    @DataSource(DataSourceEnum.DB2)
    public Teacher getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    @DataSource(DataSourceEnum.DB2)
    public List<Teacher> list(Wrapper<Teacher> wrapper) {
        return super.list(wrapper);
    }

    @Override
    @DataSource(DataSourceEnum.DB2)
    public IPage<Teacher> page(IPage<Teacher> page, Wrapper<Teacher>  wrapper) {
        return super.page(page, wrapper);
    }
}
