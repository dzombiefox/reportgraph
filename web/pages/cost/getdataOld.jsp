<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%    
connect c =new connect();
 String jsonString = request.getParameter("data");        
        JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
        String id=jsonObj.get("id").toString();
String query="select  * from reportOld r join priceOld p on r.item_code=p.item_code where r.report_id='"+id+"'" ;
ResultSet rs=c.GetData(query);

JSONArray js = new JSONArray();
rs.next();
 String[] value = {
rs.getString("hpp_kw1"),
rs.getString("sell_kw1"),
rs.getString("hpp_kw2"),
rs.getString("sell_kw2"),
rs.getString("hpp_kw3"),
rs.getString("sell_kw3"),
rs.getString("hpp_kw4"),
rs.getString("sell_kw4"),
rs.getString("hpp_kw5"),
rs.getString("sell_kw5")
};
 String[] key = {
"hpp1",
"sell1",
"hpp2",
"sell2",
"hpp3",
"sell3",
"hpp4",
"sell4",
"hpp5",
"sell5",

}; 
 js.add(new pushData(key, value));
 
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
String replace1=jsons.replace("[", "");
String replace2=replace1.replace("]", "");
out.print(replace2);
  
%>

