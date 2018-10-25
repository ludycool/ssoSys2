package com.zhicheng.ssosys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zhicheng.ssosys.entity.RmsPermission;
import com.zhicheng.ssosys.entity.common.Manu;
import com.zhicheng.ssosys.mapper.CommonMapper;
import com.zhicheng.ssosys.service.RmsPermissionService;
import com.zhicheng.ssosys.tool.ListUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhicheng.ssosys.entity.RmsRole;
import com.zhicheng.ssosys.mapper.RmsRoleMapper;
import com.zhicheng.ssosys.service.RmsRoleService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.lang.reflect.Type;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
public class RmsRoleServiceImpl extends ServiceImpl<RmsRoleMapper,RmsRole> implements RmsRoleService {
    @Autowired
    private CommonMapper commonMapper;
    @Autowired
    private CommonService commonService;
    @Autowired
    private RmsPermissionService permissionService;

    /// <summary>
    /// 从role  的json  根据角色 获取拥有的菜单 按钮等
    /// </summary>
    /// <param name="Jurisdiction">权限json字符串</param>
    /// <returns></returns>
    public TreeMap<String, Manu> GetRoleListManusD2(String Jurisdiction) {

        Type objectType = new TypeToken<Map<String, Manu>>() {
        }.getType();
        Map<String, Manu> ListManusD = new HashMap<>();
        Gson gson = new GsonBuilder()
                .setDateFormat("yyyy-MM-dd HH:mm:ss")
                .create();
        ListManusD = gson.fromJson(Jurisdiction, objectType);
        TreeMap<String, Manu> list=new TreeMap<String, Manu>();

        Iterator titer = ListManusD.entrySet().iterator();
        while (titer.hasNext()) {
            Map.Entry ent = (Map.Entry )titer.next();
            String key = ent.getKey().toString();
            Manu value = (Manu)ent.getValue();
            list.put(key, value);
        }
        //ListManusD = JsonHelper.fromJson( ListManusD.getClass(),Jurisdiction);
        TreeMap<String, Manu> res = sortMapByValue(list);
        return res;
    }

    TreeMap<String, Manu> sortMapByValue(Map<String, Manu> map) {
        Comparator<String> comparator = new ValueComparator(map);
        //TreeMap is a map sorted by its keys.
        //The comparator is used to sort the TreeMap by keys.
        TreeMap<String, Manu> result = new TreeMap<String, Manu>(comparator);
        result.putAll(map);
        return result;
    }

    class ValueComparator implements Comparator<String> {

        TreeMap<String, Manu> map = new TreeMap<String, Manu>();

        public ValueComparator(Map<String, Manu> map) {
            this.map.putAll(map);
        }

        @Override
        public int compare(String s1, String s2) {
            Integer value1 = map.get(s1).getManuinfo().getOrderno();
            Integer value2 = map.get(s2).getManuinfo().getOrderno();
            if ((value1 - value2) > 0) {
                return 1;
            }else if (value1 - value2 ==0) {
                return s2.compareTo(s1);
            }else {
                return -1;
            }
        }
    }


    /// <summary>
    /// 删除角色
    /// </summary>
    @Transactional(rollbackFor = {Exception.class})
    public int deleteRole(String id)
    {
        try
        {

            String sqlstr = " delete from  rms_role_permission where roleid='" + id+"'";//删除角色 权限
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_userrole where roleid='" + id + "'";//删除用户角色
            commonMapper.executeNonQuery(sqlstr);

            return super.removeById(id)?1:0;//删除角色
        }
        catch (Exception ex)
        {
            log.error("RMS_RoleBiz.deleteRole", "删除角色出错", ex);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//事务回滚
            return 0;
        }
    }
    /// <summary>
    /// 从数据库视图结构  根据角色 获取拥有的菜单 按钮等 ()
    /// </summary>
    /// <param name="RoleId"></param>
    /// <returns></returns>
    public TreeMap<String, Manu> GetRoleListManusD(String RoleId)
    {
        try
        {
            Gson gson = new GsonBuilder()
                    .setDateFormat("yyyy-MM-dd HH:mm:ss")
                    .create();

            QueryWrapper qw1=new QueryWrapper();
            qw1.inSql("id","select permissionid from rms_role_permission where roleid='"+RoleId+"'");
            qw1.orderByAsc("orderno");

            TreeMap<String, Manu> listManusD = new TreeMap<>();

            List<RmsPermission> AllPermission=permissionService.list(qw1);//角色所有的权限
            if(AllPermission!=null&&AllPermission.size()>0) {

                List<RmsPermission> list_url = AllPermission.stream().filter(p -> p.getTypeid() == 0).collect(Collectors.toList());//菜单
                List<RmsPermission> list_button = AllPermission.stream().filter(p -> p.getTypeid() == 1).collect(Collectors.toList());//按钮

                if (list_url != null && list_url.size() > 0)
                {
                    for (RmsPermission item : list_url)
                    {
                        List<RmsPermission> son_button = list_button.stream().filter(p -> p.getParentid() == item.getId()).collect(Collectors.toList());//菜单的按钮
                        ListUtils.sort(son_button,true,"orderno");//排序
                        Manu manu=new Manu();
                        manu.setManuinfo(item);
                        manu.setHavebuttonsD(son_button);
                        listManusD.put(item.getPcode(),manu);
                    }
                }
            }
            return listManusD;
        }
        catch (Exception ex)
        {
            log.error("RMS_RoleBiz.GetRoleListManusD", "角色获取菜单权限出错", ex);
            return null;
        }
    }



    /// <summary>
    /// 更新权限，重新生成权限json，保存到角色里
    /// </summaryGetRoleListManusD2
    /// <param name="RoleId"></param>
    /// <returns></returns>
    public Boolean SetJurisdiction(String RoleId)
    {
        Boolean isSucces = false;

        RmsRole Rmodel = super.getById(RoleId);
        TreeMap<String, Manu> list = GetRoleListManusD(RoleId);
        if (list == null)
        {
            list = new TreeMap<String, Manu>();
        }

        if (list != null)
        {
            Gson gson = new GsonBuilder()
                    .setDateFormat("yyyy-MM-dd HH:mm:ss")
                    .create();
            String json=gson.toJson(list);

            Rmodel.setJurisdiction(json);
            List<String> columns = new ArrayList<String>();//需要更新的列
            columns.add("jurisdiction");
            QueryWrapper qw=new QueryWrapper();
            qw.eq("id",Rmodel.getId());
            long ies = commonService.updataByWrapperIn(Rmodel, columns,qw);//保存 权限json
            if (ies > 0)
            {
                isSucces = true;
            }
        }
        else
        {
            isSucces = false;
        }


        return isSucces;
    }
}
