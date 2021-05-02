/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.dbutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Senani
 */
public class QueryDAO implements DAO {

    public QueryDAO() {
    }

    @Override
    public boolean save(String sqlquery) throws SQLException {
        boolean rowinserted = false;
        Statement stmt = new DBUtil().getConnection().createStatement();
        rowinserted= stmt.executeUpdate(sqlquery)>0;
        return rowinserted;
      

    }

}
