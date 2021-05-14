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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Senani
 */
public class SearchChildno extends HttpServlet {


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
           JSONObject jsonobj = new  JSONObject();
                JSONArray jsonarry = new JSONArray();
          String nic =  request.getParameter("NIC");
            QueryDAO queryDAO= new QueryDAO();
            String searchNameByNICQuery= "SELECT child_name FROM chdr.child JOIN chdr.user on child.user_register_no = user.user_register_no where user.nic='"+nic+"'";
            try {
                ResultSet resulSet =  queryDAO.search(searchNameByNICQuery);
                ArrayList <String> childName = new ArrayList<>();
                while (resulSet.next()) {
                   childName.add(resulSet.getString("child_name"));
                    
                }
                jsonarry.put(childName);
             String output =   jsonobj.put("childName",childName).toString();
              response.setContentType("application/json");
                response.getWriter().write(output);
                
            } catch (Exception  ex) {
                ex.printStackTrace();
            }
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
