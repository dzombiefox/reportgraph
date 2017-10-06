<%@page import="formula.glaze"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="config.connect"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%    
DecimalFormat df = new DecimalFormat(".##");
connect c=new connect();
glaze g=new glaze();
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String tanggal=dateFormat.format(date);
int detailId=g.getDetailId();
String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
g.setName(jsonObj.get("name").toString());
g.setColor(Integer.parseInt(jsonObj.get("color").toString()));
g.setWeight(Double.parseDouble(jsonObj.get("weight").toString()));
g.setPeriode(Integer.parseInt(jsonObj.get("periode").toString()));
g.setSize(Integer.parseInt(jsonObj.get("size").toString()));
int row=Integer.parseInt(jsonObj.get("row").toString());

String save="insert into glaze(detail_id,name,color_id,size_id,weight,date,status,periode)values"
        + "('"+detailId+"','"+g.getName()+"','"+g.getColor()+"','"+g.getSize()+"','"+g.getWeight()+"','"+tanggal+"','0','"+g.getPeriode()+"')";
c.ManipulasiData(save);
for(int i=0;i<=row;i++){
JSONArray ar= (JSONArray) jsonObj.get("details");
JSONObject fr = (JSONObject) ar.get(i);
String id=fr.get("id").toString();
String wet=fr.get("wet").toString();
String volume=fr.get("volume").toString();
String harga=fr.get("harga").toString();
String sdetail="insert into glazeDetail(detail_id,items_id,priceWet,volume,price,periode)values('"+detailId+"','"+id+"','"+wet+"','"+volume+"','"+harga+"','"+g.getPeriode()+"')";
c.ManipulasiData(sdetail);
}
%> 