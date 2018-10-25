package com.zhicheng.ssosys.entity.common;

public  class ReSultMode0<T> {
    /// <summary>
    /// 代码Code 成功11 失败-11 系统出错-66 成常操作0 令牌错误-12   令牌过期-13
    /// </summary>
    public int code ;
    /// <summary>
    /// 提示信息
    /// </summary>
    public String msg ;

    /// <summary>
    /// 对象
    /// </summary>
    public T data ;

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

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
