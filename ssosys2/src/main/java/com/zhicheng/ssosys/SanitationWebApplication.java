package com.zhicheng.ssosys;

import com.zhicheng.ssosys.config.appConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/* 内置tomcat*/
@SpringBootApplication
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})//spring boot默认会加载org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration类，DataSourceAutoConfiguration类使用了@Configuration注解向spring注入了dataSource bean。因为工程中没有关于dataSource相关的配置信息，当spring创建dataSource bean因缺少相关的信息就会报错。
public class SanitationWebApplication {

    public static void main(String[] args) {


        appConfig.context= SpringApplication.run(SanitationWebApplication.class, args);
    }
}
/*
@SpringBootApplication
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class SsosysApplication extends SpringBootServletInitializer { //使用外围tomcat

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SsosysApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(SsosysApplication.class, args);
    }
}
*/