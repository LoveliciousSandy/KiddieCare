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
public class AdminPanelSearchVaccineDetails extends HttpServlet {

  /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //corecr one
        String childagey, childagem, childaged;
        ArrayList<String[]> l0 = new ArrayList();
        ArrayList<String[]> l1 = new ArrayList();
        ArrayList<String[]> l2 = new ArrayList();
        ArrayList<String[]> l3 = new ArrayList();
        ArrayList<String[]> l4 = new ArrayList();
        ArrayList<String[]> l5 = new ArrayList();
        ArrayList<String[]> l6 = new ArrayList();
        ArrayList<String[]> l7 = new ArrayList();
        ArrayList<String[]> l8 = new ArrayList();
//        ArrayList l3 = new ArrayList();
//        ArrayList l4 = new ArrayList();
        ArrayList list = new ArrayList();
        String userNIC = request.getParameter("userNIC");
        String childName = request.getParameter("childName");

        String searchchildamd = "SELECT dob, TIMESTAMPDIFF( YEAR, dob, now() ) as _year, TIMESTAMPDIFF( MONTH, dob, now() ) % 12 as _month, FLOOR( TIMESTAMPDIFF( DAY, dob, now() ) % 30.4375 ) as _day FROM chdr.child JOIN chdr.user on child.user_register_no = user.user_register_no WHERE child.child_name='" + childName + "'and user.nic='" + userNIC + "'";// get age query

