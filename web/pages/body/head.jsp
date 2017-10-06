<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("cari");
String query="select * from body join periode on body.body_periode=periode.id join weight on body.id_weight=weight.id_weight where body.detail_id='"+id+"'";
ResultSet rs=c.GetData(query);
JSONArray js= new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
    String[] value = {
rs.getString("body_id"),
rs.getString("detail_id"),
rs.getString("body_name"),
rs.getString("body_amountPrice"),
rs.getString("body_amountValue"),
rs.getString("body_average"),
rs.getString("body_weightPcs"),
rs.getString("body_weightDry"),
rs.getString("body_costDry"),
rs.getString("size_items"),
rs.getString("periode")
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
