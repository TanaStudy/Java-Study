package com.kuang.controller;


import com.kuang.pojo.Department;
import com.kuang.pojo.Employee;
import com.kuang.service.DepartmentService;
import com.kuang.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Collection;

@Controller
public class EmployeeController {
    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/emps")
    public String list(Model model){
        Collection<Employee> employees = employeeService.getAll();
        model.addAttribute("emps",employees);
        return "emp/list";
    }

    @GetMapping("/emp")
    public String toAddpage(Model model){
        //查出所有部门的信息
        Collection<Department> departments = departmentService.getDepartments();
        model.addAttribute("departments", departments);
        return "emp/add";
    }

    @PostMapping("/emp")
    public String addEmp(Employee employee){
        employeeService.save(employee);// 调用底层业务方法保存员工信息
        return "redirect:/emps";// 重定向到/emps,刷新列表,返回到list页面
    }

    @GetMapping("/emp/{id}")
    public String toUpdateEmp(@PathVariable("id")Integer id, Model model){
        Employee employee = employeeService.getEmployeeById(id);
        model.addAttribute("emp",employee);

        //查出所有部门的信息
        Collection<Department> departments = departmentService.getDepartments();
        model.addAttribute("departments", departments);
        return "emp/update";
    }

    @PostMapping("/updateEmp")
    public String updateEmp(Employee employee){

        employeeService.update(employee);
        return "redirect:/emps";
    }

    // 删除员工
    @GetMapping("/delemp/{id}")
    public String deletemp(@PathVariable("id")int id){
        employeeService.delete(id);
        return "redirect:/emps";
    }
}
