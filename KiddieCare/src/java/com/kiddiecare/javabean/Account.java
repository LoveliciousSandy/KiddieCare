/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.javabean;

/**
 *
 * @author Senani
 */
public class Account {

    private String usernic;
    private String password;

    public Account() {
    }

    public Account(String usernic, String password) {
        this.usernic = usernic;
        this.password = password;
    }

    public String getUsernic() {
        return usernic;
    }

    public void setUsernic(String usernic) {
        this.usernic = usernic;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
