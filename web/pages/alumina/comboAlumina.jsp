<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
connect c =new connect();
String per=request.getParameter("per");
String query="select a.alumina_id,a.alumina_name,p.id,p.periode,w.size_items from alumina a join weight w on a.id_weight=w.id_weight join periode p on a.periode=p.id where id='"+per+"'";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
 String[] value = {
rs.getString("alumina_id"),
rs.getString("alumina_name"),
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
