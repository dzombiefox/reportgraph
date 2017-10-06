<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
connect c =new connect();
String per=request.getParameter("per");
String query="select ink.detail_id,ink.name,color.name as color from ink join color on ink.color_id=color.color_id where  periode='"+per+"'";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
 String[] value = {
rs.getString("detail_id"),
rs.getString("name"),
rs.getString("color"),

};
 String[] key = {
"id",
"name",
"color",

};
 
 js.add(new pushData(key, value));
 }
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);
%>

