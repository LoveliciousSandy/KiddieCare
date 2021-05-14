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
public class Record {
    String idrecord, date, weight, height, childBirthRegisterNo;
    
    
    public  void setRecordData(String date,String weight,String height){
     this.date = date;
     this.weight=weight;
     this.height= weight;
    }

    
    
    public String getIdrecord() {
        return idrecord;
    }

    public void setIdrecord(String idrecord) {
        this.idrecord = idrecord;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getChildBirthRegisterNo() {
        return childBirthRegisterNo;
    }

    public void setChildBirthRegisterNo(String childBirthRegisterNo) {
        this.childBirthRegisterNo = childBirthRegisterNo;
    }
}
