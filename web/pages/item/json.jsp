<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
int n=0;
connect c =new connect();
String query="select * from items order by items_id desc";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
n++;
String no=Integer.toString(n);
String[] value = {
no,
rs.getString("items_id"),
rs.getString("items_code"),
rs.getString("items_name"),
rs.getString("items_desc"),
rs.getString("items_uprecent"),
rs.getString("items_volume"),
rs.getString("items_color")
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
