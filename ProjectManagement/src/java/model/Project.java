/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Project {
    private String project_id;
    private String project_code;
    private String project_name;
    private String start_date;
    private String end_date;
    private String status;
    private Employee employee;

    public Project() {
    }

    public Project(String status) {
        this.status = status;
    }
    

    public Project(String project_id, String project_code, String project_name, String start_date, String end_date, String status, Employee employee) {
        this.project_id = project_id;
        this.project_code = project_code;
        this.project_name = project_name;
        this.start_date = start_date;
        this.end_date = end_date;
        this.status = status;
        this.employee = employee;
    }

    public String getProject_id() {
        return project_id;
    }

    public void setProject_id(String project_id) {
        this.project_id = project_id;
    }

    public String getProject_code() {
        return project_code;
    }

    public void setProject_code(String project_code) {
        this.project_code = project_code;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
  @Override
    public String toString() {
        return "Project{" +
                "project_id='" + project_id + '\'' +
                ", project_code='" + project_code + '\'' +
                ", project_name='" + project_name + '\'' +
                ", start_date='" + start_date + '\'' +
                ", end_date='" + end_date + '\'' +
                ", status='" + status + '\'' +
                ", employee=" + employee +
                '}';
    }

   
    

    
    
    
    
    
}
