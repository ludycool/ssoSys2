package jifan.ssosys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jifan.ssosys.mapper.CommonMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jifan.ssosys.entity.RmsDepartment;
import jifan.ssosys.mapper.RmsDepartmentMapper;
import jifan.ssosys.service.RmsDepartmentService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class RmsDepartmentServiceImpl extends ServiceImpl<RmsDepartmentMapper,RmsDepartment> implements RmsDepartmentService {

    @Autowired
    private CommonMapper commonMapper;
    /// <summary>
    /// 删除部门
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    @Transactional(rollbackFor = {Exception.class})
    public int deleteDepartment(int id)
    {
        try
        {
            String sqlstr = " delete from  rms_userrole where userid in(select id from  rms_user where departmentid=" + id + ")";//删除用户角色
            commonMapper.executeNonQuery(sqlstr);
            sqlstr = " delete from  rms_user where departmentid=" + id;//删除用户
            commonMapper.executeNonQuery(sqlstr);
            return super.removeById(id)?1:0;
        }
        catch (Exception ex)
        {
            log.error("RMS_DepartmentBiz.deleteDepartment", "删除角色出错", ex);
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//事务回滚
            return 0;
        }
    }

    /// <summary>
    /// 获取某个角色的权限 数据不要乱改啊！！
    /// </summary>
    /// <param name="Id">角色的Id</param>
    /// <returns></returns>
    public String GetTree(List<RmsDepartment> list)
    {
        String menus = " [\n";
        for (int i = 0; i < list.size(); i++)
        {
            if (list.get(i).getParentid() == 0)//此项没有父级
            {

                menus += "{  \"id\":\"" + list.get(i).getId() + "\",";
                menus += String.format("  \"name\":\"%s\",", list.get(i).getName());
                menus += String.format("  \"parentId\":\"%s\",", list.get(i).getParentid());
                menus += String.format("  \"orderNo\":\"%s\",", list.get(i).getOrderno());
                menus += String.format("  \"remarks\":\"%s\",", list.get(i).getRemarks());
                menus += String.format("  \"createTime\":\"%s\",", list.get(i).getCreatetime());
                menus += String.format("  \"modifyTime\":\"%s\",", list.get(i).getModifytime());
                menus += String.format("  \"iconCls\":\"%s\",", list.get(i).getIcon());
                menus += GetSonTree(list, list.get(i));//添加children
                menus += "},";
            }
        }
        menus = menus.substring(0, menus.length() - 1);
        menus = menus + "]";

        return menus;
    }
    private String GetSonTree(List<RmsDepartment> listAll, RmsDepartment SonItem)
    {
        String menus = "\"children\":[";
        List<RmsDepartment> list = listAll.stream().filter(p->p.getParentid()==SonItem.getId()).collect(Collectors.toList());
        if (list != null && list.size() > 0)
        {
            for (int i = 0; i < list.size(); i++)
            {

                menus += "{  \"id\":\"" + list.get(i).getId() + "\",";
                menus += String.format("  \"name\":\"%s\",", list.get(i).getName());
                menus += String.format("  \"parentId\":\"%s\",", list.get(i).getParentid());
                menus += String.format("  \"orderNo\":\"%s\",", list.get(i).getOrderno());
                menus += String.format("  \"remarks\":\"%s\",", list.get(i).getRemarks());
                menus += String.format("  \"createTime\":\"%s\",", list.get(i).getCreatetime());
                menus += String.format("  \"modifyTime\":\"%s\",", list.get(i).getModifytime());
                menus += String.format("  \"iconCls\":\"%s\",", list.get(i).getIcon());

                menus += GetSonTree(listAll, list.get(i));//添加children
                menus += "},";

            }
            menus = menus.substring(0, menus.length() - 1);
        }
        menus = menus + "]";
        return menus;
    }
}
