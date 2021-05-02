/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.servlet;

import com.kiddiecare.dbutil.DBUtil;
import com.kiddiecare.dbutil.QueryDAO;
import com.kiddiecare.javabean.Child;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Senani
 */
public class ChildRegistraion extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChildRegistraion</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChildRegistraion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");

            QueryDAO queryDAO = new QueryDAO();
            //save user
            String nic = request.getParameter("guardiannic");
            String guardianName = request.getParameter("guardianname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contactNo = request.getParameter("contactno");
            String address = request.getParameter("address");
            String motherName = request.getParameter("mothername");
            String motherAge = request.getParameter("motherage");
            String numberOfChildren = request.getParameter("nochildren");

            //save child
            String childBirthRegisterNo = request.getParameter("childbirthregisterno");
            String userNic = request.getParameter("guardiannic");
            String healthPhysicianNo = request.getParameter("physicianno1");
            String familyHealthPhysicianNo = request.getParameter("physicianno2");
            String childName = request.getParameter("childname");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("childbirthday");
            String age = request.getParameter("childage");
            String month = request.getParameter("month");
            String days = request.getParameter("days");
            String weight = request.getParameter("birthweight");
            String length = request.getParameter("birthlength");

            String sqlquery1 = "INSERT INTO user VALUES ('" + nic + "','" + guardianName + "','" + email + "','" + contactNo + "','" + address + "',"
                    + "'" + motherName + "','" + motherAge + "','" + numberOfChildren + "')";

            String sqlquery2 = "INSERT INTO child VALUES('" + childBirthRegisterNo + "','" + userNic + "','" + healthPhysicianNo + "','" + familyHealthPhysicianNo + "','" + childName + "',"
                    + "'" + gender + "','" + dob + "','" + age + "','" + month + "','" + days + "','" + weight + "','" + length + "')";

            String sqlquery3 = "INSERT INTO login VALUES('" + userNic + "','" + password + "')";

            queryDAO.save(sqlquery1);
            queryDAO.save(sqlquery2);
            queryDAO.save(sqlquery3);
            
            if (queryDAO.save(sqlquery1)&& (queryDAO.save(sqlquery2) && (queryDAO.save(sqlquery3)))) {
                response.sendRedirect(request.getContextPath()+"AdminPanel/AdminDashboard.jsp");
                
            } else {
                response.sendRedirect("Error.jsp");
                
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
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
