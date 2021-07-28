package com.kuang.service;


import com.kuang.mapper.DepartmentMapper;
import com.kuang.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    //获取所有部门
    public Collection<Department> getDepartments(){
        return departmentMapper.getDepartments();
    }
    //通过ID获取部门
    public Department getDepartmentById(Integer id){
        return departmentMapper.getDepartmentById(id);
    }


}
