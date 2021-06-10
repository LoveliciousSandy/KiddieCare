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
public class LoginToApp {

    private String userNic;
    private String password;

    public LoginToApp() {
    }

    public LoginToApp(String userNic, String password) {
        this.userNic = userNic;
        this.password = password;
    }

    public String getUserNic() {
        return userNic;
    }

    public void setUserNic(String userNic) {
        this.userNic = userNic;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
}
