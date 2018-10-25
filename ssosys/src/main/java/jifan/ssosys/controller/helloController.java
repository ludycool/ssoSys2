package jifan.ssosys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class helloController {
    @ResponseBody
    @RequestMapping("/hello2")
    public String hello() {
        return "Hello2 World";
    }

    @RequestMapping("/hello")
    public String index(ModelMap map) {
        map.addAttribute("name", "FreeMarker");
        return "hello";
    }

    @RequestMapping("/testerro")
    public String testerro() throws Exception {
        throw new Exception("发生错误");
    }
}
