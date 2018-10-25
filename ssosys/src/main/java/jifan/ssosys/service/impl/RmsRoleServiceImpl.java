package jifan.ssosys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jifan.ssosys.entity.common.Manu;
import jifan.ssosys.entity.common.m_v_menubuttons;
import jifan.ssosys.entity.common.m_v_rolemanubuttons;
import jifan.ssosys.entity.common.m_v_rolemanus;
import jifan.ssosys.mapper.CommonMapper;
import jifan.ssosys.tool.JsonHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jifan.ssosys.entity.RmsRole;
import jifan.ssosys.mapper.RmsRoleMapper;
import jifan.ssosys.service.RmsRoleService;
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

    /// <summary>
    /// 从role  的json  根据角色 获取拥有的菜单 按钮等
    /// </summary>
    /// <param name="Jurisdiction">权限json字符串</param>
    /// <returns></returns>
    public Map<String, Manu> GetRoleListManusD2(String Jurisdiction) {

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
            TreeMap<String, m_v_rolemanubuttons> listbutton = value.getHavebuttonsD();
            value.setHavebuttonsD(sortButtonMapByValue(listbutton));
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

    TreeMap<String, m_v_rolemanubuttons> sortButtonMapByValue(Map<String, m_v_rolemanubuttons> map) {
        Comparator<String> comparator = new ButtunComparator(map);
        //TreeMap is a map sorted by its keys.
        //The comparator is used to sort the TreeMap by keys.
        TreeMap<String, m_v_rolemanubuttons> result = new TreeMap<String, m_v_rolemanubuttons>(comparator);
        result.putAll(map);
        return result;
    }

    class ButtunComparator implements Comparator<String> {

        TreeMap<String, m_v_rolemanubuttons> map = new TreeMap<String, m_v_rolemanubuttons>();

        public ButtunComparator(Map<String, m_v_rolemanubuttons> map) {
            this.map.putAll(map);
        }

        @Override
        public int compare(String s1, String s2) {
            Integer value1 =map.get(s1).getOrderno();
            Integer value2 = map.get(s2).getOrderno();
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
            String sqlstr = " delete from  rms_rolemanus where roleid='" + id+"'";//删除角色菜单
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_rolemanubuttons where roleid='" + id+"'";//删除角色按钮
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
            Type objectType1 = new TypeToken<List<m_v_rolemanus>>() {
            }.getType();
            Type objectType2 = new TypeToken<List<m_v_rolemanubuttons>>() {
            }.getType();
            Type objectType3= new TypeToken<List<m_v_menubuttons>>() {
            }.getType();
            QueryWrapper qw1=new QueryWrapper();
            qw1.eq("roleid",RoleId);
            qw1.orderByAsc("orderno");

            List<LinkedHashMap<String,Object>> manus_m=commonMapper.listMapByWrapper("*","v_rolemanus",qw1);
            String str_r_m=gson.toJson(manus_m);
            List<m_v_rolemanus> manus  = gson.fromJson(str_r_m, objectType1);//所有的菜单


            QueryWrapper qw2=new QueryWrapper();
            qw2.eq("roleid",RoleId);
            qw2.orderByAsc("orderno");

            List<LinkedHashMap<String,Object>> map_rmb=commonMapper.listMapByWrapper("*","v_rolemanubuttons",qw2);
            String str_rmb=gson.toJson(map_rmb);
            List<m_v_rolemanubuttons> buttons = gson.fromJson(str_rmb, objectType2);//角色拥有的菜单的所有按钮

            QueryWrapper qw3=new QueryWrapper();
            qw3.eq("1",1);

            List<LinkedHashMap<String,Object>> map_mb=commonMapper.listMapByWrapper("*","v_menubuttons",qw3);
            String str_mb=gson.toJson(map_mb);
            List<m_v_menubuttons> AllButtons = gson.fromJson(str_mb, objectType3);//所有菜单的所有按钮

            if (manus != null && manus.size() > 0)
            {
                Map<String, Manu> ListManusD = new HashMap<>();
                for (m_v_rolemanus item : manus)
                {

                    List<m_v_rolemanubuttons> Onehave = buttons.stream().filter(p->p.getManuid()==item.getManuid()).collect(Collectors.toList());//拥有的按钮
                    Map<String, m_v_rolemanubuttons> havebuttonsD = Onehave.stream().collect(Collectors.toMap(m_v_rolemanubuttons::getFunctionname, a -> a,(k1,k2)->k1));//拥有的按钮

                    List<m_v_menubuttons> Allhave = AllButtons.stream().filter(p->p.getManuid()==item.getManuid()).collect(Collectors.toList());//这个菜单所有的按钮
                    List<m_v_menubuttons> nohave = new ArrayList<>();//角色没拥有的
                    for (int i = 0; i < Allhave.size(); i++)
                    {
                        if (!havebuttonsD.containsKey(Allhave.get(i).functionname))//如果没有
                        {
                            nohave.add(Allhave.get(i));
                        }

                    }
                    Map<String, m_v_menubuttons> nolbuttonD = nohave.stream().collect(Collectors.toMap(m_v_menubuttons::getFunctionname, a -> a,(k1,k2)->k1));//角色没有的 按钮
                    Manu OneManu = new Manu();
                    OneManu.setManuinfo(item);
                    OneManu.setNobuttonD( new TreeMap(nolbuttonD));//OrderBy(p => p.Value.orderno).ToDictionary(o => o.Key, p => p.Value);//排序;
                    OneManu.setHavebuttonsD(sortButtonMapByValue(havebuttonsD));//排序;

                    ListManusD.put(item.getUrl().toLowerCase(), OneManu);
                }
                TreeMap<String, Manu> res = sortMapByValue(ListManusD);//排序
                return res;
            }
            else
            {
                return null;

            }
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
        Map<String, Manu> list = GetRoleListManusD(RoleId);
        if (list == null)
        {
            list = new HashMap<String, Manu>();
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
