/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.dbutil;

import com.kiddiecare.javabean.LoginToApp;
import java.sql.SQLException;

/**
 *
 * @author Senani
 */
public interface DataAccessObject{
    
    public boolean save (LoginToApp login) throws SQLException;
    
}
