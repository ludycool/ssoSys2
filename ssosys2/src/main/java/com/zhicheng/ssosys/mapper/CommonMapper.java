package com.zhicheng.ssosys.mapper;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public interface CommonMapper {

    /**
     * 条件 获取数量
     * @param tableName 表名
     * @param whereStr where 后面的条件
     * @return 数量
     */
    long  count(@Param("tableName") String tableName, @Param("whereStr") String whereStr);

    /**
     * 执行查询，并返回结果集的第一行的第一列
     执行多条
     修改数据库连接参数加上allowMultiQueries=true，如：
     hikariConfig.security.jdbcUrl=jdbc:mysql://xx.xx.xx:3306/xxxxx?characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&allowMultiQueries=true
     直接写多条语句，用“;”隔开即可
     * @param sql sql
     * @return
     */
    Object  executeScalar(String sql);


    /**
     *  执行sql 返回受影响行数
     * @param sql sql
     * @return
     */
    long  executeNonQuery(String sql);

    /**
     * ִ执行sql 返回结果集
     * @param sql
     * @return
     */
    List<LinkedHashMap<String, Object>> listMapBySql(String sql);


    /**
     * 条件查询
     * @param field 所需要的字段
     * @param tableName 表名
     * @param ew 条件
     * @return
     */
    List<LinkedHashMap<String, Object>> listMapByWrapper(@Param("field") String field, @Param("tableName") String tableName, @Param("ew") Wrapper ew);


    /**
     * 条件查询 页
     * @param field 所需要的字段
     * @param tableName 表名
     * @param ew 条件
     * @return
     */
    IPage<LinkedHashMap<String, Object>> listMapByWrapper(IPage page, @Param("field") String field, @Param("tableName") String tableName, @Param("ew") Wrapper ew);

    /**
     * 执行sql 返回结果集 单行
     * @param sql
     * @return
     */
    Map<String, Object> getMapBySql(String sql);

    /**
     * 添加
     * @param tableName
     * @param item
     * @return
     */
    int insert(@Param("tableName") String tableName, @Param("item") Map<String, Object> item);

    /**
     * 更新
     * @param tableName
     * @param item
     * @param ew 条件
     * @return
     */
    long update(@Param("tableName") String tableName, @Param("item") Map<String, Object> item, @Param("ew") Wrapper ew);


    /**
     *  条件 删除
     * @param tableName 表名
     * @param whereStr where 后面的条件
     * @return 受影响行数
     */
    long  delete(@Param("tableName") String tableName, @Param("whereStr") String whereStr);
}
