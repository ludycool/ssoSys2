package jifan.ssosys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import jifan.ssosys.entity.SysDictionary;
import jifan.ssosys.mapper.SysDictionaryMapper;
import jifan.ssosys.service.SysDictionaryService;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysDictionaryServiceImpl extends ServiceImpl<SysDictionaryMapper,SysDictionary> implements SysDictionaryService {






    /// <summary>
    /// 词典树型数据生成json！！
    /// </summary>
    /// <param name="Id">角色的Id</param>
    /// <returns></returns>
    public String GetTree(List<SysDictionary> list)
    {
        String menus = " [\n";
        for (int i = 0; i < list.size(); i++)
        {
            if (!IsHaveParent(list,list.get(i).getParentid()))//此项没有父级
            {

                menus += "{  \"id\":\"" + list.get(i).getDicid() + "\",";
                menus += String.format("  \"dicTypeId\":\"%s\",", list.get(i).getDictypeid());
                menus += String.format("  \"name\":\"%s\",", list.get(i).getDicname());
                menus += String.format("  \"dicNo\":\"%s\",", list.get(i).getDicno());
                menus += String.format("  \"parentId\":\"%s\",", list.get(i).getParentid());
                menus += String.format("  \"orderId\":\"%s\",", list.get(i).getOrderid());
                menus += String.format("  \"remarks\":\"%s\",", list.get(i).getRemarks());
                menus += String.format("  \"createTime\":\"%s\",", list.get(i).getCreatetime());
                menus += String.format("  \"iconCls\":\"%s\",", list.get(i).getIcon());
                menus += GetSonTree(list, list.get(i));//添加children
                menus += "},";
            }
        }
        menus = menus.substring(0, menus.length() - 1);
        menus = menus + "]";

        return menus;
    }
    private String GetSonTree(List<SysDictionary> listAll, SysDictionary SonItem)
    {
        String menus = "\"children\":[";
        List<SysDictionary> list =GetSonList(listAll,SonItem.getDicid());
        if (list != null && list.size() > 0)
        {
            for (int i = 0; i < list.size(); i++)
            {
                menus += "{  \"id\":\"" + list.get(i).getDicid() + "\",";
                menus += String.format("  \"dicTypeId\":\"%s\",", list.get(i).getDictypeid());
                menus += String.format("  \"name\":\"%s\",", list.get(i).getDicname());
                menus += String.format("  \"dicNo\":\"%s\",", list.get(i).getDicno());
                menus += String.format("  \"parentId\":\"%s\",", list.get(i).getParentid());
                menus += String.format("  \"orderId\":\"%s\",", list.get(i).getOrderid());
                menus += String.format("  \"remarks\":\"%s\",", list.get(i).getRemarks());
                menus += String.format("  \"createTime\":\"%s\",", list.get(i).getCreatetime());
                menus += String.format("  \"iconCls\":\"%s\",", list.get(i).getIcon());

                menus += GetSonTree(listAll, list.get(i));//添加children
                menus += "},";

            }
            menus = menus.substring(0, menus.length() - 1);
        }
        menus = menus + "]";
        return menus;
    }

    private List<SysDictionary>  GetSonList (List<SysDictionary> list,int dicid)
    {
        List<SysDictionary> son=new ArrayList<>();
        for (int i = 0; i < list.size(); i++)
        {
            if(list.get(i).getParentid()==dicid)
            {
                son.add(list.get(i));
            }
        }
        return  son;
    }

    /**
     * 是否有父级
     * @param list
     * @param parentid
     * @return
     */
    private boolean  IsHaveParent (List<SysDictionary> list,int parentid)
    {
        List<SysDictionary> son=new ArrayList<>();
        for (int i = 0; i < list.size(); i++)
        {
            if(list.get(i).getDicid()==parentid)
            {
               return  true;
            }
        }
        return  false ;
    }

}
