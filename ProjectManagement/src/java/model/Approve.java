/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Approve {
    private String id;
    private String status;
    private String description;
    private String date;
    private Employee employee;
    private byte[] file;

    public Approve() {
    }

    public Approve(String description, String date, Employee employee, byte[] file) {
        this.description = description;
        this.date = date;
        this.employee = employee;
        this.file = file;
    }


    public Approve(String id, String status, String description, String date, Employee employee, byte[] file) {
        this.id = id;
        this.status = status;
        this.description = description;
        this.date = date;
        this.employee = employee;
        this.file = file;
    }
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }
    
    
}
