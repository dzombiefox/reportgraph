<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
    int n=0;
connect c =new connect();
String query="select * from persen left join type on persen.type_id=type.type_id left join size on persen.size_id=size.size_id join line on persen.line_id=line.line_id";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
n++;
String no=Integer.toString(n);
String[] value = {
no,
rs.getString("persen_id"),
rs.getString("line_name"),
rs.getString("name"),
rs.getString("size"),
rs.getString("sch"),
rs.getString("pkw1"),
rs.getString("pkw2"),
rs.getString("pkw3"),
rs.getString("pkw4"),
rs.getString("pkw5"),
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>

