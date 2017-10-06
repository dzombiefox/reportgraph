<%@page import="formula.engobe"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="config.koma"%>
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
koma k=new koma();
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String tanggal=dateFormat.format(date);
engobe e=new engobe();
int detailId=e.getDetailId();
String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
e.setName(jsonObj.get("name").toString());
e.setColor(Integer.parseInt(jsonObj.get("color").toString()));
e.setSize(Integer.parseInt(jsonObj.get("size").toString()));
e.setDate(tanggal);
e.setWeight(Double.parseDouble(jsonObj.get("weight").toString()));
e.setPeriode(Integer.parseInt(jsonObj.get("periode").toString()));
int row=Integer.parseInt(jsonObj.get("row").toString());

String save="insert into engobe(detail_id,name,color_id,size_id,date,weight,status,periode)values"
        + "('"+detailId+"','"+e.getName()+"','"+e.getColor()+"','"+e.getSize()+"','"+tanggal+"','"+e.getWeight()+"','0','"+e.getPeriode()+"')";
c.ManipulasiData(save);
for(int i=0;i<=row;i++){
JSONArray ar= (JSONArray) jsonObj.get("details");
JSONObject fr = (JSONObject) ar.get(i);
String id=fr.get("id").toString();
String wet=fr.get("wet").toString();
String volume=fr.get("volume").toString();
String harga=fr.get("harga").toString();
String sdetail="insert into engobeDetail(detail_id,items_id,priceWet,volume,price,periode)values('"+detailId+"','"+id+"','"+wet+"','"+volume+"','"+harga+"','"+e.getPeriode()+"')";
c.ManipulasiData(sdetail);
}
%> 