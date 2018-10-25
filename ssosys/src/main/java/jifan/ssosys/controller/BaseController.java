package jifan.ssosys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jifan.ssosys.config.appConfig;
import jifan.ssosys.entity.common.AdminUserInfo;
import jifan.ssosys.entity.common.Manu;
import jifan.ssosys.entity.common.m_v_rolemanubuttons;
import jifan.ssosys.tool.FilterTools;
import jifan.ssosys.tool.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.beans.propertyeditors.UUIDEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

public class BaseController {


    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));

        binder.registerCustomEditor(Integer.class,new CustomNumberEditor(Integer.class, false));
        binder.registerCustomEditor(int.class,new CustomNumberEditor(Integer.class, false));
        binder.registerCustomEditor(long.class,new CustomNumberEditor(Integer.class, false));
        /*
        private void createDefaultEditors() {
        this.defaultEditors = new HashMap<Class, PropertyEditor>(64);

        // Simple editors, without parameterization capabilities.
        // The JDK does not contain a default editor for any of these target types.
        this.defaultEditors.put(Charset.class, new CharsetEditor());
        this.defaultEditors.put(Class.class, new ClassEditor());
        this.defaultEditors.put(Class[].class, new ClassArrayEditor());
        this.defaultEditors.put(Currency.class, new CurrencyEditor());
        this.defaultEditors.put(File.class, new FileEditor());
        this.defaultEditors.put(InputStream.class, new InputStreamEditor());
        this.defaultEditors.put(InputSource.class, new InputSourceEditor());
        this.defaultEditors.put(Locale.class, new LocaleEditor());
        this.defaultEditors.put(Pattern.class, new PatternEditor());
        this.defaultEditors.put(Properties.class, new PropertiesEditor());
        this.defaultEditors.put(Resource[].class, new ResourceArrayPropertyEditor());
        this.defaultEditors.put(TimeZone.class, new TimeZoneEditor());
        this.defaultEditors.put(URI.class, new URIEditor());
        this.defaultEditors.put(URL.class, new URLEditor());
        this.defaultEditors.put(UUID.class, new UUIDEditor());

        // Default instances of collection editors.
        // Can be overridden by registering custom instances of those as custom editors.
        this.defaultEditors.put(Collection.class, new CustomCollectionEditor(Collection.class));
        this.defaultEditors.put(Set.class, new CustomCollectionEditor(Set.class));
        this.defaultEditors.put(SortedSet.class, new CustomCollectionEditor(SortedSet.class));
        this.defaultEditors.put(List.class, new CustomCollectionEditor(List.class));
        this.defaultEditors.put(SortedMap.class, new CustomMapEditor(SortedMap.class));

        // Default editors for primitive arrays.
        this.defaultEditors.put(byte[].class, new ByteArrayPropertyEditor());
        this.defaultEditors.put(char[].class, new CharArrayPropertyEditor());

        // The JDK does not contain a default editor for char!
        this.defaultEditors.put(char.class, new CharacterEditor(false));
        this.defaultEditors.put(Character.class, new CharacterEditor(true));

        // Spring's CustomBooleanEditor accepts more flag values than the JDK's default editor.
        this.defaultEditors.put(boolean.class, new CustomBooleanEditor(false));
        this.defaultEditors.put(Boolean.class, new CustomBooleanEditor(true));

        // The JDK does not contain default editors for number wrapper types!
        // Override JDK primitive number editors with our own CustomNumberEditor.
        this.defaultEditors.put(byte.class, new CustomNumberEditor(Byte.class, false));
        this.defaultEditors.put(Byte.class, new CustomNumberEditor(Byte.class, true));
        this.defaultEditors.put(short.class, new CustomNumberEditor(Short.class, false));
        this.defaultEditors.put(Short.class, new CustomNumberEditor(Short.class, true));
        this.defaultEditors.put(int.class, new CustomNumberEditor(Integer.class, false));
        this.defaultEditors.put(Integer.class, new CustomNumberEditor(Integer.class, true));
        this.defaultEditors.put(long.class, new CustomNumberEditor(Long.class, false));
        this.defaultEditors.put(Long.class, new CustomNumberEditor(Long.class, true));
        this.defaultEditors.put(float.class, new CustomNumberEditor(Float.class, false));
        this.defaultEditors.put(Float.class, new CustomNumberEditor(Float.class, true));
        this.defaultEditors.put(double.class, new CustomNumberEditor(Double.class, false));
        this.defaultEditors.put(Double.class, new CustomNumberEditor(Double.class, true));
        this.defaultEditors.put(BigDecimal.class, new CustomNumberEditor(BigDecimal.class, true));
        this.defaultEditors.put(BigInteger.class, new CustomNumberEditor(BigInteger.class, true));

        // Only register config value editors if explicitly requested.
        if (this.configValueEditorsActive) {
            StringArrayPropertyEditor sae = new StringArrayPropertyEditor();
            this.defaultEditors.put(String[].class, sae);
            this.defaultEditors.put(short[].class, sae);
            this.defaultEditors.put(int[].class, sae);
            this.defaultEditors.put(long[].class, sae);
        }
    }


         */
    }

    @Autowired
    protected HttpServletRequest request;


    public AdminUserInfo getUserData() {

        AdminUserInfo item = (AdminUserInfo) request.getSession().getAttribute(appConfig.USER_SESSION_KEY);
        return item;
    }

    public void setUserData(AdminUserInfo _item) {
        request.getSession().setAttribute(appConfig.USER_SESSION_KEY, _item);

    }


    /// <summary>
    ///当前用户 是否是系统管理员
    /// </summary>
    /// <returns></returns>
    public boolean IsSysRole() {
        if (getUserData() == null)
            return false;
        return getUserData().getRoleId().equals(appConfig.getSysRoleId());

    }

    /// <summary>
    /// 获取地址
    /// </summary>
    /// <returns></returns>
    public String routeUrl() {
        String url = "";
        // url += request.getScheme() +"://";
        //url +=request.getServerName();
        // url +=":" +request.getServerPort();
        url += request.getServletPath();
        /*if (request.getQueryString() != null){
            url += "?" + request.getQueryString();
        }
        */
        return " var BaseUrl = '" + url + "/';";
    }
    /// <summary>
    /// 操作按键列表
    /// </summary>
    /// <param name="Ftype">1为 包含搜索，2 为不包含搜索</param>
    /// <returns></returns>
    public String toolbar(int Ftype)
    {
        String controller =  request.getServletPath().replace("/","").toLowerCase();
        String tool = " var toolbars =[";
        String search = "";
        int cout = 0;//统计
        Manu ManuItem = getUserData().getListManusD().get(controller);
        if (ManuItem != null)//
        {
            //3.0以上版本
            for (Map.Entry<String, m_v_rolemanubuttons> item : ManuItem.getHavebuttonsD().entrySet()) {
                //Map.entry<Integer,String> 映射项（键-值对）  有几个方法：用上面的名字entry
                //entry.getKey() ;entry.getValue(); entry.setValue();
                //map.entrySet()  返回此映射中包含的映射关系的 Set视图。
               // System.out.println("key= " + item.getKey() + " and value= " + item.getValue());

                if (Ftype == 2 && item.getKey().toLowerCase().equals("search"))//搜索 不用添加进来
                {

                }
                else
                {
                    tool += "{";
                    tool += String.format("id: '%s',", item.getValue().getValuename());
                    tool += String.format("text: '%s',", item.getValue().getButtonname());
                    tool += String.format("iconCls: '%s',", item.getValue().getIcon());
                    tool += "handler: function () { " + item.getValue().getFunctionname() + "(); }}";
                    tool += ",'-',";
                    cout += 1;
                }

            }
            if (cout > 0)
            {
                tool = tool.substring(0, tool.length() - 5);
            }
        }
        tool += "];";
        return tool + search;
    }
    public static String getWhereStr(String sqlSet) {
        String[] data = sqlSet.split("█");
        String sql = " 1=1 ";
        if (!StringHelper.isEmpty(sqlSet)) {
            for (int i = 0; i < data.length; i++) {
                int index = data[i].indexOf(":");
                String nameData = data[i].substring(0, index);

                String[] name = nameData.split("_");
                String value = FilterTools.FilterSpecial(data[i].substring(index + 1));
                sql += " and " + getOP(name[0], name[1], value);

            }
        }
        return sql;
    }

    public static String getOP(String name, String op, String values) {
        //#region  多字段 模糊查询  如： OwnerName|OwnerCode|BuildingCode|HouseCode_like
        String[] names = name.split("|");
        if (names.length > 1) {
            String sql = "(";
            for (int i = 0; i < names.length; i++) {
                if (op.equals("like")) {
                    sql += names[i] + " like N'%" + values + "%' ";

                    if (i != names.length - 1) {
                        sql += " or ";
                    }
                }
            }
            sql += ")";
            return sql;
        }
        switch (op) {
            case "like"://all

                return name + " like N'%" + values + "%' ";
            case "like1":// 前固定

                return name + " like N'" + values + "%' ";
            case "like2"://后固定

                return name + " like N'%" + values + "' ";

            case "eq":

                return name + " = '" + values + "' ";


            case "lt":

                return name + " < '" + values + "' ";


            case "le":

                return name + " <= '" + values + "' ";

            case "gt":

                return name + " > '" + values + "' ";


            case "ge":

                return name + " >= '" + values + "' ";


            case "ne":

                return name + " != '" + values + "' ";
            default:
                return "";
        }
    }


    public static QueryWrapper getQueryWrapper(String sqlSet) {

        QueryWrapper wrapper = new QueryWrapper<>();
        if (!StringHelper.isEmpty(sqlSet)) {
            String[] data = sqlSet.split("█");
            for (int i = 0; i < data.length; i++) {
                int index = data[i].indexOf(":");
                String nameData = data[i].substring(0, index);
                String[] name = nameData.split("_");

                String value = FilterTools.FilterSpecial(data[i].substring(index + 1));
                wrapper = getQwOP(name[0], name[1], value, wrapper);
            }
        }
        return wrapper;
    }

    public static QueryWrapper getQwOP(String name, String op, String values, QueryWrapper wrapper) {
        //#region  多字段 模糊查询  如： OwnerName|OwnerCode|BuildingCode|HouseCode_like
        String[] names = name.split("\\|");
        if (names.length > 1) {
            for (int i = 0; i < names.length; i++) {
                if (op.equals("like")) {

                    wrapper.like(names[i], values);
                    if (i != names.length - 1) {
                        wrapper.or();
                    }
                }
            }
            return wrapper;
        }
        switch (op) {
            case "like"://all
                wrapper.like(name, values);
                break;
            case "like1":// 前固定
                wrapper.likeRight(name, values);
                break;
            case "like2"://后固定
                wrapper.likeLeft(name, values);
                break;

            case "eq":
                wrapper.eq(name, values);
                break;
            case "lt":
                wrapper.lt(name, values);
                break;


            case "le":
                wrapper.le(name, values);
                break;

            case "gt":
                wrapper.gt(name, values);
                break;


            case "ge":
                wrapper.ge(name, values);
                break;


            case "ne":
                wrapper.ne(name, values);
                break;
            default:
                break;
        }
        return wrapper;
    }

    public static String getSqlSelect(String fields, String tablename, String whereStr, String orderStr) {
        String sql = " select " + fields + " from " + tablename + " where " + whereStr + orderStr;
        return sql;

    }


}
