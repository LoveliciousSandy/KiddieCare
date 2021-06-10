/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.servlet;

import com.kiddiecare.dbutil.DAOImp;
import com.kiddiecare.dbutil.QueryDAO;
import com.kiddiecare.dbutil.QueryExecution;
import com.kiddiecare.javabean.LoginToApp;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Senani
 */
public class Login extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            boolean loginstatus = false;
            try {
                String userNIC = request.getParameter("userNIC");
                String password = request.getParameter("password");
                if ((userNIC.equals("admin") && password.equals("admin"))) {
                    response.getWriter().write("OK1");
                }
                QueryDAO queryDAO = new QueryDAO();
                String loginsearchQuery = "SELECT * FROM chdr.login WHERE nic='" + userNIC + "' AND password='" + password + "'";
                ResultSet rs = queryDAO.search(loginsearchQuery);
                while (rs.next()) {
                    if ((rs.getString("nic").equals(userNIC)) && (rs.getString("password").equals(password))) {
                        String userDetailsQuery = "SELECT * FROM chdr.user WHERE user.nic='" + userNIC + "'";
                        ResultSet rst = queryDAO.search(userDetailsQuery);
                        if (rst.next()) {
                            HttpSession session = request.getSession();
                            session.setAttribute("userNIC", rst.getString("nic"));
                            session.setAttribute("userName", rst.getString("guardian_name"));
                            // loginstatus=true;
                        }
                        //if (loginstatus) {
                        response.getWriter().write("OK2");

                        // }
                    } else {
                        System.out.println("login error");
                    }
                }

//               if (userName.equals("admin123")&& password.equals("admin")) {
//                    response.sendRedirect(request.getContextPath()+ "/AdminPanel/AdminDashboard.jsp");
//                QueryExecution qe= new QueryExecution();
//                LoginToApp login = new LoginToApp();
//                login.setUserNic(userName);
//                login.setPassword(password);
//                qe.save(login);
            } catch (Exception ex) {
                ex.printStackTrace();
            }

//               } else {
//                    response.sendRedirect(request.getContextPath()+ "/UserPanel/Login.jsp");
//               }
//       
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
