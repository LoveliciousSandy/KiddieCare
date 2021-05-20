<%-- 
    Document   : WeightAgeGraph
    Created on : May 20, 2021, 11:01:28 AM
    Author     : Senani
--%>


<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.kiddiecare.dbutil.QueryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list1 = new ArrayList<Map<Object, Object>>();
    List<Map<Object, Object>> list2 = new ArrayList<Map<Object, Object>>();
    List<Map<Object, Object>> list3 = new ArrayList<Map<Object, Object>>();
    
    //1SD
 map = new HashMap<Object,Object>(); map.put("label", "0"); map.put("y", 4.4); list2.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "5"); map.put("y", 9.3); list2.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "10"); map.put("y", 11.4); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "15"); map.put("y", 12.8); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "20"); map.put("y", 14.2); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "25"); map.put("y", 15.5); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "30"); map.put("y", 16.9); list2.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "35"); map.put("y", 18.1); list2.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "40"); map.put("y", 19.3); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "45"); map.put("y", 20.5); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "50"); map.put("y", 21.7); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "55"); map.put("y", 22.9); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "60"); map.put("y", 24.2); list2.add(map);
%>
<!--//child-->
<%

 String name =   "senani";
          String sqlquery = "select record.weight, record.recordage from record join child on child_child_birth_register_no=child_birth_register_no where child.child_name='"+name+"'";
            
            QueryDAO querydao = new QueryDAO();
                     JSONArray ja = new JSONArray();
            ResultSet resusltset =   querydao.search(sqlquery);
             int rowCount = 0;
            if (resusltset.last()) { // go to last row 
                rowCount = resusltset.getRow();//get row count 
            }
            resusltset.beforeFirst();

            while (resusltset.next()) { 
                for (int i = 0; i < rowCount ; i++) {
                map = new HashMap<Object,Object>(); map.put("label",resusltset.getString("recordage")); map.put("y", resusltset.getString("weight")); list3.add(map);
                }
           
            }

%>
<%
    //-2SD
   map = new HashMap<Object,Object>(); map.put("label", "0"); map.put("y", 2.9); list1.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "5"); map.put("y", 6.0); list1.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "10"); map.put("y", 8.2); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "15"); map.put("y", 9.2); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "20"); map.put("y", 10.1); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "25"); map.put("y", 11.0); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "30"); map.put("y", 11.8); list1.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "35"); map.put("y", 12.6); list1.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "40"); map.put("y", 13.3); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "45"); map.put("y", 14.0); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "50"); map.put("y", 14.7); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "55"); map.put("y", 15.4); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "60"); map.put("y", 16.0); list1.add(map);




  //map = new HashMap<Object,Object>(); map.put("label", "0"); map.put("y", 4.4); list2.add(map);
//    map = new HashMap<Object,Object>(); map.put("label", "10"); map.put("y", 11.4); list2.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "20"); map.put("y", 14.2); list2.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "30"); map.put("y", 16.9); list2.add(map);
//   map = new HashMap<Object,Object>(); map.put("label", "40"); map.put("y", 19.3); list2.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "50"); map.put("y", 21.7); list2.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "60"); map.put("y", 24.2); list2.add(map);


//map = new HashMap<Object,Object>(); map.put("label", "10"); map.put("y", 14.2); list3.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY11"); map.put("y", 207); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY12"); map.put("y", 167); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY13"); map.put("y", 136); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY14"); map.put("y", 152); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY15"); map.put("y", 129); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY16"); map.put("y", 155); list.add(map);
    String dataPoints1 = gsonObj.toJson(list1);
    String dataPoints2 = gsonObj.toJson(list2);
    String dataPoints3 = gsonObj.toJson(list3);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div id="chartContainer" style="width: 100%"></div>
            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

        </div>
    </body>
    <script>
        window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
                theme: "light2",
                title: {
                    text: "WHO Weight/Age Chart"
                },
                axisX: {
                    title: "Month"
                },
                axisY: {
                    title: "Weight(in Kg)",
                    includeZero: true
                },
                data: [{
                        type: "line",
                        dataPoints: <%out.print(dataPoints1);%>
                        
                    },
            
                    {
                        type: "line",
                        dataPoints: <%out.print(dataPoints2);%>
                    },
                    {
                        type: "line",
                        dataPoints: <%out.print(dataPoints3);%>
                    }]
                        

});
            chart.render();

        };
    </script>

</html>
