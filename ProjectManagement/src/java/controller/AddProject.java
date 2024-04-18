/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProjectDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Employee;
import model.Project;

/**
 *
 * @author ADMIN
 */
public class AddProject extends HttpServlet {

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
            out.println("<title>Servlet AddProject</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProject at " + request.getContextPath() + "</h1>");
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
        ProjectDao p = new ProjectDao();
        ArrayList<String> list = p.getAllStatus();
        request.setAttribute("status", list);
        ArrayList<String> list2 = p.getAllEmployeeCode();
        request.setAttribute("Empcode", list2);
        request.getRequestDispatcher("view/addproject.jsp").forward(request, response);
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
        ProjectDao pdao = new ProjectDao();
        String project_id = request.getParameter("project_id");
        String project_code = request.getParameter("pcode");
        String project_name = request.getParameter("pname");
        String start_date = request.getParameter("startdate");
        String end_date = request.getParameter("enddate");
        String employee_code = request.getParameter("empcode");
        String status = request.getParameter("status");
        Employee e = new Employee();
        e.setEmployee_code(employee_code);
        Project p = new Project(project_id, project_code, project_name, start_date, end_date, status, e);
        pdao.AddProject(p);
        ArrayList<Project> list = pdao.getListProject();
        request.setAttribute("listproject", list);
        request.getRequestDispatcher("view/project.jsp").forward(request, response);
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
