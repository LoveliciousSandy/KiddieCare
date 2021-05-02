/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kiddiecare.javabean;

import com.kiddiecare.dbutil.DBUtil;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Senani
 */
public class Child {
   private String childBirthRegisterNo ,userNic, healthPhysicianNo, familyHealthPhysicianNo, childName, gender, dob, age, month, days, weight, length;

    public Child() {
    }

   
    public Child(String childBirthRegisterNo, String userNic, String healthPhysicianNo, String familyHealthPhysicianNo, String childName, String gender, String dob, String age, String month, String days, String weight, String length) {
        this.childBirthRegisterNo = childBirthRegisterNo;
        this.userNic = userNic;
        this.healthPhysicianNo = healthPhysicianNo;
        this.familyHealthPhysicianNo = familyHealthPhysicianNo;
        this.childName = childName;
        this.gender = gender;
        this.dob = dob;
        this.age = age;
        this.month = month;
        this.days = days;
        this.weight = weight;
        this.length = length;
    }

   
    public String getChildBirthRegisterNo() {
        return childBirthRegisterNo;
    }

    public void setChildBirthRegisterNo(String childBirthRegisterNo) {
        this.childBirthRegisterNo = childBirthRegisterNo;
    }

    public String getUserNic() {
        return userNic;
    }

    public void setUserNic(String userNic) {
        this.userNic = userNic;
    }

    public String getHealthPhysicianNo() {
        return healthPhysicianNo;
    }

    public void setHealthPhysicianNo(String healthPhysicianNo) {
        this.healthPhysicianNo = healthPhysicianNo;
    }

    public String getFamilyHealthPhysicianNo() {
        return familyHealthPhysicianNo;
    }

    public void setFamilyHealthPhysicianNo(String familyHealthPhysicianNo) {
        this.familyHealthPhysicianNo = familyHealthPhysicianNo;
    }

    public String getChildName() {
        return childName;
    }

    public void setChildName(String childName) {
        this.childName = childName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    
}
