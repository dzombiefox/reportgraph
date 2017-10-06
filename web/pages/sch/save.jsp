<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String jsonString = request.getParameter("data");        
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
String date=jsonObj.get("date").toString();     
String price=jsonObj.get("price").toString();
String kw1=jsonObj.get("kw1").toString();
String kw2=jsonObj.get("kw2").toString();
String kw3=jsonObj.get("kw3").toString();
String kw4=jsonObj.get("kw4").toString();
String kw5=jsonObj.get("kw5").toString();
String kw6=jsonObj.get("kw6").toString();
String query="insert into sch(date,price_id,kw1,kw2,kw3,kw4,kw5,kw6)values('"+date+"','"+price+"','"+kw1+"','"+kw2+"','"+kw3+"','"+kw4+"','"+kw5+"','"+kw6+"')";
c.ManipulasiData(query);
%>
