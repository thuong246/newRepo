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
import model.Task;

/**
 *
 * @author ADMIN
 */
public class TaskDao extends BaseDao {

    PreparedStatement pstm;
    ResultSet rs;

    public ArrayList<Task> getListTask() {
        ArrayList<Task> list = new ArrayList<>();
        try {
            String strSelect = "SELECT \n"
                    + "    t.task_id, \n"
                    + "    t.task_code, \n"
                    + "    p.project_code, \n"
                    + "    t.task_name, \n"
                    + "    t.start_date, \n"
                    + "    t.end_date, \n"
                    + "    t.status, \n"
                    + "    e.employee_code \n"
                    + "FROM \n"
                    + "    Employees e \n"
                    + "JOIN \n"
                    + "    Projects p ON p.employee_id = e.employee_id "
                    + "JOIN \n"
                    + "    Tasks t ON t.project_id = p.project_id ";
            pstm = connection.prepareStatement(strSelect);
            rs = pstm.executeQuery();

            SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat displayDateFormat = new SimpleDateFormat("dd/MM/yyyy");

            while (rs.next()) {
                String task_id = rs.getString(1);
                String task_code = rs.getString(2);
                String prj_id = rs.getString("project_code");
                Project project_code = new Project();
                project_code.setProject_code(prj_id);
                String project_name = rs.getString(4);
                Date start_date = dbDateFormat.parse(rs.getString(5));
                Date end_date = dbDateFormat.parse(rs.getString(6));
                String status = rs.getString(7);
                String empid = rs.getString("employee_code");
                Employee employee_code = new Employee();
                employee_code.setEmployee_code(empid);
                String formatted_start_date = displayDateFormat.format(start_date);
                String formatted_end_date = displayDateFormat.format(end_date);
                list.add(new Task(task_id, task_code, project_code, project_name, formatted_start_date, formatted_end_date, employee_code, status));
            }
        } catch (Exception e) {
            System.out.println("getListTask:" + e.getMessage());
        }
        return list;
    }

    public ArrayList<String> getAllStatus() {
        ArrayList<String> list = new ArrayList<>();
        try {
            String strSelect = "SELECT distinct status FROM Tasks";
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

    public ArrayList<String> getAllProjectCode() {
        ArrayList<String> list = new ArrayList<>();
        try {
            String strSelect = "SELECT distinct project_code FROM Projects";
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

    public Task getTaskById(String task_id) {
        Task t = new Task();
        try {
            String strSelect = "select t.task_id,t.task_code,p.project_code,t.task_name,t.start_date,t.end_date,t.status,e.employee_code \n"
                    + "from tasks t \n"
                    + "join employees e on t.employee_id=e.employee_id \n"
                    + "join projects p on p.project_id=t.project_id \n"
                    + "where task_id =?";
            pstm = connection.prepareStatement(strSelect);
            pstm.setString(1, task_id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                t.setTask_id(rs.getString(1));
                t.setTask_code(rs.getString(2));
                Project p = new Project();
                p.setProject_code(rs.getString(3));
                t.setProject(p);
                t.setTask_name(rs.getString(4));
                t.setStart_date(rs.getString(5));
                t.setEnd_date(rs.getString(6));
                t.setStatus(rs.getString(7));
                Employee employee = new Employee();
                employee.setEmployee_code(rs.getString(8));
                p.setEmployee(employee);
            }
        } catch (Exception e) {
            System.out.println("getProjectById: " + e.getMessage());
        }
        return t;
    }

    public static void main(String[] args) {
        TaskDao t = new TaskDao();
        ArrayList<String> projectList = t.getAllProjectCode(); // Assume getListProject() method is inside the class handling database connection and operations

        // Iterate through the project list and print the details
        for (String project : projectList) {
            System.out.println("pcode: " + project);
            System.out.println("-------------------------------------------");
        }
        Task p2 = t.getTaskById("1");
        System.out.println(p2);
    }

    public void AddTask(Task task) {
        try {
            int projectId = -1;
            int employeeId = -1;
            String findProjectIdSql = "SELECT project_id FROM Projects WHERE project_code = ?";
            try ( PreparedStatement pstm = connection.prepareStatement(findProjectIdSql)) {
                pstm.setString(1, task.getProject().getProject_code());
                try ( ResultSet rs = pstm.executeQuery()) {
                    if (rs.next()) {
                        projectId = rs.getInt("project_id");
                    }
                }
            }

            String findEmployeeIdSql = "SELECT employee_id FROM Employees WHERE employee_code = ?";
            try ( PreparedStatement pstm = connection.prepareStatement(findEmployeeIdSql)) {
                pstm.setString(1, task.getEmployee().getEmployee_code());
                try ( ResultSet rs = pstm.executeQuery()) {
                    if (rs.next()) {
                        employeeId = rs.getInt("employee_id");
                    }
                }
            }

            if (projectId != -1 && employeeId != -1) {
                String addTaskQuery = "INSERT INTO Tasks(task_code, project_id, task_name, start_date, end_date, employee_id, status) "
                        + "VALUES ( ?, ?, ?, ?, ?, ?, ?)";
                try ( PreparedStatement updateTaskStmt = connection.prepareStatement(addTaskQuery)) {
                    updateTaskStmt.setString(1, task.getTask_code());
                    updateTaskStmt.setInt(2, projectId); // Sử dụng project_id tìm được từ project_code
                    updateTaskStmt.setString(3, task.getTask_name());
                    updateTaskStmt.setString(4, task.getStart_date());
                    updateTaskStmt.setString(5, task.getEnd_date());
                    updateTaskStmt.setInt(6, employeeId); // Sử dụng employee_id tìm được từ employee_code
                    updateTaskStmt.setString(7, task.getStatus());
                    updateTaskStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void UpdateTask(Task t) {
        try {
            int projectId = -1;
            int employeeId = -1;
            String findProjectIdSql = "SELECT project_id FROM Projects WHERE project_code = ?";
            try ( PreparedStatement pstm = connection.prepareStatement(findProjectIdSql)) {
                pstm.setString(1, t.getProject().getProject_code());
                try ( ResultSet rs = pstm.executeQuery()) {
                    if (rs.next()) {
                        projectId = rs.getInt("project_id");
                    }
                }
            }

            String findEmployeeIdSql = "SELECT employee_id FROM Employees WHERE employee_code = ?";
            try ( PreparedStatement pstm = connection.prepareStatement(findEmployeeIdSql)) {
                pstm.setString(1, t.getEmployee().getEmployee_code());
                try ( ResultSet rs = pstm.executeQuery()) {
                    if (rs.next()) {
                        employeeId = rs.getInt("employee_id");
                    }
                }
            }

            if (projectId != -1 && employeeId != -1) {
                String updateTaskQuery = "UPDATE Tasks SET  task_code = ?,project_id=?, task_name = ?, start_date = ?, end_date = ?,employee_id=?, status = ? WHERE task_id = ?";
                try ( PreparedStatement updateTaskStmt = connection.prepareStatement(updateTaskQuery)) {
                    updateTaskStmt.setString(1, t.getTask_code());
                    updateTaskStmt.setInt(2, projectId); // Sử dụng project_id tìm được từ project_code
                    updateTaskStmt.setString(3, t.getTask_name());
                    updateTaskStmt.setString(4, t.getStart_date());
                    updateTaskStmt.setString(5, t.getEnd_date());
                    updateTaskStmt.setInt(6, employeeId); // Sử dụng employee_id tìm được từ employee_code
                    updateTaskStmt.setString(7, t.getStatus());
                    updateTaskStmt.setString(8, t.getTask_id());
                    updateTaskStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
