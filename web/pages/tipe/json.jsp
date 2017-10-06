<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
    int n=0;
connect c =new connect();
String query="select * from type";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
    n++;
String no=Integer.toString(n);
String[] value = {
no,
    rs.getString("type_id"),
    rs.getString("name"),
rs.getString("density")


};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
