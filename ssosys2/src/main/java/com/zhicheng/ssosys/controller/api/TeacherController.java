package com.zhicheng.ssosys.controller.api;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhicheng.ssosys.entity.Teacher;
import com.zhicheng.ssosys.enums.DataSourceEnum;
import com.zhicheng.ssosys.mapper.CommonMapper;
import com.zhicheng.ssosys.multiple.DataSourceContextHolder;
import com.zhicheng.ssosys.service.TeacherService;
import com.zhicheng.ssosys.service.impl.CommonService;
import com.zhicheng.ssosys.vo.TeacherVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;

@Slf4j
@Api("对老师表CRUD")
@RestController
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CommonMapper commonMapper;

    @Autowired
    private CommonService commonService;

    @ApiOperation(value = "添加老师")
    @PostMapping("/add")
    public String add(@RequestBody TeacherVo teacher) {
        Teacher tea = new Teacher();
        tea.setName(teacher.getName());
        tea.setAge(teacher.getAge());
        tea.setSubject(teacher.getSubject());
        return teacherService.save(tea) ? "添加成功" : "添加失败";
    }

    @ApiOperation("删除老师")
    @DeleteMapping("/delete/{id}")
    public String delete(@ApiParam("老师的主键id") @PathVariable(value = "id") Integer id) {
        return teacherService.removeById(id) ? "删除成功" : "删除失败";
    }

    @ApiOperation("修改老师")
    @PostMapping("/update")
    public String update(@RequestBody Teacher teacher) {
        return teacherService.updateById(teacher) ? "修改成功" : "修改失败";
    }

    @ApiOperation(value = "查询老师")
    @GetMapping("/list")
    public List<Teacher> list() {
        Wrapper<Teacher> wrapper = new QueryWrapper<>();
        return teacherService.list(wrapper);
    }

    @ApiOperation(value = "测试查询老师")
    @GetMapping("/test")
    public IPage<Teacher> test() {
        //QueryWrapper<Teacher> wrapper = new QueryWrapper<>();
        //wrapper.gt("id",2);
        //wrapper.last("where id>2");
        IPage<Teacher> page = new Page<>(1, 2);
        LambdaQueryWrapper wrapper = new LambdaQueryWrapper();
        wrapper.gt("id", 2);
        page = teacherService.page(page, wrapper);
        log.debug("debug");//默认日志级别为info
        log.info("info");
        log.error("error");
        log.warn("warn");
        return page;
    }

    @ApiOperation(value = "测试")
    @GetMapping("/test2")
    public String test2() {

        QueryWrapper wrapper = new QueryWrapper<>();
    //    wrapper.eq("id", 4);

     //wrapper.gt("id",3);
    // wrapper.orderByAsc("id");

        //wrapper.last("1=1");
        wrapper.orderByDesc("id");
        wrapper.eq("1",1);

        IPage page = new Page<>(2, 2);
        String sql=wrapper.getSqlSegment();
        List<LinkedHashMap<String, Object>> all=commonMapper.listMapByWrapper("*","rms_company" ,wrapper);
        IPage<LinkedHashMap<String, Object>> pds=commonMapper.listMapByWrapper(page,"*","rms_company" ,wrapper);


        Teacher item=teacherService.getById(4);
        item.setSubject("地理3");
        item.setAge(1);
        item.setName("小测试3");
        DataSourceContextHolder.setDataSource(DataSourceEnum.DB2.getValue());
        long  i = commonService.updataByWrapperNotIn(item,  java.util.Arrays.asList(new String[]{"name","subject"}), wrapper);
        DataSourceContextHolder.clear();


        // Map<String,Object> map=JsonHelper.object2Map(item);
        // Teacher testss=JsonHelper.map2bject(Teacher.class,map);
        return "测试完成 ";
    }
}
