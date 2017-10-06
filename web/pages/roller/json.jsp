<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
     int n=0;
connect c =new connect();
String query="select * from mroller";
ResultSet rs=c.GetData(query);
JSONObject json=new JSONObject();
JSONArray js = new JSONArray();
while(rs.next()){
    String pt=rs.getString("price");

  
    n++;
    String no=Integer.toString(n);
 String[] value = {
     no,
rs.getString("mroller_id"),
rs.getString("code"),
rs.getString("name"),
rs.getString("motif"),
rs.getString("subCode"),
rs.getString("status"),
rs.getString("life"),
pt,
rs.getString("priceCalc")
};
 js.put(value);
 }

json.put("aaData", js);
out.print(json.toString());
%>
