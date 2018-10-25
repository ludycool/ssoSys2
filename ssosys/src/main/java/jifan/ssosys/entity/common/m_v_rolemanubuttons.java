package jifan.ssosys.entity.common;

/**
 * 这个角色 拥有 这个菜单的 按钮
 */
public class m_v_rolemanubuttons {
    private int manuid;
    private int orderno;
    private String icon;
    private String valuename;
    private String functionname;
    private String buttonname;
    /// <summary>
    /// 颜色
    /// </summary>
    private String color;

    public int getManuid() {
        return manuid;
    }

    public void setManuid(int manuid) {
        this.manuid = manuid;
    }

    public int getOrderno() {
        return orderno;
    }

    public void setOrderno(int orderno) {
        this.orderno = orderno;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getValuename() {
        return valuename;
    }


    public void setValuename(String valuename) {
        this.valuename = valuename;
    }

    public String getFunctionname() {
        return functionname;
    }

    public void setFunctionname(String functionname) {
        this.functionname = functionname;
    }

    public String getButtonname() {
        return buttonname;
    }

    public void setButtonname(String buttonname) {
        this.buttonname = buttonname;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
