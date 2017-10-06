<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%    
String id=request.getParameter("id");
connect c =new connect();
String query="select a.*,b.name as type,b.density,c.name as brand from rmotif a join type b on a.type_id=b.type_id join brand c on a.brand_id=c.brand_id where rmotif_id='"+id+"'";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
String jsons=null;
rs.next();
String[] value = {rs.getString("rmotif_id"),rs.getString("type_id"),rs.getString("brand_id"),rs.getString("opt"),rs.getString("type"),rs.getString("density"),rs.getString("brand"),rs.getString("name"),rs.getString("code")};
String[] key={"id","type_id","brand_id","opt","type","density","brand","name","code"};
js.add(new pushData(key, value));
StringWriter hasil = new StringWriter();        
            js.writeJSONString(hasil);
            jsons= hasil.toString();
            out.print(jsons.substring(1, jsons.length()-1));
%>