        QueryDAO querydao = new QueryDAO();
        JSONObject jo = new JSONObject();
        JSONArray ja1 = new JSONArray();
        try {
            JSONObject jo1 = new JSONObject();
            ResultSet resultset = querydao.search(searchchildamd);
            while (resultset.next()) {

                childagey = (resultset.getString("_year"));
                childagem = (resultset.getString("_month"));
                childaged = (resultset.getString("_day"));

                jo1.put("years", childagey);
                jo1.put("months", childagem);
                jo1.put("days", childaged);
            }

            String sqlquery = "SELECT dob,  DATE_ADD(dob, INTERVAL 2 MONTH) as due2months, DATE_ADD(dob, INTERVAL 4 MONTH) as due4months, DATE_ADD(dob, INTERVAL 6 MONTH) as due6months, DATE_ADD(dob, INTERVAL 9 MONTH) as due9months, DATE_ADD(dob, INTERVAL 1 year) as due12months, DATE_ADD(dob, INTERVAL 18 MONTH) as due18months,  DATE_ADD(dob, INTERVAL 3 YEAR) as due3years, DATE_ADD(dob, INTERVAL 5 YEAR) as due5years from chdr.child JOIN chdr.user on child.user_register_no = user.user_register_no WHERE child.child_name='" + childName + "'and user.nic='" + userNIC + "'";
//SELECT  DATE_ADD(dob, INTERVAL 2 MONTH) as due2months, DATE_ADD(dob, INTERVAL 4 MONTH) as due4months, DATE_ADD(dob, INTERVAL 6 MONTH) as due6months, DATE_ADD(dob, INTERVAL 9 MONTH) as due9months, DATE_ADD(dob, INTERVAL 1 year) as due12months, DATE_ADD(dob, INTERVAL 18 MONTH) as due18months,  DATE_ADD(dob, INTERVAL 3 YEAR) as due3years, DATE_ADD(dob, INTERVAL 5 YEAR) as due5years from chdr.child JOIN chdr.user on child.user_register_no = user.user_register_no WHERE child.child_name="hf" and user.nic=547410017;
            ResultSet resusltset = querydao.search(sqlquery);
            ArrayList list1 = new ArrayList();
            while (resusltset.next()) {
                list1.add(resusltset.getString("dob"));
                list1.add(resusltset.getString("due2months"));
                list1.add(resusltset.getString("due4months"));
                list1.add(resusltset.getString("due6months"));
                list1.add(resusltset.getString("due9months"));
                list1.add(resusltset.getString("due12months"));
                list1.add(resusltset.getString("due18months"));
                list1.add(resusltset.getString("due3years"));
                list1.add(resusltset.getString("due5years"));
            }
            jo1.put("duedates", list1);

            String sqlvaccineNamequery = "SELECT idvaccine,vaccine_category,vaccine_name FROM chdr.vaccine;";
            ResultSet rs = querydao.search(sqlvaccineNamequery);

            while (rs.next()) {
                if (rs.getString("vaccine_category").equals("At Birth")) {
                    l0.add(new String[]{rs.getString("idvaccine"), rs.getString("vaccine_name")});
                } else if (rs.getString("vaccine_category").equals("2 Months")) {
                    l1.add(new String[]{rs.getString("idvaccine"), rs.getString("vaccine_name")});
                } else if (rs.getString("vaccine_category").equals("4 Months")) {
                    l2.add(new String[]{rs.getString("idvaccine"), rs.getString("vaccine_name")});
                } else if (rs.getString("vaccine_category").equals("6 Months")) {
                    l3.add(new String[]{rs.getString("idvaccine"), rs.getString("vaccine_name")});
                } else if (rs.getString("vaccine_category").equals("9 Months")) {
                    l4.add(new String[]{rs.getString("idvaccine"), rs.getString("vaccine_name")});
                } else if (rs.getString("vaccine_category").equals("12 Months")) {
                    l5.add(new String[]{rs.getString("idvaccine"), rs.getString("vaccine_name")});
                }else if (rs.getString("vaccine_category").equals("18 Months")) {
                    l6.add(new String[]{rs.getString("idvaccine"), rs.getString("vaccine_name")});
                } else if (rs.getString("vaccine_category").equals("3 Years")) {
                    l7.add(new String[]{rs.getString("idvaccine"), rs.getString("vaccine_name")});
                }else if (rs.getString("vaccine_category").equals("5 Years")) {
                    l8.add(new String[]{rs.getString("idvaccine"), rs.getString("vaccine_name")});
                }
            }
            ja1.put(l0);
            ja1.put(l1);
            ja1.put(l2);
            ja1.put(l3);
            ja1.put(l4);
            ja1.put(l5);
            ja1.put(l6);
            ja1.put(l7);
            ja1.put(l8);

            jo1.put("vaccinesName", ja1);

            String sqlvaccinestatus = "SELECT chdr.child_vaccination_details.vaccine_idvaccine FROM chdr.child_vaccination_details JOIN chdr.child on chdr.child_vaccination_details.child_child_birth_register_no = chdr.child.child_birth_register_no JOIN chdr.user on chdr.child.user_register_no = chdr.user.user_register_no WHERE chdr.child.child_name='"+childName+"'and chdr.user.nic='"+userNIC+"'";
            ResultSet rsstatus = querydao.search(sqlvaccinestatus);
            while (rsstatus.next()) {

                list.add(rsstatus.getString("vaccine_idvaccine"));
            }
            jo1.put("vaccineCompleted", list);

            System.out.println(jo.put("loadvaccinedetails", jo1).toString());
            String output = jo.put("loadvaccinedetails", jo1).toString();
            response.setContentType("application/json");
            response.getWriter().write(output);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
//        String category = request.getParameter("category");
//
//        String searchVaccine = "SELECT vaccine_name FROM chdr.vaccine where vaccine_category='" + category + "'";
//        String duedatequery = "";
//        QueryDAO querydao = new QueryDAO();
//        JSONObject jo = new JSONObject();
//        try {
//            ResultSet resultset = querydao.search(searchVaccine);
//            ArrayList<String> vaccineNamesList = new ArrayList<>();
//            while (resultset.next()) {
//
//                String vaccineNames = (resultset.getString("vaccine_name"));
//
//                vaccineNamesList.add(vaccineNames);
//
//            }
//            String output = jo.put("vaccineNames", vaccineNamesList).toString();
//            response.setContentType("application/json");
//            response.getWriter().write(output);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

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
