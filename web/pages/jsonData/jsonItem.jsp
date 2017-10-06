<%@page import="java.text.NumberFormat"%>
<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
connect c =new connect();
String query="select * from items order by items_id desc";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
NumberFormat nf=NumberFormat.getInstance();
while(rs.next()){
String[] value = {
 rs.getString("items_id"),
 rs.getString("items_Code"),
 rs.getString("items_name"),
 nf.format(rs.getDouble("items_uprecent")),
 rs.getString("month"),
 rs.getString("year")
};
String[] key = {
 "id",
 "code",
 "desc",
 "price",
 "month",
 "year"
               }; 
js.add(new pushData(key, value));
 }
    StringWriter hasil = new StringWriter();
    js.writeJSONString(hasil);
    String jsons = hasil.toString();
    out.print(jsons);
%>
