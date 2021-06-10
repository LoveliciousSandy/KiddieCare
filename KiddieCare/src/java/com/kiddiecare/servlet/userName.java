/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.servlet;

import com.kiddiecare.dbutil.QueryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Senani
 */
public class userName extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
                String nic = request.getParameter("nic");
                QueryDAO queryDAO = new QueryDAO();
                String query = "SELECT guardian_name FROM chdr.user WHERE nic='" + nic + "'";
                ResultSet rs = queryDAO.search(query);
                while (rs.next()) {
                    String output = rs.getString("guardian_name");
                    response.setContentType("application/json");
                    response.getWriter().write(output);
                        
                   
                }
            } catch (Exception e) {
                e.printStackTrace();
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
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
