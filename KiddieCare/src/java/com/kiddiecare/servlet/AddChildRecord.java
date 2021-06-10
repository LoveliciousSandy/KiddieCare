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
//correct
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
            String userId = request.getParameter("nicNo");
            String childName = request.getParameter("childName");
            String dateofmeasurement = request.getParameter("dateMeasurement");
            String weight = request.getParameter("weight");
            String height = request.getParameter("height");
            int years = Integer.parseInt(request.getParameter("years"));
            int months =Integer.parseInt(request.getParameter("months"));
            int days = Integer.parseInt(request.getParameter("days"));
            String status = "No";
            QueryDAO querydao = new QueryDAO();
            
             int totalmonths = (years*12)+months;
           // String sqlquery = "INSERT INTO chdr.record (date, weight, height,years,months,days, totalmonths,child_child_birth_register_no) VALUES ('"+dateofmeasurement+"','"+weight+"','"+height+"','"+years+"','"+months+"','"+days+"','"+totalmonths+"',(select chdr.child.child_birth_register_no from chdr.child where child_name= '"+childName+"'))";
            String sqlquery = "INSERT INTO chdr.record (date, weight, height,years,months,days, totalmonths,child_child_birth_register_no) VALUES ('"+dateofmeasurement+"','"+weight+"','"+height+"','"+years+"','"+months+"','"+days+"','"+totalmonths+"',(SELECT child_birth_register_no FROM chdr.child JOIN chdr.user on child.user_register_no= user.user_register_no WHERE child_name ='"+childName+"' and user.nic='"+userId+"'))";
            if (years == 0 && months== 0 && days== 0){
                status ="Yes";
            String savevaccine1sdrecord = "insert into chdr.child_vaccination_details (vaccine_idvaccine, vaccinecategory_idvaccinecategory, due_date, given_date, status,child_child_birth_register_no) values(1,1,'"+dateofmeasurement+"','"+dateofmeasurement+"','"+status+"',(select chdr.child.child_birth_register_no from chdr.child where child_name= '"+childName+"'))";
            querydao.save(savevaccine1sdrecord);
            }
            
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
