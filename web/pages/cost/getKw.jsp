<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%    
connect c =new connect();
String query="select  * from kw" ;
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
 String[] value = {
rs.getString("kw_id"),
rs.getString("kw_name")
};
 String[] key = {
"id",
"nama"
}; 
 js.add(new pushData(key, value));
 }
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);
%>