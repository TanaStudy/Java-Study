package com.kuang.mapper;

import com.kuang.pojo.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.Collection;

@Mapper
@Repository
public interface EmployeeMapper {
    //增加一个员工
    void save(Employee employee);

    //更新员工信息
    void update(Employee employee);

    //查询全部员工信息
    Collection<Employee> getAll();

    //通过id查询员工
    Employee getEmployeeById(Integer id);

    //删除员工
    void delete(Integer id);
}
