<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("cari");
String query="select g.*,w.size_items,p.periode as per,m.motif_name,c.color_name from glaze g join weight w on g.id_weight=w.id_weight join periode p on g.periode=p.id join motif m on g.motif_id=m.motif_id join color c on g.color_id=c.color_id where g.detail_id='"+id+"'";
ResultSet rs=c.GetData(query);
JSONArray js= new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
    String[] value = {
rs.getString("glaze_id"),
rs.getString("detail_id"),
rs.getString("motif_name"),
rs.getString("color_name"),
rs.getString("glaze_amountPrice"),
rs.getString("glaze_amountVolume"),
rs.getString("glaze_average"),
rs.getString("glaze_weightWet"),
rs.getString("glaze_weightDry"),
rs.getString("glaze_costDry"),
rs.getString("size_items"),
rs.getString("per")
};
    String[] key = {
"id",
"detailId",
"name",
"color",
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
