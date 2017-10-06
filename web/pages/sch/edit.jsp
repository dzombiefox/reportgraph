<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();   
JSONArray userArray = new JSONArray();      
String jsons=null;
String id=request.getParameter("id");
String query="select * from sch join prices on sch.price_id=prices.prices_id join persen on prices.persen_id=persen.persen_id join line on persen.line_id=line.line_id where sch_id='"+id+"'";
ResultSet rs=c.GetData(query);
rs.next();
String date=rs.getString("date");
date=date.replace("-", ".");
 String[] value = { date,rs.getString("item_code"),rs.getString("kw1"),rs.getString("kw2"),rs.getString("kw3"),rs.getString("kw4"),rs.getString("kw5"),rs.getString("kw6"),rs.getString("periode"),rs.getString("year"),rs.getString("line_name"),rs.getString("prices_id")};
 String[] key={"date","code","kw1","kw2","kw3","kw4","kw5","kw6","periode","year","line","id"};
 userArray.add(new pushData(key, value));
 StringWriter hasil = new StringWriter();        
            userArray.writeJSONString(hasil);
            jsons = hasil.toString();
            out.print(jsons.substring(1, jsons.length()-1));
%>
