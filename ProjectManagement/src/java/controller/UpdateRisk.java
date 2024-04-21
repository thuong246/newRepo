/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProjectDao;
import dao.RiskDao;
import dao.TaskDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Employee;
import model.Project;
import model.Risk;
import model.Task;

/**
 *
 * @author ADMIN
 */
public class UpdateRisk extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateRisk</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateRisk at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
            RiskDao r = new RiskDao();
            ProjectDao pdao = new ProjectDao();
            String risk_id = request.getParameter("risk_id");
            Risk listbyid = r.getRiskById(risk_id);
            request.setAttribute("listbyid", listbyid);
            ArrayList<String> list = pdao.getAllProjectCode();
            request.setAttribute("ProCode", list);
            request.getRequestDispatcher("view/updaterisk.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("update")) {
            RiskDao rdao = new RiskDao();
            String risk_id = request.getParameter("risk_id");
            String rcode = request.getParameter("rcode");
            String project_code = request.getParameter("pcode");
            String rname = request.getParameter("rname");
            String description = request.getParameter("description");
            String solution = request.getParameter("solution");
            Project p = new Project();
            p.setProject_code(project_code);
            Risk t = new Risk(risk_id, rcode, rname, description, solution, p);
            rdao.UpdateRisk(t);
            ArrayList<Risk> list = rdao.getListRisk();
            request.setAttribute("listrisk", list);
            request.getRequestDispatcher("view/risk.jsp").forward(request, response);
        }
        if (action.equals("delete")) {
            RiskDao rdao = new RiskDao();
            String risk_id = request.getParameter("risk_id");
            rdao.delete(risk_id);
            ArrayList<Risk> list = rdao.getListRisk();
            request.setAttribute("listrisk", list);
            request.getRequestDispatcher("view/risk.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
