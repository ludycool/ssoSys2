package com.zhicheng.ssosys.entity.common;

/**
 * 返回消息
 */
public class ReSultMode {

    /// <summary>
    /// 代码Code 成功11 失败-11 系统出错-66 成常操作0 令牌错误-12   令牌过期-13
    /// </summary>
    private int code;
    /// <summary>
    /// 提示信息
    /// </summary>
    private String msg;
    /// <summary>
    /// 数据
    /// </summary>
    private String data ;

    /// <summary>
    /// 构造返回一个
    /// </summary>
    /// <param name="_code">代码</param>
    /// <param name="_msg">信息</param>
    /// <param name="_data">数据</param>
    /// <returns></returns>
    public static ReSultMode GetReSultMode(int _code, String _msg, String _data)
    {
        ReSultMode info = new ReSultMode();
        info.code = _code;
        info.msg = _msg;
        info.data = _data;
        return info;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
    public String getData() {
        return data;
    }
    public void setData(String data) {
        this.data = data;
    }
}
