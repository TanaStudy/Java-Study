package com.kuang.mapper;

import com.kuang.pojo.Department;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.Collection;

@Mapper
@Repository
public interface DepartmentMapper {
    //获得所有部门信息
    Collection<Department> getDepartments();

    //通过id得到部门
    Department getDepartmentById(Integer id);
}
