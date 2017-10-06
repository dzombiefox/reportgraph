<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
connect c =new connect();
String per=request.getParameter("per");
String query="select body.detail_id,body.body_name,periode.id,periode.periode,weight.size_items from body join weight on body.id_weight=weight.id_weight join periode on body.body_periode=periode.id where id='"+per+"'";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
 String[] value = {
rs.getString("detail_id"),
rs.getString("body_name"),
rs.getString("size_items"),

};
 String[] key = {
"id",
"name",
"size"
};
 
 js.add(new pushData(key, value));
 }
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);
%>
