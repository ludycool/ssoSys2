package com.zhicheng.ssosys.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhicheng.ssosys.entity.Student;
import com.zhicheng.ssosys.mapper.StudentMapper;
import com.zhicheng.ssosys.service.StudentService;

import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper,Student> implements StudentService {
}
