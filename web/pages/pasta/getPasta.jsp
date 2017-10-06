<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
connect c =new connect();
String per=request.getParameter("per");
String query="select  pasta.detail_id,pasta.name,color.name as color,size.size from pasta join color on pasta.color_id=color.color_id join size on pasta.size_id=size.size_id where periode='"+per+"'";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
 String[] value = {
rs.getString("detail_id"),
rs.getString("name"),
rs.getString("color"),
rs.getString("size"),


};
 String[] key = {
"id",
"name",
"color",
"size",


};
 
 js.add(new pushData(key, value));
 }
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);
%>
