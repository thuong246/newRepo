/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProjectDao;
import dao.UserDao;
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
public class UpdateEmployee extends HttpServlet {

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
            out.println("<title>Servlet UpdateEmployee</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateEmployee at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
            ProjectDao p = new ProjectDao();
            String empid = request.getParameter("employee_id");
            Employee listbyid = p.getEmployeebyId(empid);
            request.setAttribute("listbyid", listbyid);
            request.getRequestDispatcher("view/updateemployee.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action.equals("update")) {
            ProjectDao pdao = new ProjectDao();
            String e_id = request.getParameter("e_id");
            String ename = request.getParameter("ename");
            String ecode = request.getParameter("ecode");
            Employee p = new Employee(e_id, ecode, ename);
            pdao.updateEmployee(p);
            UserDao pu = new UserDao();
            ArrayList<Employee> list = pu.getListEmployee();
            request.setAttribute("listE", list);
            request.getRequestDispatcher("view/employee.jsp").forward(request, response);
        }if (action.equals("delete")) {
            ProjectDao pdao = new ProjectDao();
            String e_id = request.getParameter("e_id");
//            pdao.delete(e_id);
            UserDao pu = new UserDao();
            ArrayList<Employee> list = pu.getListEmployee();
            request.setAttribute("listE", list);
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
