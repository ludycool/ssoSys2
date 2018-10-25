package jifan.ssosys.entity.common;

/**
 * 这个角色 没拥有 这个菜单的 按钮
 */
public class m_v_menubuttons {

    public int manuid;
    public String functionname;

    public int getManuid() {
        return manuid;
    }

    public void setManuid(int manuid) {
        this.manuid = manuid;
    }

    public String getFunctionname() {
        return functionname;
    }

    public void setFunctionname(String functionname) {
        this.functionname = functionname;
    }
}
