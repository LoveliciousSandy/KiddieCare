/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.noitiazone.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Senani
 */
public class DBUtil {
    
   private final String username = "root";
   private final String password = "1234";
   private final String url = "jdbc:mysql://localhost/chdr"; 
   
   public Connection getConnection() {
       Connection conn = null;
       try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn  = DriverManager.getConnection(url, username, password);
       } catch(ClassNotFoundException e) {
           System.err.print("Cannot load JDBC driver");
       } catch (SQLException e) {
            if (e.getErrorCode() ==1044 ) {
                System.err.print("Wrong username or password");
            } else if (e.getErrorCode() == 1049) {
                System.err.print("Wrong schema");
            } 
       } catch (Exception e) {
           System.err.print("Wrong schema");
       }
       return conn;
   }
}