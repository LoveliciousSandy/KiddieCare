/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.servlet;

import com.kiddiecare.dbutil.QueryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class AddChildRecord extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String childName = request.getParameter("childName");
            String dateofmeasurement = request.getParameter("dateMeasurement");
            String weight = request.getParameter("weight");
            String height = request.getParameter("height");
            int age = Integer.parseInt(request.getParameter("ageofchild"));
            System.out.println(age);
            String sqlquery = "INSERT INTO chdr.record ( date, weight, height,recordage, child_child_birth_register_no) VALUES ('"+dateofmeasurement+"','"+weight+"','"+height+"','"+age+"',(select chdr.child.child_birth_register_no from chdr.child where child_name= '"+childName+"'))";
            
            QueryDAO querydao = new QueryDAO();
            
            if (querydao.save(sqlquery)) {
                  response.getWriter().write("OK");
            } else {
                 response.getWriter().write("Error");
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
