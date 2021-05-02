/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.dbutil;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Senani
 */
public interface DAO {
    
 public boolean save (String sqlquery) throws SQLException;
public ResultSet search(String sqlquer) throws SQLException;
 
}
