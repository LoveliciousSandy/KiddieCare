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
public class WeightAge extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet WeightAge</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WeightAge at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
          String name =   request.getParameter("childName");
          String sqlquery = "select record.weight, record.recordage from record join child on child_child_birth_register_no=child_birth_register_no where child.child_name= '"+name+"'";
            
            QueryDAO querydao = new QueryDAO();
                     JSONArray ja = new JSONArray();
            ResultSet resusltset=   querydao.search(sqlquery);
            
           JSONObject jo = new JSONObject();

            while (resusltset.next()) { 
                
                jo.put("weight",resusltset.getString("weight"));
                jo.put("age",resusltset.getString("age"));

            }
            System.out.println("JSON arr" + jo.toString());

            String output = ja.put(jo).toString();
             response.sendRedirect(request.getContextPath()+"AdminPanel/WeightAgeGraph.jsp?="+output);
//            response.setContentType("application/json");
//            response.getWriter().write(output);
            
        } catch (Exception ex) {
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
