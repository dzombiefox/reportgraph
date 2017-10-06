<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
connect c =new connect();
String query="select a.rmotif_id,a.name as a,a.opt,b.name as b,c.name as c from rmotif a join type b on a.type_id=b.type_id join brand c on a.brand_id=c.brand_id";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
 String[] value = {
rs.getString("rmotif_id"),
rs.getString("a"),
rs.getString("b"),
rs.getString("c"),
rs.getString("opt")
};
 String[] key = {
"id",
"name",
"tipe",
"brand",
"option"
};
 
 js.add(new pushData(key, value));
 }
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);
%>
