package com.kuang.service;

import com.kuang.mapper.EmployeeMapper;
import com.kuang.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    //查询全部员工
    public Collection<Employee> getAll(){
        return employeeMapper.getAll();
    }

    //更新员工信息
    public void update(Employee employee){
        employeeMapper.update(employee);
    }

    //增加一个员工
    public void save(Employee employee){
        employeeMapper.save(employee);
    }

    //通过ID查询员工
    public Employee getEmployeeById(Integer id){
        return employeeMapper.getEmployeeById(id);
    }

    //通过ID删除一位员工
    public void delete(Integer id){
        employeeMapper.delete(id);
    }
}
