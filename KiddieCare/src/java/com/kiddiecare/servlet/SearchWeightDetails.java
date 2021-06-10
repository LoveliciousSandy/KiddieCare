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
import java.util.ArrayList;
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
public class SearchWeightDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
             JSONObject jobj = new JSONObject();
             JSONArray ja = new JSONArray();
            String date1 = request.getParameter("date1");
            String date2 = request.getParameter("date2");
            Double weightSelector = Double.parseDouble(request.getParameter("weightSelector"));
            QueryDAO queryDAO = new QueryDAO();
            String query = "SELECT * FROM chdr.record JOIN chdr.child on record.child_child_birth_register_no=child.child_birth_register_no JOIN chdr.user on chdr.child.user_register_no= chdr.user.user_register_no WHERE weight < '"+weightSelector+"' and date BETWEEN '" + date1 + "' AND '" + date2 + "' ";
            ResultSet rs = queryDAO.search(query);
            while (rs.next()) {
             JSONObject jo = new JSONObject();
            jo.put("birthregisterNo",rs.getString("child_child_birth_register_no"));
            jo.put("weight",rs.getString("weight"));
            jo.put("height",rs.getString("height"));
            jo.put("child_name",rs.getString("child_name"));
            jo.put("gender",rs.getString("gender"));
            jo.put("nic",rs.getString("nic"));
            jo.put("guardian_name",rs.getString("guardian_name"));
            jo.put("contact_no",rs.getString("contact_no"));
ja.put(jo);
            }
            String output = jobj.put("SearchWeightDetails", ja).toString();
            response.setContentType("application/json");
            response.getWriter().write(output);
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
