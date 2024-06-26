/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Employee {
    private String employee_id;
    private String employee_code;
    private String employee_name;
    private String department;
    private String position;

    public Employee() {
    }

    public Employee(String employee_code) {
        this.employee_code = employee_code;
    }

    public Employee(String employee_id, String employee_code, String employee_name) {
        this.employee_id = employee_id;
        this.employee_code = employee_code;
        this.employee_name = employee_name;
    }

    public Employee(String employee_id, String employee_code, String employee_name, String department, String position) {
        this.employee_id = employee_id;
        this.employee_code = employee_code;
        this.employee_name = employee_name;
        this.department = department;
        this.position = position;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String deparment) {
        this.department = deparment;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    public String getEmployee_code() {
        return employee_code;
    }

    public void setEmployee_code(String employee_code) {
        this.employee_code = employee_code;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }
    
    
}
