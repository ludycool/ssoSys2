package jifan.ssosys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jifan.ssosys.entity.Student;
import jifan.ssosys.mapper.StudentMapper;
import jifan.ssosys.service.StudentService;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper,Student> implements StudentService {
}
