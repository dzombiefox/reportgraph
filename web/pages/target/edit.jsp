<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%    
String id=request.getParameter("id");
connect c =new connect();
String query="select * from persen left join type on persen.type_id=type.type_id left join size on persen.size_id=size.size_id join line on persen.line_id=line.line_id where persen_id='"+id+"'";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
String jsons=null;
rs.next();
String[] value = {rs.getString("persen_id"),rs.getString("size_id"),rs.getString("line_id"),rs.getString("type_id"),rs.getString("sch"),rs.getString("pkw1"),rs.getString("pkw2"),rs.getString("pkw3"),rs.getString("pkw4"),rs.getString("pkw5"),rs.getString("name"),rs.getString("size"),rs.getString("line_name")};
String[] key={"id","size_id","line_id","type_id","sch","pkw1","pkw2","pkw3","pkw4","pkw5","name","size","line"};
js.add(new pushData(key, value));
StringWriter hasil = new StringWriter();        
            js.writeJSONString(hasil);
            jsons= hasil.toString();
            out.print(jsons.substring(1, jsons.length()-1));
%>
