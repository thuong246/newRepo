/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Employee;

/**
 *
 * @author ADMIN
 */
public class UserDao extends BaseDao {

    PreparedStatement pstm;
    ResultSet rs;

    public boolean checkUser(String username, String password) {
        try {
            String strSelect = "select * from users "
                    + "where username=? "
                    + "and password=?";
            pstm = connection.prepareStatement(strSelect);
            pstm.setString(1, username);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkUser:" + e.getMessage());
        }
        return false;
    }

    public String getRoleNameByUsername(String username) {
        String roleName = null;
        try {
            String sql = "SELECT r.role_name "
                    + "FROM Role r "
                    + "INNER JOIN Users u ON r.user_id = u.user_id "
                    + "WHERE u.username = ?";
            pstm = connection.prepareStatement(sql);
            pstm.setString(1, username);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                roleName = rs.getString("role_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roleName;
    }

    public ArrayList<Employee> getListEmployee() {
        ArrayList<Employee> list = new ArrayList<>();
        try {

            String strSelect = "SELECT e.employee_id, e.employee_code, e.employee_name, ee.department_name, ee.position_name\n"
                    + "FROM Employees e\n"
                    + "JOIN Employee_E ee ON e.employee_id = ee.Employee_id;";
            pstm = connection.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String emp_id = rs.getString(1);
                String emp_code = rs.getString(2);
                String emp_name = rs.getString(3);
                String position = rs.getString(5);
                String deparment = rs.getString(4);
                list.add(new Employee(emp_id, emp_code, emp_name,deparment, position));
            }
        } catch (Exception e) {
            System.out.println("getListEmployee:" + e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        UserDao u = new UserDao();
        String u2 = u.getRoleNameByUsername("admin@gmail.com");
        System.out.println(u2);
    }

}
