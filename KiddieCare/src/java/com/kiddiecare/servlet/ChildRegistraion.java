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
//correctt
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
        try {
            
            QueryDAO queryDAO = new QueryDAO();
           
            //save child
            String childBirthRegisterNo = request.getParameter("childbirthregisterno");
            String userNic = request.getParameter("userNic");
            String healthPhysicianNo = request.getParameter("physicianno1");
            String familyHealthPhysicianNo = request.getParameter("physicianno2");
            String childName = request.getParameter("childname");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("childbirthday");



          String sqlquery2 = "INSERT INTO child (child_birth_register_no, user_register_no, health_physician_no, family_health_physician_no, child_name, gender, dob) VALUES('" + childBirthRegisterNo + "',(select user_register_no  from chdr.user where user.nic = '"+userNic+"'),'" + healthPhysicianNo + "','" + familyHealthPhysicianNo + "','" + childName + "',"
                   + "'" + gender + "','" + dob + "')";
//insert into chdr.child values ('63924',(select user_register_no from chdr.user where user.nic = '547410017'),'34928','3279','Poorna','girl','1992/04/16',1,1,2,2.5,50);
            
            
       

            if ((queryDAO.save(sqlquery2))) {
             response.getWriter().write("Ok");
                
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
