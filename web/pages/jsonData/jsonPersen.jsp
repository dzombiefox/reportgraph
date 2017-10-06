<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%    
connect c =new connect();

String query="select * from persen left join size on size.size_id=persen.size_id left join line on persen.line_id=line.line_id left join type on persen.type_id=type.type_id order by line_name asc";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
 String[] value = {
rs.getString("persen_id"),
rs.getString("line_name"),
rs.getString("name"),
rs.getString("size"),
rs.getString("sch"),
};
 String[] key = {
"id",
"line",
"name",
"size",
"sch"
};
 
 js.add(new pushData(key, value));
 }
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);
%>
