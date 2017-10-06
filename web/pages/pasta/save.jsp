<%@page import="java.text.DecimalFormat"%>
<%@page import="formula.pastaDetail"%>
<%@page import="formula.pasta"%>
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
pasta p=new pasta();
pastaDetail pd=new pastaDetail();
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String tanggal=dateFormat.format(date);
    String jsonString = request.getParameter("data");
    JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
    String name=jsonObj.get("name").toString();
    Double weight=Double.parseDouble(jsonObj.get("weight").toString());
    int periode=Integer.parseInt(jsonObj.get("periode").toString());
    int size=Integer.parseInt(jsonObj.get("size").toString());
    String option=jsonObj.get("option").toString();
    int color=Integer.parseInt(jsonObj.get("color").toString());
    int row=Integer.parseInt(jsonObj.get("row").toString());
    int detailId=p.getDetailId();
    p.setDet_id(detailId);
    p.setName(name);
    p.setSize(size);
    p.setDate(tanggal);
    p.setColor(color);
    p.setOpt(option);
    p.setWeight(weight);
    p.setStatus(0);
    p.setPeriode(periode);
    String save="insert into pasta(detail_id, name, size_id,date,color_id,opt,weight,status,periode)values('"+p.getDet_id()+"','"+p.getName()+"','"+p.getSize()+"','"+p.getDate()+"','"+p.getColor()+"','"+p.getOpt()+"','"+p.getWeight()+"','"+p.getStatus()+"','"+p.getPeriode()+"')";
    c.ManipulasiData(save);
        for(int i=0;i<=row;i++){
        JSONArray ar= (JSONArray) jsonObj.get("details");
        JSONObject fr = (JSONObject) ar.get(i);
        int id=Integer.parseInt(fr.get("id").toString());
       // Double wet=Double.parseDouble(fr.get("wet").toString());
        Double volume=Double.parseDouble(fr.get("volume").toString());
        String quer="select * from items where items_id='"+id+"'";
        ResultSet r=c.GetData(quer);
        r.next();
        Double uprecent=r.getDouble("items_uprecent");
        Double price=Double.valueOf(df.format((volume/100)*uprecent));  
        pd.setDet_id(detailId);
        pd.setItems(id);
        pd.setPricewet(uprecent);
        pd.setVolume(volume);
        pd.setPrice(price);
        pd.setPeriode(periode);
        String sdetail="insert into PastaDetail(detail_id, items_id, priceWet,volume,price, periode)values('"+pd.getDet_id()+"','"+pd.getItems()+"','"+pd.getPricewet()+"','"+pd.getVolume()+"','"+pd.getPrice()+"','"+pd.getPeriode()+"')";
        c.ManipulasiData(sdetail);
        }

%> 