/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.dbutil;

import java.sql.SQLException;

/**
 *
 * @author Senani
 */
public interface DAO {
    
 public void save (String sqlquery) throws SQLException;
 
}
