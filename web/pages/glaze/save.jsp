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
        int ro=Integer.parseInt(jsonObj.get("ro").toString());
        Double water=Double.parseDouble(jsonObj.get("water").toString());
        g.setName(jsonObj.get("name").toString());
        g.setColor(Integer.parseInt(jsonObj.get("color").toString()));
        g.setWeight(Double.parseDouble(jsonObj.get("weight").toString()));
        g.setPeriode(Integer.parseInt(jsonObj.get("periode").toString()));
        g.setSize(Integer.parseInt(jsonObj.get("size").toString()));
        int row=Integer.parseInt(jsonObj.get("row").toString());
String save="insert into glaze(detail_id,name,color_id,size_id,weight,date,status,periode)values"
        + "('"+detailId+"','"+g.getName()+"','"+g.getColor()+"','"+g.getSize()+"','"+g.getWeight()+"','"+tanggal+"','0','"+g.getPeriode()+"')";
        c.ManipulasiData(save);
        
        Double upPrice=g.getPriceWater(ro);
        Double totalPrice=(water/100)*upPrice;
String adRo="insert into glazeDetail(detail_id,items_id,volume,priceWet,price,periode,category)values('"+detailId+"','"+ro+"','"+water+"','"+upPrice+"','"+totalPrice+"','"+g.getPeriode()+"','1')";
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
        String sdetail="insert into glazeDetail(detail_id,items_id,priceWet,volume,price,periode,category)values('"+detailId+"','"+id+"','"+uprecent+"','"+volume+"','"+price+"','"+g.getPeriode()+"','0')";
        c.ManipulasiData(sdetail);
    }
%> 