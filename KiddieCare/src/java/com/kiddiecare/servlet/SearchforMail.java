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
import javax.json.JsonArray;
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
public class SearchforMail extends HttpServlet {

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
        try {
            String date = request.getParameter("ClinicDate");
            JSONArray ja = new JSONArray();
            JSONObject jo = new JSONObject();
            String YES = "YES";
            String NO = "NO";
            QueryDAO querydao = new QueryDAO();
            int arr[] = {2, 4, 6, 9};
            for (int i = 0; i < arr.length; i++) {
                String q = "SELECT child_name,email,guardian_name, IF(STRCMP (DATE_ADD(dob, INTERVAL " + arr[i] + " MONTH), "+date+")= 0,'" + YES + "','" + NO + "') as collection from chdr.child JOIN chdr.user on child.user_register_no = user.user_register_no";
                //String q = "SELECT \"Kasun\"as child_name, \"Malki@gmail.com\" as email, \"Malki\" as guardian_name,\"Yes\" AS collection ";
                System.out.println(q);
                ResultSet rs = querydao.search(q);
                 while (rs.next()) {
               if(rs.getString("collection").equals("YES")) {
                    ja.put(rs.getString("email"));
                }

            }
            }
            System.out.println(jo.put("emails", ja).toString());
            String output = jo.put("emails", ja).toString();
            response.setContentType("application/json");
            response.getWriter().write(output);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
