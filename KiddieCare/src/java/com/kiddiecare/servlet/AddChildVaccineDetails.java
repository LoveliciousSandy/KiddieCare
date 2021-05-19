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
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Senani
 */
public class AddChildVaccineDetails extends HttpServlet {

  

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
        String childagey,childagem,childaged;
       String name = request.getParameter("name");
        String searchchildamd = "SELECT dob, TIMESTAMPDIFF( YEAR, dob, now() ) as _year, TIMESTAMPDIFF( MONTH, dob, now() ) % 12 as _month, FLOOR( TIMESTAMPDIFF( DAY, dob, now() ) % 30.4375 ) as _day FROM chdr.child where child_name = '" + name + "'";// get age query
   QueryDAO querydao = new QueryDAO();
         JSONObject jo= new JSONObject();
        JSONObject jo1 = new JSONObject();
        try {
            ResultSet resultset = querydao.search(searchchildamd);
            while (resultset.next()) {

                childagey = (resultset.getString("_year"));
                childagem = (resultset.getString("_month"));
                childaged = (resultset.getString("_day"));
                
                jo1.put("year", childagey);
                jo1.put("month", childagem);
                jo1.put("days", childaged);
                
            }
            String output = jo.put("age", jo1).toString();
            response.setContentType("application/json");
            response.getWriter().write(output);

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
