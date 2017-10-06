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
        int ro=Integer.parseInt(jsonObj.get("ro").toString());
        Double water=Double.parseDouble(jsonObj.get("water").toString());
        int periode=Integer.parseInt(jsonObj.get("periode").toString());
        Double waterPrice=e.getPriceWater(ro);
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
        
        Double upPrice=e.getPriceWater(ro);
        Double totalPrice=(water/100)*upPrice;
String adRo="insert into engobeDetail(detail_id,items_id,volume,priceWet,price,periode,category)values('"+detailId+"','"+ro+"','"+water+"','"+upPrice+"','"+totalPrice+"','"+periode+"','1')";
        c.ManipulasiData(adRo);
for(int i=0;i<=row;i++){
        JSONArray ar= (JSONArray) jsonObj.get("details");
        JSONObject fr = (JSONObject) ar.get(i);
        String id=fr.get("id").toString();
        Double volume=Double.parseDouble(fr.get("volume").toString());
        String quer="select * from items where items_id='"+id+"'";
        ResultSet r=c.GetData(quer);
        r.next();
        Double uprecent=r.getDouble("items_uprecent");
        Double price=Double.valueOf(df.format((volume/100)*uprecent));
        String sdetail="insert into engobeDetail(detail_id,items_id,priceWet,volume,price,periode,category)values('"+detailId+"','"+id+"','"+uprecent+"','"+volume+"','"+price+"','"+e.getPeriode()+"','0')";
        c.ManipulasiData(sdetail);
}
%> 