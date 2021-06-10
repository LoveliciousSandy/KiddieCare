/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.servlet;

import com.kiddiecare.dbutil.QueryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Senani
 */
public class UserRegisration extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //save user
        String nic = request.getParameter("guardiannic");
        String guardianName = request.getParameter("guardianName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contactNo = request.getParameter("contactNo");
        String address = request.getParameter("address");
        String motherName = request.getParameter("motherName");
//            String motherAge = request.getParameter("motherage");
//            String numberOfChildren = request.getParameter("nochildren");
        try {
            QueryDAO queryDAO = new QueryDAO();
            String sqlquery1 = "INSERT INTO user (nic,guardian_name,email,contact_no,address,mother_name) VALUES ('" + nic + "','" + guardianName + "','" + email + "','" + contactNo + "','" + address + "',"
                    + "'" + motherName + "')";

            String sqlquery2 = "INSERT INTO login VALUES('" + nic + "','" + password + "')";

            if (queryDAO.save(sqlquery1) && (queryDAO.save(sqlquery2))) {
               response.getWriter().write("OK");
//                response.sendRedirect(request.getContextPath()+"/AdminPanel/AdminDashboard.jsp");
                
            }else{
             response.getWriter().write("No");
            }
                
        } catch (Exception e) {
            e.printStackTrace();
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
