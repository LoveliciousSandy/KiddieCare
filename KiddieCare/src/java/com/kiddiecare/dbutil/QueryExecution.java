/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.dbutil;

import com.kiddiecare.javabean.LoginToApp;
import com.kiddiecare.servlet.Login;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Senani
 */
public class QueryExecution implements DataAccessObject {

    @Override
    public boolean save(LoginToApp login) throws SQLException {
        String sqlquery = "INSERT INTO Login VALUES (?,?)";
         boolean rowinserted = false;
         
        PreparedStatement stmt = new DBUtil().getConnection().prepareStatement(sqlquery);
        stmt.setString(1, login.getUserNic());
        stmt.setString(2, login.getPassword());
        rowinserted= stmt.executeUpdate(sqlquery)>0;
        return rowinserted;
        
        
        
    }

  

   

    
        
   

}
