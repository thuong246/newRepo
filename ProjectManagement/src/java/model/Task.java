/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Task {
    private String task_id;
    private String task_code;
    private Project project;
    private String task_name;
    private String start_date;
    private String end_date;
    private String status;
    private Employee employee;

    public Task() {
    }

    public Task(String status) {
        this.status = status;
    }

    public Task(Project project) {
        this.project = project;
    }
    

    public Task(String task_id, String task_code, Project project, String task_name, String start_date, String end_date,Employee employee, String status ) {
        this.task_id = task_id;
        this.task_code = task_code;
        this.project = project;
        this.task_name = task_name;
        this.start_date = start_date;
        this.end_date = end_date;
        this.status = status;
        this.employee = employee;
    }

    public String getTask_id() {
        return task_id;
    }

    public void setTask_id(String task_id) {
        this.task_id = task_id;
    }

    public String getTask_code() {
        return task_code;
    }

    public void setTask_code(String task_code) {
        this.task_code = task_code;
    }

    public Project getProject() {
        return project;
    }
    public String getProjectCode() {
        if (project != null) {
            return project.getProject_code();
        } else {
            return null; 
        }
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public String getTask_name() {
        return task_name;
    }

    public void setTask_name(String task_name) {
        this.task_name = task_name;
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
        return "Task{" + "task_id=" + task_id + ", task_code=" + task_code + ", project=" + project + ", task_name=" + task_name + ", start_date=" + start_date + ", end_date=" + end_date + ", status=" + status + ", employee=" + employee + '}';
    }

    
}
