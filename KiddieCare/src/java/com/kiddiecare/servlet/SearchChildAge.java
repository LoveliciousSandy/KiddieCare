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
public class SearchChildAge extends HttpServlet {

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
        String childname, duedate, vaccinename,vaccinecategory, dob,status, childagey, childagem, childaged;
        String name = request.getParameter("name");
        ///correct 0ne
        // String searchchildamd = "SELECT dob, TIMESTAMPDIFF( YEAR, dob, now() ) as _year, TIMESTAMPDIFF( MONTH, dob, now() ) % 12 as _month, FLOOR( TIMESTAMPDIFF( DAY, dob, now() ) % 30.4375 ) as _day FROM chdr.child where child_name = '" + name + "'";// get age query
        //String searchVaccinedetails = "select child_name, due_date,vaccine_category, dob, TIMESTAMPDIFF( YEAR, dob, now() ) as _year, TIMESTAMPDIFF( MONTH, dob, now() ) % 12 as _month, FLOOR( TIMESTAMPDIFF( DAY, dob, now() ) % 30.4375 ) as _day  from chdr.vaccine_schedule_date join child on child_child_birth_register_no= child_birth_register_no join user on child.user_register_no= user.user_register_no where child.child_name='" + name + "' and vaccine_category  ";
        String searchVaccinedetails = "select child_name, due_date,vaccine_name,vaccine_category ,status, dob, TIMESTAMPDIFF( YEAR, dob, now() ) as _year, TIMESTAMPDIFF( MONTH, dob, now() ) % 12 as _month, FLOOR( TIMESTAMPDIFF( DAY, dob, now() ) % 30.4375 ) as _day  from chdr.child_vaccination_details join child on child_child_birth_register_no= child_birth_register_no join user on child.user_register_no= user.user_register_no join  vaccine on vaccine_idvaccine=child_vaccination_details.vaccine_idvaccine where child.child_name= '"+name+"'";

        QueryDAO querydao = new QueryDAO();
        JSONObject jo = new JSONObject();
        JSONArray ja = new JSONArray();
        try {
            ResultSet resultset = querydao.search(searchVaccinedetails);
            while (resultset.next()) {

                childname = (resultset.getString("child_name"));
                duedate = (resultset.getString("due_date"));
                vaccinename = (resultset.getString("vaccine_name"));
                vaccinecategory = (resultset.getString("vaccine_category"));
                dob = (resultset.getString("dob"));
                status = (resultset.getString("status"));
                if (!status.equals("Yes")) {
                    status = "No";
                } 
                childagey = (resultset.getString("_year"));
                childagem = (resultset.getString("_month"));
                childaged = (resultset.getString("_day"));

                JSONObject jo1 = new JSONObject();
                jo1.put("childname", childname);
                jo1.put("duedate", duedate);
                jo1.put("vaccinecategory", vaccinecategory);
                jo1.put("vaccinename", vaccinename);
                jo1.put("dob", dob);
                jo1.put("status", status);
                jo1.put("year", childagey);
                jo1.put("month", childagem);
                jo1.put("days", childaged);
                ja.put(jo1);
            }
            
            System.out.println(jo.put("vaccinedetails", ja).toString());
            String output = jo.put("vaccinedetails", ja).toString();
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
