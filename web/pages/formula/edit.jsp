<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%    
String id=request.getParameter("id");
connect c =new connect();
String query="select  a.*,b.size,c.name from formula a join size b on a.size_id=b.size_id join data c on a.data_id=c.data_id where a.formula_id='"+id+"'";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
String jsons=null;
rs.next();
String[] value = {rs.getString("formula_id"),rs.getString("data_id"),rs.getString("size_id"),rs.getString("value"),rs.getString("status"),rs.getString("size"),rs.getString("name")};
String[] key={"id","data_id","size_id","value","status","size","name"};
js.add(new pushData(key, value));
StringWriter hasil = new StringWriter();        
            js.writeJSONString(hasil);
            jsons= hasil.toString();
            out.print(jsons.substring(1, jsons.length()-1));
%>
