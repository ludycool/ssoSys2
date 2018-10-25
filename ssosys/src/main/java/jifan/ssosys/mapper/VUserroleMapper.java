package jifan.ssosys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import jifan.ssosys.entity.VUserrole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VUserroleMapper extends BaseMapper<VUserrole> {

    //where后面的条件 拼接
    List<VUserrole> listwhere(@Param("whereStr") String whereStr);
}

