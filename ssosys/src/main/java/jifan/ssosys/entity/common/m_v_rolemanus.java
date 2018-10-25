package jifan.ssosys.entity.common;

public class m_v_rolemanus {

    private int manuid;
    private int parentmanuid;
    private int orderno;
    private String manuname;
    private String url;

    private Boolean isenable;
    private String icon;
    private String micon;
    /// <summary>
    /// 类型 0顶级 1集合（有子集 当包用） 2 连接（带地址 提供跳转功能）
    /// </summary>
    private short typeid;
    /// <summary>
    /// 值、编号
    /// </summary>
    private String valuename;
    /// <summary>
    /// 等级 0 开始
    /// </summary>
    private int level;

    public int getManuid() {
        return manuid;
    }

    public void setManuid(int manuid) {
        this.manuid = manuid;
    }

    public int getParentmanuid() {
        return parentmanuid;
    }

    public void setParentmanuid(int parentmanuid) {
        this.parentmanuid = parentmanuid;
    }

    public int getOrderno() {
        return orderno;
    }

    public void setOrderno(int orderno) {
        this.orderno = orderno;
    }

    public String getManuname() {
        return manuname;
    }

    public void setManuname(String manuname) {
        this.manuname = manuname;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Boolean getIsenable() {
        return isenable;
    }

    public void setIsenable(Boolean isenable) {
        this.isenable = isenable;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getMicon() {
        return micon;
    }

    public void setMicon(String micon) {
        this.micon = micon;
    }

    public short getTypeid() {
        return typeid;
    }

    public void setTypeid(short typeid) {
        this.typeid = typeid;
    }

    public String getValuename() {
        return valuename;
    }

    public void setValuename(String valuename) {
        this.valuename = valuename;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
