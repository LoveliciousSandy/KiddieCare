<%-- 
    Document   : HeightAgeGraph
    Created on : Apr 8, 2021, 5:13:19 PM
    Author     : Senani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.kiddiecare.dbutil.QueryDAO"%>
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
    
    //3SD
 map = new HashMap<Object,Object>(); map.put("label", "0"); map.put("y", 54.7); list2.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "5"); map.put("y", 70.7); list2.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "10"); map.put("y", 78.9); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "15"); map.put("y",85.7); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "20"); map.put("y", 91.7); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "25"); map.put("y", 96.4); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "30"); map.put("y", 101.3); list2.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "35"); map.put("y", 105.6); list2.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "40"); map.put("y", 109.7); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "45"); map.put("y", 113.5); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "50"); map.put("y", 117.1); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "55"); map.put("y", 120.4); list2.add(map);
map = new HashMap<Object,Object>(); map.put("label", "60"); map.put("y", 123.7); list2.add(map);


//child

 String userNIC = request.getParameter("userNIC");
 String name = request.getParameter("childName");
        
          //SELECT weight, totalmonths FROM chdr.record JOIN chdr.child on child_child_birth_register_no = child_birth_register_no JOIN chdr.user on child.user_register_no = chdr.user.user_register_no WHERE child_name="hf" and nic=926071378;
         String sqlquery = "SELECT height, totalmonths FROM chdr.record JOIN chdr.child on child_child_birth_register_no = child_birth_register_no JOIN chdr.user on child.user_register_no = chdr.user.user_register_no WHERE child_name='"+name+"' and nic='"+userNIC+"'";
            
            QueryDAO querydao = new QueryDAO();
                   
            ResultSet resusltset =   querydao.search(sqlquery);
             int rowCount = 0;
            if (resusltset.last()) { // go to last row 
                rowCount = resusltset.getRow();//get row count 
            }
            resusltset.beforeFirst();

            while (resusltset.next()) { 
                for (int i = 0; i < rowCount ; i++) {
                    
             map = new HashMap<Object,Object>(); map.put("label", resusltset.getString("totalmonths")); map.put("y", Double.parseDouble(resusltset.getString("height")));
            //  map = new HashMap<Object,Object>(); map.put("label", i); map.put("y", 3); list3.add(map);
                      }
                list3.add(map); 
           
            }

    //-2SD
   map = new HashMap<Object,Object>(); map.put("label", "0"); map.put("y", 45.4); list1.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "5"); map.put("y", 59.6); list1.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "10"); map.put("y", 66.5); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "15"); map.put("y", 72.0); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "20"); map.put("y", 76.7); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "25"); map.put("y", 80.0); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "30"); map.put("y", 83.6); list1.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "35"); map.put("y", 86.8); list1.add(map);
   map = new HashMap<Object,Object>(); map.put("label", "40"); map.put("y", 89.8); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "45"); map.put("y", 92.5); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "50"); map.put("y", 95.1); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "55"); map.put("y", 97.6); list1.add(map);
map = new HashMap<Object,Object>(); map.put("label", "60"); map.put("y", 99.9); list1.add(map);


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
                    text: "WHO Height/Age Chart"
                },
                axisX: {
                    title: "Month"
                },
                axisY: {
                    title: "Height(in cm)",
                    includeZero: false
                },
                data: [{
                        type: "line",
                        lineDashType: "dot",
                        showInLegend: true,
			name: "3SD",
                        dataPoints: <%out.print(dataPoints1);%>
                        
                    },
            
                    {
                        type: "line",
                        lineDashType: "dot",
                        showInLegend: true,
			name: "-2SD",
                        dataPoints: <%out.print(dataPoints2);%>
                    },
                    {
                        type: "line",
                        showInLegend: true,
			name: "Child Line",
                        dataPoints: <%out.print(dataPoints3);%>
                    }]
                     

});
            chart.render();

        };
    </script>

</html>
