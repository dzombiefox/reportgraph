<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
    int n=0;
connect c =new connect();
String query="select  b.detail_id,b.name,b.weight,b.date,s.size,p.periode,c.name as color from engobe b JOIN SIZE s on b.size_id=s.size_id join periode p on b.periode=p.id join color c on b.color_id=c.color_id";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
n++;
String no=Integer.toString(n);
String idNya=rs.getString("detail_id");
String[] value = {
no,
rs.getString("detail_id"),
rs.getString("date"),
rs.getString("periode"),
rs.getString("name"),
rs.getString("size"),
rs.getString("weight"),
rs.getString("color"),

};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
