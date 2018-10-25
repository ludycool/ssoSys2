package jifan.ssosys.controller.api;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import jifan.ssosys.annotation.DataSource;
import jifan.ssosys.entity.Student;
import jifan.ssosys.enums.DataSourceEnum;
import jifan.ssosys.mapper.CommonMapper;
import jifan.ssosys.mapper.StudentMapper;
import jifan.ssosys.mapper.TeacherMapper;
import jifan.ssosys.service.StudentService;
import jifan.ssosys.vo.StudentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api("对学生表CRUD")
@RestController
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private StudentMapper teacherMapper;



    @ApiOperation("添加学生 数据库2")
    @PostMapping("/add2")
    @DataSource(DataSourceEnum.DB2)
    public String add2(@RequestBody StudentVo student){
        Student stu = new Student();
        stu.setName(student.getName());
        stu.setAge(student.getAge());
        stu.setClassname(student.getClassname());
        stu.setStatus(student.isStatus());
        return studentService.save(stu)?"添加成功":"添加失败";
    }
    @ApiOperation("添加学生")
    @PostMapping("/add")
    public String add(@RequestBody StudentVo student){
        Student stu = new Student();
        stu.setName(student.getName());
        stu.setAge(student.getAge());
        stu.setClassname(student.getClassname());
        stu.setStatus(student.isStatus());

        return studentService.save(stu)?"添加成功":"添加失败";
    }
    @ApiOperation("删除学生")
    @DeleteMapping("/delete/{id}")
    public String delete(@ApiParam("学生的主键id")@PathVariable(value = "id") Integer id){
        return studentService.removeById(id)?"删除成功":"删除失败";
    }
    @ApiOperation("修改学生")
    @PostMapping("/update")
    public String update(@RequestBody Student student){

        Student item=new Student();
        item.setAge(12345);
        UpdateWrapper<Student> wrapper = new UpdateWrapper<>();
        wrapper.setSql("age=1122").eq("id",student.getId());

        return studentService.update(new Student(),wrapper)?"修改成功":"修改失败";
    }

    @ApiOperation(value = "查询学生")
    @GetMapping("/list")
    public List<Student> list(){
        Wrapper<Student> wrapper = new QueryWrapper<>();


        List<Student> ll=   teacherMapper.selectList(wrapper);
        return studentService.list(wrapper);
    }
}
