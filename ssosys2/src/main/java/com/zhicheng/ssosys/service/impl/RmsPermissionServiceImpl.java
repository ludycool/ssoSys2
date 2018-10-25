package com.zhicheng.ssosys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhicheng.ssosys.controller.api.TreeMenus;
import com.zhicheng.ssosys.entity.VPermission;
import com.zhicheng.ssosys.mapper.CommonMapper;
import com.zhicheng.ssosys.tool.ListUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhicheng.ssosys.entity.RmsPermission;
import com.zhicheng.ssosys.mapper.RmsPermissionMapper;
import com.zhicheng.ssosys.service.RmsPermissionService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class RmsPermissionServiceImpl extends ServiceImpl<RmsPermissionMapper,RmsPermission> implements RmsPermissionService {
    @Autowired
    private CommonMapper commonMapper;

    /// <summary>
    /// 删除菜单
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    @Transactional(rollbackFor = {Exception.class})
    public int deletemenu(int id) {

        try {
            String sqlstr = " delete from  rms_role_permission where permissionid in(select id from  rms_permission where id=" + id + " or ( parentid=" + id + " and typeid=1))";//删除角色的菜单\按钮
            commonMapper.executeNonQuery(sqlstr);

            sqlstr = " delete from  rms_permission where id=" + id+" or ( parentid=" + id + " and typeid=1)";//删除菜单和 按钮
            long res= commonMapper.executeNonQuery(sqlstr);
            if (res>0) {
                return 1;
            } else {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                return 0;
            }
        } catch (Exception ex) {
            log.error("RMS_MenusBiz.deletemenu", "删除菜单出错", ex);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//事务回滚
            return 0;
        }

    }

    /// <summary>
    /// 转化数型菜单
    /// </summary>
    /// <param name="mql"></param>
    /// <returns></returns>
    public List<TreeMenus> GetTreeManus(List<VPermission> list) {
        List<TreeMenus> resultList = new ArrayList<>();
        List<VPermission> listfather = GetSonListv(list,0) ;//父项
        
        // 按orderno 升序
        ListUtils.sort(listfather, true, "orderno");

        int fatherCout = listfather.size();
        for (int i = 0; i < fatherCout; i++) {
            TreeMenus resultItem = new TreeMenus();
            resultItem.setId(listfather.get(i).getId());
            resultItem.setParentManuId(listfather.get(i).getParentid());
            resultItem.setOrderNo(listfather.get(i).getOrderno());
            resultItem.setName(listfather.get(i).getPname());
            resultItem.setIconCls(listfather.get(i).getIcon());
            resultItem.setMicon(listfather.get(i).getColor());
            resultItem.setUrl(listfather.get(i).getUrl());
            resultItem.setValuename(listfather.get(i).getPcode());
            resultItem.setTypeid(listfather.get(i).getTypeid());
            resultItem.setRemarks(listfather.get(i).getRemarks());
            resultItem.setProjectname(listfather.get(i).getProjectname());
            List<TreeMenus> Son = GetTreeManus(list, listfather.get(i));
            resultItem.setChildren(Son);
            resultList.add(resultItem);
        }
        return resultList;
    }

    public List<TreeMenus> GetTreeManus(List<VPermission> listAll, VPermission item) {
        List<TreeMenus> resultList = new ArrayList<TreeMenus>();
        List<VPermission> list =GetSonListv(listAll,item.getId());
        // 按orderno 升序
        String[] sortNameArr = {"orderno",};
        boolean[] isAscArr = {true};
        ListUtils.sort(list, sortNameArr, isAscArr);
        for (int i = 0; i < list.size(); i++) {

            TreeMenus resultItem = new TreeMenus();
            resultItem.setId(list.get(i).getId());
            resultItem.setParentManuId(list.get(i).getParentid());
            resultItem.setOrderNo(list.get(i).getOrderno());
            resultItem.setName(list.get(i).getPname());
            resultItem.setIconCls(list.get(i).getIcon());
            resultItem.setMicon(list.get(i).getColor());
            resultItem.setUrl(list.get(i).getUrl());
            resultItem.setValuename(list.get(i).getPcode());
            resultItem.setTypeid(list.get(i).getTypeid());
            resultItem.setRemarks(list.get(i).getRemarks());
            resultItem.setProjectname(list.get(i).getProjectname());

            List<TreeMenus> Son = GetTreeManus(listAll, list.get(i));
            resultItem.setChildren(Son);
            resultList.add(resultItem);
        }
        return resultList;
    }

    /// <summary>
    /// 根据自己的id 返回所有子集包括自己 的部门
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public List<RmsPermission> GetSon(int id) {
        QueryWrapper wrapper=new QueryWrapper();
        wrapper.eq("1",1);
        List<RmsPermission> listData =super.list(wrapper);//所有的数据
        List<RmsPermission> listAll = new ArrayList<RmsPermission>();
        RmsPermission parent =null;
        for (int i = 0; i < listData.size(); i++)
        {
            if(listData.get(i).getId()==id)
            {
                parent=listData.get(i);
                break;
            }
        }
        if (parent != null) {
            listAll.add(parent);
        }
        List<RmsPermission> listson =GetSonList(listData,id);
        if (listson != null && listson.size() > 0) {
            for (int i = 0; i < listson.size(); i++) {
                listAll.addAll(GetSonT(listson.get(i), listData));

            }
        }
        return listAll;
    }

    /// <summary>
    /// 递归  根据自己的id 返回所有子集包括自己 的id
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    private List<RmsPermission> GetSonT(RmsPermission item, List<RmsPermission> listData) {
        List<RmsPermission> listAll = new ArrayList<>();
        listAll.add(item);
        List<RmsPermission> listson = GetSonList(listData,item.getId());
        if (listson != null && listson.size() > 0) {
            for (int i = 0; i < listson.size(); i++) {
                listAll.addAll(GetSonT(listson.get(i), listData));
            }
        }
        return listAll;
    }
    private List<VPermission>  GetSonListv (List<VPermission> list,int id)
    {
        List<VPermission> son=new ArrayList<>();
        for (int i = 0; i < list.size(); i++)
        {
            if(list.get(i).getParentid()==id)
            {
                son.add(list.get(i));
            }
        }
        return  son;
    }
    private List<RmsPermission>  GetSonList (List<RmsPermission> list,int id)
    {
        List<RmsPermission> son=new ArrayList<>();
        for (int i = 0; i < list.size(); i++)
        {
            if(list.get(i).getParentid()==id)
            {
                son.add(list.get(i));
            }
        }
        return  son;
    }

}
