<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
    int n=0;
connect c =new connect();
String query="SELECT i.detail_id,i.name,i.date,s.size,c.name as color,per.periode from ink i join size s on i.size_id=s.size_id join color c on i.color_id=c.color_id join periode per on i.periode=per.id ";
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
rs.getString("color"),

};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
