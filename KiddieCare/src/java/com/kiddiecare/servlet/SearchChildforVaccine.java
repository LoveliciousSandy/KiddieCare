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
public class SearchChildforVaccine extends HttpServlet {


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
        JSONObject jsonobj = new  JSONObject();
                JSONArray jsonarry = new JSONArray();
          String nic =  request.getParameter("NIC");
          String vaccinecategory =  request.getParameter("vaccinecategory");
            QueryDAO queryDAO= new QueryDAO();
            String searchvaccinedetails= "select child_name, due_date,vaccine_category  from chdr.vaccine_schedule_date join child on child_child_birth_register_no= child_birth_register_no join user on child.user_register_no= user.user_register_no where user.nic='"+nic+"' and vaccine_category='"+vaccinecategory+"' ";
            try {
                ResultSet resulSet =  queryDAO.search(searchvaccinedetails);
                while (resulSet.next()) {
                  jsonarry.put(resulSet.getString("due_date"));
                    
                }
                
             String output =   jsonobj.put("due_date",jsonarry).toString();
              response.setContentType("application/json");
                response.getWriter().write(output);
                
            } catch (Exception  ex) {
                ex.printStackTrace();
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
