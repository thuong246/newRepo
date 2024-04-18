/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Employee;
import model.Project;

/**
 *
 * @author ADMIN
 */
public class ProjectDao extends BaseDao {

    PreparedStatement pstm;
    ResultSet rs;

    public ArrayList<Project> getListProject() {
        ArrayList<Project> list = new ArrayList<>();
        try {
            String strSelect = "SELECT \n"
                    + "    p.project_id, \n"
                    + "    p.project_code, \n"
                    + "    p.project_name, \n"
                    + "    p.start_date, \n"
                    + "    p.end_date, \n"
                    + "    p.status, \n"
                    + "    e.employee_code \n"
                    + "FROM \n"
                    + "    Projects p \n"
                    + "JOIN \n"
                    + "    Employees e ON p.employee_id = e.employee_id;";
            pstm = connection.prepareStatement(strSelect);
            rs = pstm.executeQuery();

            SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat displayDateFormat = new SimpleDateFormat("dd/MM/yyyy");

            while (rs.next()) {
                String project_id = rs.getString(1);
                String project_code = rs.getString(2);
                String project_name = rs.getString(3);
                Date start_date = dbDateFormat.parse(rs.getString(4));
                Date end_date = dbDateFormat.parse(rs.getString(5));
                String status = rs.getString(6);
                String empid = rs.getString("employee_code");
                Employee employee_code = new Employee();
                employee_code.setEmployee_code(empid);
                String formatted_start_date = displayDateFormat.format(start_date);
                String formatted_end_date = displayDateFormat.format(end_date);
                list.add(new Project(project_id, project_code, project_name, formatted_start_date, formatted_end_date, status, employee_code));
            }
        } catch (Exception e) {
            System.out.println("getListProject:" + e.getMessage());
        }
        return list;
    }

    public Project getProjectById(String project_id) {
        Project p = new Project();
        try {
            String strSelect = "select p.*,e.employee_code from projects p join employees e on p.employee_id=e.employee_id where project_id =?";
            pstm = connection.prepareStatement(strSelect);
            pstm.setString(1, project_id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                p.setProject_id(rs.getString(1));
                p.setProject_code(rs.getString(2));
                p.setProject_name(rs.getString(3));
                p.setStart_date(rs.getString(4));
                p.setEnd_date(rs.getString(5));
                p.setStatus(rs.getString(6));
                Employee employee = new Employee();
                employee.setEmployee_code(rs.getString(8));
                p.setEmployee(employee);
            }
        } catch (Exception e) {
            System.out.println("getProjectById: " + e.getMessage());
        }
        return p;
    }

    public static void main(String[] args) {
        ProjectDao p = new ProjectDao();
//        ArrayList<Project> projectList = p.getListProject(); // Assume getListProject() method is inside the class handling database connection and operations
//
//        // Iterate through the project list and print the details
//        for (Project project : projectList) {
//            System.out.println("Project ID: " + project.getProject_id());
//            System.out.println("Project Code: " + project.getProject_code());
//            System.out.println("Project Name: " + project.getProject_name());
//            System.out.println("Start Date: " + project.getStart_date());
//            System.out.println("End Date: " + project.getEnd_date());
//            System.out.println("Status: " + project.getStatus());
//            System.out.println("Assigned Employee: " + project.getEmployee().getEmployee_code());
//            System.out.println("-------------------------------------------");
//        }
//        Project p2 = p.getProjectById("1");
//        System.out.println(p2);
//        ArrayList<Project> projectList = p.getAllStatus(); // Assume getListProject() method is inside the class handling database connection and operations
//
//        // Iterate through the project list and print the details
//        for (Project project : projectList) {
//            System.out.println("Status: " + project.getStatus());
//            System.out.println("-------------------------------------------");
//        }

    }

    public ArrayList<String> getAllStatus() {
        ArrayList<String> list = new ArrayList<>();
        try {
            String strSelect = "SELECT distinct status from Projects";
            pstm = connection.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String status = rs.getString(1);
               if (status != null) {
                    list.add(status);
                }
            }
        } catch (Exception e) {
            System.out.println("getAllStatus:" + e.getMessage());
        }
        return list;
    }
    public ArrayList<String> getAllEmployeeCode() {
        ArrayList<String> list = new ArrayList<>();
        try {
            String strSelect = "SELECT distinct employee_code from Employees";
            pstm = connection.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String employee_code = rs.getString(1);
                if (employee_code != null) {
                    list.add(employee_code);
                }
            }
        } catch (Exception e) {
            System.out.println("getAllEmployeeCode:" + e.getMessage());
        }
        return list;
    }

    public void updateProject(Project pj) {
        try {
            int employeeId = -1;
            String findEmpIDSql = "SELECT employee_id FROM Employees WHERE employee_code = ?";
            try ( PreparedStatement pstm2 = connection.prepareStatement(findEmpIDSql)) {
                pstm2.setString(1, pj.getEmployee().getEmployee_code());
                try ( ResultSet empRs = pstm2.executeQuery()) {
                    if (empRs.next()) {
                        employeeId = empRs.getInt("employee_id");
                    }
                }
            }
            if (employeeId != -1) {
                String updateProjectQuery = "UPDATE Projects SET employee_id = ?, project_code = ?, project_name = ?, start_date = ?, end_date = ?, status = ? WHERE project_id = ?";
                try ( PreparedStatement updateProjectStmt = connection.prepareStatement(updateProjectQuery)) {
                    updateProjectStmt.setInt(1, employeeId);
                    updateProjectStmt.setString(2, pj.getProject_code());
                    updateProjectStmt.setString(3, pj.getProject_name());
                    updateProjectStmt.setString(4, pj.getStart_date());
                    updateProjectStmt.setString(5, pj.getEnd_date());
                    updateProjectStmt.setString(6, pj.getStatus());
                    updateProjectStmt.setString(7, pj.getProject_id());
                    updateProjectStmt.executeUpdate();
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void AddProject(Project pj) {
        try {
            int employeeId = -1;
            String findEmpIDSql = "SELECT employee_id FROM Employees WHERE employee_code = ?";
            try ( PreparedStatement pstm2 = connection.prepareStatement(findEmpIDSql)) {
                pstm2.setString(1, pj.getEmployee().getEmployee_code());
                try ( ResultSet empRs = pstm2.executeQuery()) {
                    if (empRs.next()) {
                        employeeId = empRs.getInt("employee_id");
                    }
                }
            }
            if (employeeId != -1) {
                String addProjectQuery = "INSERT INTO Projects(project_code,project_name,start_date,end_date,employee_id ,status)"
                        + "VALUES"
                        + "(?,?,?,?,?,?)";
                try ( PreparedStatement updateProjectStmt = connection.prepareStatement(addProjectQuery)) {
                    updateProjectStmt.setInt(5, employeeId);
                    updateProjectStmt.setString(1, pj.getProject_code());
                    updateProjectStmt.setString(2, pj.getProject_name());
                    updateProjectStmt.setString(3, pj.getStart_date());
                    updateProjectStmt.setString(4, pj.getEnd_date());
                    updateProjectStmt.setString(6, pj.getStatus());
                    updateProjectStmt.executeUpdate();
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<String> getAllProjectCode() {
        ArrayList<String> list = new ArrayList<>();
        try {
            String strSelect = "SELECT distinct project_code from Projects";
            pstm = connection.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String project_code = rs.getString(1);
                if (project_code != null) {
                    list.add(project_code);
                }
            }
        } catch (Exception e) {
            System.out.println("getAllProjectCode:" + e.getMessage());
        }
        return list;
    }

    

}
