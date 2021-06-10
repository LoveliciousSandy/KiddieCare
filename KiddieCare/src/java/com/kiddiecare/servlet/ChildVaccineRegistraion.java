/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.servlet;

import com.kiddiecare.dbutil.QueryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Senani
 */
public class ChildVaccineRegistraion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        boolean queryStatus = false;
        try {
            ArrayList list = new ArrayList();
            //String idchild_vaccination_detail, child_child_birth_register_no, vaccine_idvaccine, vaccinecategory_idvaccinecategory, due_date, given_date, status;
            String vaccineNicNo = request.getParameter("vaccineNicNo");
            String vaccinechildName = request.getParameter("vaccinechildName");
            String[] vaccineIdarray = (String[]) request.getParameterValues("vaccineIds");
            String[] x = vaccineIdarray[0].split(",");
            System.out.println(x);
            for (int i = 0; i < x.length; i++) {
                String vaccineId = x[i];

                // get birth registraionNo 
                //SELECT child_birth_register_no FROM chdr.child JOIN chdr.user on child.user_register_no= user.user_register_no WHERE child_name ="hf" and user.nic="926071378";
                String birthRegistraionNo = "SELECT child_birth_register_no FROM chdr.child JOIN chdr.user on child.user_register_no= user.user_register_no WHERE child_name ='" + vaccinechildName + "' and user.nic='" + vaccineNicNo + "'";

                //getVaccineId
                //String vaccineId 
                // getVaccine Category
                String vaccineCategory = "SELECT duecattegory FROM chdr.vaccine  WHERE vaccine.idvaccine ='" + vaccineId + "'";

                //getduedate
                // SELECT  DATE_ADD(dob, INTERVAL (SELECT duecattegory FROM chdr.vaccine WHERE vaccine.idvaccine=2) MONTH) as due  from chdr.child JOIN chdr.user on child.user_register_no = user.user_register_no  JOIN chdr.vaccine on child.child_name="hf" and user.nic=926071378 WHERE idvaccine=2 ;
                String dueDate = "SELECT  DATE_ADD(dob, INTERVAL (SELECT duecattegory FROM chdr.vaccine WHERE vaccine.idvaccine='" + vaccineId + "') MONTH) as due  from chdr.child JOIN chdr.user on child.user_register_no = user.user_register_no  JOIN chdr.vaccine on child.child_name='" + vaccinechildName + "' and user.nic='" + vaccineNicNo + "' WHERE idvaccine='" + vaccineId + "'";
              
                //getgivenDate
                LocalDate givenDate = java.time.LocalDate.now();
                System.out.println(givenDate);

                // status
                String status = "Yes";

                String saveChildVaccinDetails = "INSERT INTO child_vaccination_details (child_child_birth_register_no, vaccine_idvaccine, vaccinecategory_idvaccinecategory, due_date, given_date, status) VALUES ((" + birthRegistraionNo + "), '" + vaccineId + "',(" + vaccineCategory + "),(" + dueDate + "),'" + givenDate + "','" + status + "')";
                System.out.println(saveChildVaccinDetails);
                QueryDAO querydao = new QueryDAO();
                querydao.save(saveChildVaccinDetails);
            }
            queryStatus = true;
             if (queryStatus) {
                  response.getWriter().write("OK");
                  
            } else {
                 response.getWriter().write("Error");
            }

        } catch (Exception e) {
            e.printStackTrace();
              response.getWriter().write("Error");
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
