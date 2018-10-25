package com.zhicheng.ssosys.mapper;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.zhicheng.ssosys.entity.VPermission;
import com.zhicheng.ssosys.entity.VUserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommonBusinessMapper {


    List<VUserRole> listWhereVUserRole(@Param("ew") Wrapper ew);

    List<VPermission> listWhereVPermission(@Param("ew") Wrapper ew);
}
