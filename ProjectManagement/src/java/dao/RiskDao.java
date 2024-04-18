/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Project;
import model.Risk;

/**
 *
 * @author ADMIN
 */
public class RiskDao extends BaseDao {

    PreparedStatement pstm;
    ResultSet rs;

    public ArrayList<Risk> getListRisk() {
        ArrayList<Risk> list = new ArrayList<>();
        try {
            String strSelect = "SELECT \n"
                    + "    r.risk_id, \n"
                    + "    r.risk_code, \n"
                    + "    r.risk_name, \n"
                    + "    r.Description, \n"
                    + "    r.Solution, \n"
                    + "    p.project_code \n"
                    + "FROM \n"
                    + "    Risks r \n"
                    + "JOIN \n"
                    + "    Projects p ON p.project_id = r.project_id ";
            pstm = connection.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String risk_id = rs.getString(1);
                String risk_code = rs.getString(2);
                String risk_name = rs.getString(3);
                String description = rs.getString(4);
                String solution = rs.getString(5);
                String project_code = rs.getString("project_code");
                Project p = new Project();
                p.setProject_code(project_code);
                list.add(new Risk(risk_id, risk_code, risk_name, description, solution, p));
            }
        } catch (Exception e) {
            System.out.println("getListRisk:" + e.getMessage());
        }
        return list;
    }

    public Risk getRiskById(String risk_id) {
        Risk t = new Risk();
        try {
            String strSelect = "select r.*,p.project_code from Risks r join Projects p on r.project_id=p.project_id where r.risk_id =?\n";
            pstm = connection.prepareStatement(strSelect);
            pstm.setString(1, risk_id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                t.setRisk_id(rs.getString(1));
                t.setRisk_code(rs.getString(2));
                t.setRisk_name(rs.getString(3));
                t.setDescription(rs.getString(4));
                t.setSolution(rs.getString(5));
                Project p = new Project();
                p.setProject_code(rs.getString(7));
                t.setProject(p);
            }
        } catch (Exception e) {
            System.out.println("getRiskById: " + e.getMessage());
        }
        return t;
    }

    public void UpdateRisk(Risk t) {
        try {
            int projectId = -1;
            String findProjectIdSql = "SELECT project_id FROM Projects WHERE project_code = ?";
            try ( PreparedStatement pstm = connection.prepareStatement(findProjectIdSql)) {
                pstm.setString(1, t.getProject().getProject_code());
                try ( ResultSet rs = pstm.executeQuery()) {
                    if (rs.next()) {
                        projectId = rs.getInt("project_id");
                    }
                }
            }
            if (projectId != -1) {
                String updateRiskQuery = "UPDATE Risks SET project_id=?, risk_code = ?, risk_name = ?, description = ?, solution = ? WHERE risk_id = ?";
                try ( PreparedStatement updateRiskStmt = connection.prepareStatement(updateRiskQuery)) {
                    updateRiskStmt.setInt(1, projectId);
                    updateRiskStmt.setString(2, t.getRisk_code());
                    updateRiskStmt.setString(3, t.getRisk_name());
                    updateRiskStmt.setString(4, t.getDescription());
                    updateRiskStmt.setString(5, t.getSolution());
                    updateRiskStmt.setString(6, t.getRisk_id());
                    updateRiskStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void AddRisk(Risk t) {
        try {
            int projectId = -1;
            String findProjectIdSql = "SELECT project_id FROM Projects WHERE project_code = ?";
            try ( PreparedStatement pstm = connection.prepareStatement(findProjectIdSql)) {
                pstm.setString(1, t.getProject().getProject_code());
                try ( ResultSet rs = pstm.executeQuery()) {
                    if (rs.next()) {
                        projectId = rs.getInt("project_id");
                    }
                }
            }
            if (projectId != -1) {
                String updateRiskQuery = "INSERT INTO Risks(risk_code,risk_name,description,solution,project_id)"
                        + "VALUES"
                        + "(?,?,?,?,?)";
                try ( PreparedStatement updateRiskStmt = connection.prepareStatement(updateRiskQuery)) {
                    updateRiskStmt.setString(1, t.getRisk_code());
                    updateRiskStmt.setString(2, t.getRisk_name());
                    updateRiskStmt.setString(3, t.getDescription());
                    updateRiskStmt.setString(4, t.getSolution());
                    updateRiskStmt.setInt(5, projectId);
                    updateRiskStmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
