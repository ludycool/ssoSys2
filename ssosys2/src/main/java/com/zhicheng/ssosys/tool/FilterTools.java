package com.zhicheng.ssosys.tool;

public class FilterTools {

    /// <summary>
    /// 过滤特殊字符
    /// 如果字符串为空，直接返回。
    /// </summary>
    /// <param name="str">需要过滤的字符串</param>
    /// <returns>过滤好的字符串</returns>
    public static String FilterSpecial(String str)
    {
        if (str == "")
        {
            return str;
        }
        else
        {
            str = str.replace("'", "");
            str = str.replace("<", "");
            str = str.replace(">", "");
            str = str.replace("%", "");
            str = str.replace("'delete", "");
            str = str.replace("delete'", "");
            str = str.replace(" delete ", "");
            str = str.replace("''", "");
            str = str.replace("\"\"", "");
            str = str.replace(",", "");
            str = str.replace(".", "");
            str = str.replace(">=", "");
            str = str.replace("=<", "");
            //str = str.replace("_", "");
            // str = str.replace(";", "");
            str = str.replace("||", "");
            str = str.replace("[", "");
            str = str.replace("]", "");
            str = str.replace("&", "");
            str = str.replace("#", "");
            str = str.replace("/", "");
            str = str.replace("|", "");
            str = str.replace("?", "");
            str = str.replace(">?", "");
            str = str.replace("?<", "");
            str = str.replace(" ", "");
            return str;
        }
    }
}
