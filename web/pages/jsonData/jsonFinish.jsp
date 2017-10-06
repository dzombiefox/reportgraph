<%@page import="java.text.NumberFormat"%>
<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
connect c =new connect();
String query="select * from finish ";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
NumberFormat nf=NumberFormat.getInstance();
while(rs.next()){
String code=rs.getString("item_code");
code=code.replace("<", "&lt;");
String[] value = {
rs.getString("finish_id"),
code
};
String[] key = {
 "id",
 "code",

               }; 
js.add(new pushData(key, value));
 }
    StringWriter hasil = new StringWriter();
    js.writeJSONString(hasil);
    String jsons = hasil.toString();
    out.print(jsons);
%>
