package com.zhicheng.ssosys;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhicheng.ssosys.config.appConfig;
import org.springframework.beans.factory.annotation.Value;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SessionFilter implements Filter {
    @Value("$(serverurl)")
    private String serverurl;
    /**
     * 封装，不需要过滤的list列表
     */
    protected static List<Pattern> patterns = new ArrayList<Pattern>();

    @Override
    public void init(javax.servlet.FilterConfig filterConfig) throws ServletException {
        patterns.add(Pattern.compile("login/index.html"));
        patterns.add(Pattern.compile("login.*"));
        patterns.add(Pattern.compile("my"));
        patterns.add(Pattern.compile("login.do"));
        patterns.add(Pattern.compile("main/autoFillty_rj_situation.*"));
        patterns.add(Pattern.compile("main/post.*"));
        patterns.add(Pattern.compile(".*[(\\.js)||(\\.css)||(\\.png)||(\\.jpg)||(\\.gif)]"));
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;

        // String token = httpRequest.getHeader("token");//头里的参数


        String url = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        if (url.startsWith("/") && url.length() > 1) {
            url = url.substring(1);
        }
        if (isInclude(url)) {
         //if (true) {
            chain.doFilter(httpRequest, httpResponse);
            return;
        } else {
            HttpSession session = httpRequest.getSession();
            if (session.getAttribute(appConfig.USER_SESSION_KEY) != null) {
                // session存在
                chain.doFilter(httpRequest, httpResponse);
                return;
            } else {
                // session不存在 准备跳转失败
                httpResponse.sendRedirect("/login");
/*
                httpResponse.setCharacterEncoding("UTF-8");
                httpResponse.setContentType("application/json; charset=utf-8");
                Response res = new Response();
                res.setSuccess(false);
                res.setErrorCode(403);
                res.setErrorMessage("token没有认证通过!原因为：客户端请求参数中无token信息");
                PrintWriter writer = null;
                OutputStreamWriter osw = null;
                try {
                    osw = new OutputStreamWriter(response.getOutputStream() , "UTF-8");
                    writer = new PrintWriter(osw, true);
                    String jsonStr = ObjectMapperInstance.getInstance().writeValueAsString(res);
                    writer.write(jsonStr);
                    writer.flush();
                    writer.close();
                    osw.close();
                } catch (UnsupportedEncodingException e) {
                    //log.error("过滤器返回信息失败:" + e.getMessage(), e);
                } catch (IOException e) {
                   // log.error("过滤器返回信息失败:" + e.getMessage(), e);
                } finally {
                    if (null != writer) {
                        writer.close();
                    }
                    if(null != osw){
                        osw.close();
                    }
                }
*/



            }
        }
    }

    @Override
    public void destroy() {

    }



    /**
     * 是否需要过滤
     *
     * @param url
     * @return
     */
    private boolean isInclude(String url) {
        for (Pattern pattern : patterns) {
            Matcher matcher = pattern.matcher(url);
            if (matcher.matches()) {
                return true;
            }
        }
        return false;
    }
//自定义响应
    class Response {
        boolean success;
        int errorCode;
        String errorMessage;

        public boolean isSuccess() {
            return success;
        }

        public void setSuccess(boolean success) {
            this.success = success;
        }

        public int getErrorCode() {
            return errorCode;
        }

        public void setErrorCode(int errorCode) {
            this.errorCode = errorCode;
        }

        public String getErrorMessage() {
            return errorMessage;
        }

        public void setErrorMessage(String errorMessage) {
            this.errorMessage = errorMessage;
        }
    }
}