package jifan.ssosys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jifan.ssosys.entity.VRmsMenus;
import jifan.ssosys.entity.common.TreeMenus;
import jifan.ssosys.mapper.CommonMapper;
import jifan.ssosys.tool.ListUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jifan.ssosys.entity.RmsMenus;
import jifan.ssosys.mapper.RmsMenusMapper;
import jifan.ssosys.service.RmsMenusService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class RmsMenusServiceImpl extends ServiceImpl<RmsMenusMapper, RmsMenus> implements RmsMenusService {
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
            String sqlstr = " delete from  rms_rolemanubuttons where menubuttonsid in(select id from  rms_menubuttons where manuid=" + id + ")";//删除角色菜单按钮
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_menubuttons where manuid=" + id;//删除菜单按钮
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_rolemanus where manuid=" + id;//删除菜单按钮
            commonMapper.executeNonQuery(sqlstr);
            if (super.removeById(id)) {
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
    public List<TreeMenus> GetTreeManus(List<VRmsMenus> list) {
        List<TreeMenus> resultList = new ArrayList<>();
        List<VRmsMenus> listfather = GetSonListv(list,0) ;//父项
        // 按orderno 升序
        String[] sortNameArr = {"orderno",};
        boolean[] isAscArr = {true};
        ListUtils.sort(listfather, sortNameArr, isAscArr);

        int fatherCout = listfather.size();
        for (int i = 0; i < fatherCout; i++) {
            TreeMenus resultItem = new TreeMenus();
            resultItem.setId(listfather.get(i).getId());
            resultItem.setParentManuId(listfather.get(i).getParentmanuid());
            resultItem.setOrderNo(listfather.get(i).getOrderno());
            resultItem.setName(listfather.get(i).getManuname());
            resultItem.setIconCls(listfather.get(i).getIcon());
            resultItem.setMicon(listfather.get(i).getMicon());
            resultItem.setUrl(listfather.get(i).getUrl());
            resultItem.setValuename(listfather.get(i).getValuename());
            resultItem.setTypeid(listfather.get(i).getTypeid());
            resultItem.setRemarks(listfather.get(i).getRemarks());
            resultItem.setProjectname(listfather.get(i).getProjectname());
            List<TreeMenus> Son = GetTreeManus(list, listfather.get(i));
            resultItem.setChildren(Son);
            resultList.add(resultItem);
        }
        return resultList;
    }

    public List<TreeMenus> GetTreeManus(List<VRmsMenus> listAll, VRmsMenus item) {
        List<TreeMenus> resultList = new ArrayList<TreeMenus>();
        List<VRmsMenus> list =GetSonListv(listAll,item.getId());
        // 按orderno 升序
        String[] sortNameArr = {"orderno",};
        boolean[] isAscArr = {true};
        ListUtils.sort(list, sortNameArr, isAscArr);
        for (int i = 0; i < list.size(); i++) {

            TreeMenus resultItem = new TreeMenus();
            resultItem.setId(list.get(i).getId());
            resultItem.setParentManuId(list.get(i).getParentmanuid());
            resultItem.setOrderNo(list.get(i).getOrderno());
            resultItem.setName(list.get(i).getManuname());
            resultItem.setIconCls(list.get(i).getIcon());
            resultItem.setMicon(list.get(i).getMicon());
            resultItem.setUrl(list.get(i).getUrl());
            resultItem.setValuename(list.get(i).getValuename());
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
    public List<RmsMenus> GetSon(int id) {
        QueryWrapper wrapper=new QueryWrapper();
        wrapper.eq("1",1);
        List<RmsMenus> listData =super.list(wrapper);//所有的数据
        List<RmsMenus> listAll = new ArrayList<RmsMenus>();
        RmsMenus parent =null;
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
        List<RmsMenus> listson =GetSonList(listData,id);
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
    private List<RmsMenus> GetSonT(RmsMenus item, List<RmsMenus> listData) {
        List<RmsMenus> listAll = new ArrayList<>();
        listAll.add(item);
        List<RmsMenus> listson = GetSonList(listData,item.getId());
        if (listson != null && listson.size() > 0) {
            for (int i = 0; i < listson.size(); i++) {
                listAll.addAll(GetSonT(listson.get(i), listData));
            }
        }
        return listAll;


    }
    private List<VRmsMenus>  GetSonListv (List<VRmsMenus> list,int id)
    {
        List<VRmsMenus> son=new ArrayList<>();
        for (int i = 0; i < list.size(); i++)
        {
            if(list.get(i).getParentmanuid()==id)
            {
                son.add(list.get(i));
            }
        }
        return  son;
    }
    private List<RmsMenus>  GetSonList (List<RmsMenus> list,int id)
    {
        List<RmsMenus> son=new ArrayList<>();
        for (int i = 0; i < list.size(); i++)
        {
            if(list.get(i).getParentmanuid()==id)
            {
                son.add(list.get(i));
            }
        }
        return  son;
    }

}
