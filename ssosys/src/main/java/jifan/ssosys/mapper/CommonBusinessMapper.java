package jifan.ssosys.mapper;

import jifan.ssosys.entity.VUserrole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface CommonBusinessMapper {


    //sList<VUserrole> listWhereV_userrole(@Param("whereStr") String whereStr);
    List<VUserrole> mylist();
}
