<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
    int n=0;
connect c =new connect();
String query="select a.code,a.rmotif_id,a.name as a,a.opt,b.name as b,b.density,c.name as c from rmotif a join type b on a.type_id=b.type_id join brand c on a.brand_id=c.brand_id";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
n++;
String no=Integer.toString(n);
String[] value = {
no,
rs.getString("rmotif_id"),
rs.getString("code"),
rs.getString("a"),
rs.getString("b")+" "+rs.getString("density") ,
rs.getString("c"),
rs.getString("opt"),
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
