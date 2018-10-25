package jifan.ssosys.entity.common;

import java.util.Map;
import java.util.TreeMap;

public class Manu {

    private m_v_rolemanus manuinfo;

    /// <summary>
    /// 当前角色 没拥有的按钮
    /// </summary>
    private TreeMap<String, m_v_menubuttons> nobuttonD;

    /// <summary>
    ///当前角色 拥有的按钮
    /// </summary>
    private TreeMap<String, m_v_rolemanubuttons> havebuttonsD;

    public m_v_rolemanus getManuinfo() {
        return manuinfo;
    }

    public void setManuinfo(m_v_rolemanus manuinfo) {
        this.manuinfo = manuinfo;
    }

    public TreeMap<String, m_v_menubuttons> getNobuttonD() {
        return nobuttonD;
    }

    public void setNobuttonD(TreeMap<String, m_v_menubuttons> nobuttonD) {
        this.nobuttonD = nobuttonD;
    }

    public TreeMap<String, m_v_rolemanubuttons> getHavebuttonsD() {
        return havebuttonsD;
    }

    public void setHavebuttonsD(TreeMap<String, m_v_rolemanubuttons> havebuttonsD) {
        this.havebuttonsD = havebuttonsD;
    }
}
