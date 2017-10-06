<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("cari");
String query="select  alumina.*,weight.size_items,periode.periode as per from alumina join weight on alumina.id_weight=weight.id_weight join  periode on alumina.periode=periode.id where alumina.alumina_id='"+id+"'";
ResultSet rs=c.GetData(query);
JSONArray js= new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
    String[] value = {
rs.getString("alumina_id"),
rs.getString("detail_id"),
rs.getString("alumina_name"),
rs.getString("alumina_amountPrice"),
rs.getString("alumina_amountValue"),
rs.getString("alumina_average"),
rs.getString("alumina_weight"),
rs.getString("alumina_weightDry"),
rs.getString("alumina_costDry"),
rs.getString("size_items"),
rs.getString("per")
};
    String[] key = {
"id",
"detailId",
"name",
"amountPrice",
"amountValue",
"average",
"weightPcs",
"weightDry",
"costDry",
"size",
"periode"
};
 js.add(new pushData(key, value));
}
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();

out.print(jsons);

%>
