<%@page import="formula.alumina"%>
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
alumina a=new alumina();    
DecimalFormat df = new DecimalFormat(".##");
connect c=new connect();
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String tanggal=dateFormat.format(date);
int detailId=a.getDetailId();
String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
int row=Integer.parseInt(jsonObj.get("row").toString());
String weight=jsonObj.get("weight").toString();
    a.setName(jsonObj.get("name").toString());
    a.setSize(Integer.parseInt(jsonObj.get("size").toString()));
    a.setDate(tanggal);
    a.setWeight(Double.parseDouble(jsonObj.get("weight").toString()));
    a.setPeriode(Integer.parseInt(jsonObj.get("periode").toString()));
        
        String save="insert into alumina(detail_id,name,size_id,date,weight,status,periode)values('"+detailId+"','"+a.getName()+"','"+a.getSize()+"','"+a.getDate()+"','"+weight+"','0','"+a.getPeriode()+"')";
        c.ManipulasiData(save);
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
                        String sdetail="insert into aluminaDetail(detail_id,items_id,priceWet,volume,price,periode)values('"+detailId+"','"+id+"','"+uprecent+"','"+volume+"','"+price+"','"+a.getPeriode()+"')";
                        c.ManipulasiData(sdetail);
            }
%>