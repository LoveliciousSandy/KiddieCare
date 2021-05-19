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
import org.json.JSONObject;

/**
 *
 * @author Senani
 */
public class SearchVaccineDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category = request.getParameter("category");

        String searchVaccine = "SELECT vaccine_name FROM chdr.vaccine where vaccine_category='" + category + "'";
        String duedatequery = "";
        QueryDAO querydao = new QueryDAO();
        JSONObject jo = new JSONObject();
        try {
            ResultSet resultset = querydao.search(searchVaccine);
            ArrayList<String> vaccineNamesList = new ArrayList<>();
            while (resultset.next()) {

                String vaccineNames = (resultset.getString("vaccine_name"));

                vaccineNamesList.add(vaccineNames);

            }
            String output = jo.put("vaccineNames", vaccineNamesList).toString();
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
