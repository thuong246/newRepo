/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class UserDao extends BaseDao{
    
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

    
}
