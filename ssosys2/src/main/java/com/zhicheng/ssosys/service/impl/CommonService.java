package com.zhicheng.ssosys.service.impl;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.TableInfo;
import com.baomidou.mybatisplus.core.toolkit.TableInfoHelper;
import com.zhicheng.ssosys.mapper.CommonMapper;

import com.zhicheng.ssosys.tool.JsonHelper;
import com.zhicheng.ssosys.tool.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Repository
public class CommonService {

    @Autowired
    private CommonMapper commonMapper;

    static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 根据条件部分更新
     *
     * @param item    实体对象
     * @param columns 需要 更新的列
     * @param wrapper 条件 条件不传， 根据主键更新
     * @param <T>
     * @return
     */
    public <T> long updataByWrapperIn(T item, List<String> columns, Wrapper wrapper) {
        Class<?> cls = item.getClass();
        TableInfo tableInfo = TableInfoHelper.getTableInfo(cls);
        String tableName = tableInfo.getTableName();

        Map<String, Object> map = JsonHelper.object2Map(item);
        if (wrapper == null)// 条件不传， 根据主键更新
        {
            wrapper = new QueryWrapper<>();
            String primaryKey = tableInfo.getKeyProperty();
            ((QueryWrapper) wrapper).eq(primaryKey, map.get(primaryKey));
        }

        String[] keys = new String[map.keySet().size()];
        map.keySet().toArray(keys);
        for (String key : keys) {
            if (!columns.contains(key)) {
                map.remove(key);
            } else {//时间类型过滤，mysql 不用，pgsql需要时间格式
                Object v = map.get(key);
                if (StringHelper.isDate(String.valueOf(v))) {
                    try {
                        map.put(key, formatter.parse(v.toString()));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
            /*else if(key.contains("time")){//时间类型过滤，mysql 不用，pgsql需要时间格式
                Object v=map.get(key);
                    try {
                        map.put(key,formatter.parse(v.toString()));
                    } catch (ParseException e) {
                        //e.printStackTrace();
                    }
            }*/

        }
        return commonMapper.update(tableName, map, wrapper);
    }

    /**
     * 根据条件部分更新
     *
     * @param item    实体对象
     * @param columns 不需要 更新的列
     * @param wrapper 条件  条件不传， 根据主键更新
     * @param <T>
     * @return
     */
    public <T> int updataByWrapperNotIn(T item, List<String> columns, Wrapper wrapper) {
        Class<?> cls = item.getClass();
        TableInfo tableInfo = TableInfoHelper.getTableInfo(cls);
        String tableName = tableInfo.getTableName();
        String primaryKey = tableInfo.getKeyProperty();//主键不更新

        Map<String, Object> map = JsonHelper.object2Map(item);
        if (wrapper == null)// 条件不传， 根据主键更新
        {
            wrapper = new QueryWrapper<>();
            ((QueryWrapper) wrapper).eq(primaryKey, map.get(primaryKey));
        }

        map.remove(primaryKey);//主键不更新
        String[] keys = new String[map.keySet().size()];
        map.keySet().toArray(keys);
        for (String key : keys) {
            if (columns.contains(key)) {
                map.remove(key);
            } else {//时间类型过滤，mysql 不用，pgsql需要时间格式
                Object v = map.get(key);
                if (StringHelper.isDate(String.valueOf(v))) {
                    try {
                        map.put(key, formatter.parse(v.toString()));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return (int) commonMapper.update(tableName, map, wrapper);
    }

}
