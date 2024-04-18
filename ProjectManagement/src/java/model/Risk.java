/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Risk {
     private String risk_id;
    private String risk_code;
    private String risk_name;
    private String description;
    private String solution;
    private Project project;

    public Risk() {
    }
    

    public Risk(String risk_id, String risk_code, String risk_name, String description, String solution, Project project) {
        this.risk_id = risk_id;
        this.risk_code = risk_code;
        this.risk_name = risk_name;
        this.description = description;
        this.solution = solution;
        this.project = project;
    }

    public String getRisk_id() {
        return risk_id;
    }

    public void setRisk_id(String risk_id) {
        this.risk_id = risk_id;
    }

    public String getRisk_code() {
        return risk_code;
    }

    public void setRisk_code(String risk_code) {
        this.risk_code = risk_code;
    }

    public String getRisk_name() {
        return risk_name;
    }

    public void setRisk_name(String risk_name) {
        this.risk_name = risk_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
    
}
