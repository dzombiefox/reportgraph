<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%    
connect c =new connect();
String per=request.getParameter("per");
String query="select b.detail_id,b.name,w.size from body b join size w on b.size_id=w.size_id where b.periode='"+per+"'";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
String[] value = {
rs.getString("detail_id"),
rs.getString("name"),
rs.getString("size")
};
 String[] key = {
"id",
"name",
"size",
};
js.add(new pushData(key, value));
}
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);
%>
