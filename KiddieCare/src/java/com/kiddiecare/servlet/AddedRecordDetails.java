/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.servlet;

import com.kiddiecare.dbutil.QueryDAO;
import com.kiddiecare.javabean.Record;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class AddedRecordDetails extends HttpServlet {

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
        String name = request.getParameter("name");
        String searchRecordDetails = "SELECT record.date, record.weight,record.height,record.totalmonths ,dob, TIMESTAMPDIFF (YEAR, dob, now() ) as _year, TIMESTAMPDIFF( MONTH, dob, now() ) % 12 as _month, FLOOR( TIMESTAMPDIFF( DAY, dob, now() ) % 30.4375 ) as _day  FROM chdr.record JOIN chdr.child on record.child_child_birth_register_no = child.child_birth_register_no WHERE child.child_name='" + name + "'";
        //String searchchildage = "SELECT dob, TIMESTAMPDIFF( YEAR, dob, now() ) as _year, TIMESTAMPDIFF( MONTH, dob, now() ) % 12 as _month, FLOOR( TIMESTAMPDIFF( DAY, dob, now() ) % 30.4375 ) as _day FROM chdr.child where child_name ='"+name+"'";// get age query
        //String searchRecordDetailsByName = "SELECT record.date, record.weight,record.height,record.recordage FROM chdr.record JOIN chdr.child on record.child_child_birth_register_no = child.child_birth_register_no WHERE child.child_name= '" + name + "'";
        QueryDAO querydao = new QueryDAO();
        JSONObject jobj = new JSONObject();
        JSONArray ja = new JSONArray();
        try {
            ResultSet resultset = querydao.search(searchRecordDetails);

            while (resultset.next()) {
                JSONObject jo = new JSONObject();
                jo.put("years", resultset.getString("_year"));
                jo.put("months", resultset.getString("_month"));
                jo.put("days", resultset.getString("_day"));
                
                jo.put("date", resultset.getString("date"));
                jo.put("weight", resultset.getString("weight"));
                jo.put("height", resultset.getString("height"));
                jo.put("totalmonths", resultset.getString("totalmonths"));
                ja.put(jo);
                
            }
             String output = jobj.put("recordDetails", ja).toString();
            System.out.println(output);
            response.setContentType("application/json");
            response.getWriter().write(output);
            

        } catch (Exception e) {
            e.printStackTrace();
        }

//        try {
//            ResultSet resultset = querydao.search(searchchildage);
//            while (resultset.next()) {
//
//                //todaychildage = Integer.parseInt(resultset.getString("childage"));
//               childagey = (resultset.getString("_year"));
//                childagem = (resultset.getString("_month"));
//                childaged = (resultset.getString("_day"));
//                   JSONObject jo = new JSONObject();
//              jo.put("year", childagey);
//                jo.put("month", childagem);
//                jo.put("days", childaged);
//                
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
       // try {
//
//            ResultSet resultset = querydao.search(searchRecordDetailsByName);
//            int rowCount = 0;
//            if (resultset.last()) { // go to last row 
//                rowCount = resultset.getRow();//get row count 
//            }
//            resultset.beforeFirst();
//            while (resultset.next()) {
//
//                JSONObject jo = new JSONObject();
//                jo.put("date", resultset.getString("date"));
//                jo.put("height", resultset.getString("height"));
//                jo.put("weight", resultset.getString("weight"));
//                jo.put("rowCount", rowCount);
//                jo.put("year", childagey);
//                jo.put("month", childagem);
//                jo.put("days", childaged);
//                
//                ja.put(jo);
//                //ja.put((resultset.getString("date"))+","+(resultset.getString("height"))+","+(resultset.getString("weight")));
//
//            }
//            System.out.println("JSON arr" + ja.toString());
//
//            String output = jo2.put("recordDetails", ja).toString();
//            response.setContentType("application/json");
//            response.getWriter().write(output);
//        } catch (Exception ex) {
//
//            ex.printStackTrace();
//        }

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
