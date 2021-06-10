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
public class SelectFoods extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String month = request.getParameter("foodMonth");
            JSONArray ja = new JSONArray();
              JSONObject jobj = new JSONObject();
            QueryDAO query = new QueryDAO();
            
            String query1 = "SELECT time, food FROM chdr.diet_chart WHERE months= '"+month+"'";
            ResultSet rs = query.search(query1);
            while (rs.next()) {                
                JSONObject jo = new JSONObject();
           jo.put("time", rs.getString("time"));
           jo.put("food", rs.getString("food"));
            ja.put(jo);
            }

            System.out.println(jobj.put("food", ja).toString());
            String output = jobj.put("food", ja).toString();
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
