<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<%    
    int n=0;
connect c =new connect();
String query="select  a.*,b.size,c.name from formula a join size b on a.size_id=b.size_id join data c on a.data_id=c.data_id";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
n++;
String no=Integer.toString(n);
String[] value = {
no,
rs.getString("formula_id"),
rs.getString("name"),
rs.getString("size"),
rs.getString("value"),
rs.getString("status")
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
