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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Approve;
import model.Employee;
import model.Status;

/**
 *
 * @author Admin
 */
public class ApproveDao extends BaseDao {

    PreparedStatement pstm;
    ResultSet rs;

    public ArrayList<Approve> getListApprove() {
        ArrayList<Approve> list = new ArrayList<>();
        try {
            String strSelect = "Select a.id,a.status,a.description,a.end_date,e.employee_code,e.employee_name,a.attachment_file "
                    + "from Approve a "
                    + "join "
                    + "Employees e "
                    + "on a.employee_id=e.employee_id ";

            pstm = connection.prepareStatement(strSelect);
            rs = pstm.executeQuery();

            SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat displayDateFormat = new SimpleDateFormat("dd/MM/yyyy");

            while (rs.next()) {
                String id = rs.getString(1);
                String status = rs.getString(2);
                String description = rs.getString(3);
                Date end_date = dbDateFormat.parse(rs.getString(4));
                String formatted_end_date = displayDateFormat.format(end_date);
                String empcode = rs.getString("employee_code");
                String empname = rs.getString("employee_name");
                Employee employee = new Employee();
                employee.setEmployee_code(empcode);
                employee.setEmployee_name(empname);
                byte[] file = rs.getBytes(7);
                list.add(new Approve(id, status, description, formatted_end_date, employee, file));
            }
        } catch (Exception e) {
            System.out.println("getListApprove:" + e.getMessage());
        }
        return list;
    }

    public void addApprove(Approve a) throws SQLException {
        try {
            int employeeId = -1;
            String findEmpIDSql = "SELECT employee_id FROM Employees WHERE employee_code = ?";
            try ( PreparedStatement pstm2 = connection.prepareStatement(findEmpIDSql)) {
                pstm2.setString(1, a.getEmployee().getEmployee_code());
                try ( ResultSet empRs = pstm2.executeQuery()) {
                    if (empRs.next()) {
                        employeeId = empRs.getInt("employee_id");
                    }
                }
            }
            if (employeeId != -1) {
                String query = "INSERT INTO Approve (status,description, end_date, employee_id, attachment_file) VALUES (?, ? , ?, ?, ?)";
                try ( PreparedStatement statement = connection.prepareStatement(query)) {
                    statement.setString(1, a.getStatus());
                    statement.setString(2, a.getDescription());
                    statement.setString(3, a.getDate());
                    statement.setInt(4, employeeId);
                    statement.setBytes(5, a.getFile());
                    statement.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Approve getApproveById(int id) throws SQLException {
        String query = "SELECT a.id, a.status, a.description, a.end_date, a.employee_id, a.attachment_file FROM Approve  WHERE id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Approve approve = new Approve();
                approve.setId(resultSet.getString("id"));
                approve.setStatus(resultSet.getString("status"));
                approve.setDescription(resultSet.getString("description"));
                approve.setDate(resultSet.getString("end_date"));
                approve.getEmployee().setEmployee_id(resultSet.getString("employee_id"));
                approve.setFile(resultSet.getBytes("attachment_file"));
                return approve;
            }
        }
        return null;
    }

    public Approve getApproveById(String rowId) {
        Approve approve = null;
        try {
            String sql = "SELECT * FROM approve WHERE id = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, rowId);
            rs = pstm.executeQuery();
            if (rs.next()) {
                approve = new Approve();
                approve.setId(rs.getString("id"));
                approve.setStatus(rs.getString("status"));
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return approve;
    }

    public void updateApproveStatus(Approve approve) {
        try {
            String sql = "UPDATE approve SET status = ? WHERE id = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, approve.getStatus());
            pstm.setString(2, approve.getId());
            pstm.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

}
