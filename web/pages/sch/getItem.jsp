<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%    
connect c =new connect();
String query="select * from prices join persen on prices.persen_id=persen.persen_id join line on persen.line_id=line.line_id" ;
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
String cod=rs.getString("item_code");
cod=cod.replace("<", "&lt");
String[] value = {
rs.getString("prices_id"),
cod,
rs.getString("periode"),
rs.getString("year"),
rs.getString("line_name"),
};
 String[] key = {
"id",
"code",
"periode",
"year",
"line"

}; 
 js.add(new pushData(key, value));
 }
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);
%>