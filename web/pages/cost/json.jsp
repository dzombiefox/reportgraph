<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    int n=0;
connect c=new connect();
String query="select * from cost join kw on cost.kw_id=kw.kw_id ";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){

n++;
String no=Integer.toString(n);
String[] value = {
    no,
    rs.getString("item_code"),
    rs.getString("kw_name"),
    rs.getString("hpp"),
    rs.getString("sell"),
    rs.getString("profit")
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
