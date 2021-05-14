<%-- 
    Document   : newjsp
    Created on : Apr 8, 2021, 3:11:53 AM
    Author     : Senani
--%>


<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONObject"%>
<%@page import="javax.json.JsonObject"%>
<%@page import="javax.json.Json"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    Gson gsonObj = new Gson();
   //JSONObject jo = new JSONObject();
            
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list1 = new ArrayList<Map<Object, Object>>();
    List<Map<Object, Object>> list2 = new ArrayList<Map<Object, Object>>();
    map = new HashMap<Object,Object>(); map.put("label", "1"); map.put("y", 1); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2"); map.put("y", 3); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "3"); map.put("y", 10); list1.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "4"); map.put("y", 11); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "5"); map.put("y", 13); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "6"); map.put("y", 20); list1.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "7"); map.put("y", 21); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "8"); map.put("y", 23); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "9"); map.put("y", 30); list1.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "10"); map.put("y", 35); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "11"); map.put("y", 38); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "12"); map.put("y", 45); list1.add(map);







 map = new HashMap<Object,Object>(); map.put("label", "1"); map.put("y", 5); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2"); map.put("y", 9); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "3"); map.put("y", 15); list2.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY08"); map.put("y", 213); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY09"); map.put("y", 213); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY10"); map.put("y", 219); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY11"); map.put("y", 207); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY12"); map.put("y", 167); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY13"); map.put("y", 136); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY14"); map.put("y", 152); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY15"); map.put("y", 129); list.add(map);
//map = new HashMap<Object,Object>(); map.put("label", "FY16"); map.put("y", 155); list.add(map);
    String dataPoints1 = gsonObj.toJson(list1);
    String dataPoints2 = gsonObj.toJson(list2);


//    String dataPoints2 = o.toJson(list2);
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
                    text: "Title"
                },
                axisX: {
                    title: "month"
                },
                axisY: {
                    title: "Value",
                    includeZero: true
                },
                data: [{
                        type: "line",
                        dataPoints: <%out.print(dataPoints1);%>
                    },
            
                    {
                        type: "line",
                        dataPoints: <%out.print(dataPoints2);%>
                    }]
                        

});
            chart.render();

        }
    </script>

</html>
