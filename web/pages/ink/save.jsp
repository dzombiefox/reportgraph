<%@page import="java.text.DecimalFormat"%>
<%@page import="formula.inkDetail"%>
<%@page import="formula.ink"%>
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
ink in=new ink();
inkDetail idet=new inkDetail();
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String tanggal=dateFormat.format(date);

int detailId=in.getDetailId();
String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
String name=jsonObj.get("name").toString();
int periode=Integer.parseInt(jsonObj.get("periode").toString());
int size=Integer.parseInt(jsonObj.get("size").toString());
int color=Integer.parseInt(jsonObj.get("color").toString());
String rw=jsonObj.get("row").toString();
int row=Integer.parseInt(rw);

in.setDet_id(detailId);
in.setName(name);
in.setSize(size);
in.setDate(tanggal);
in.setColor(color);
in.setPeriode(periode);
in.setStatus("0");
String save="insert into ink(detail_id,name,size_id,date,color_id,status,periode)values('"+in.getDet_id()+"','"+in.getName()+"','"+in.getSize()+"','"+in.getDate()+"','"+in.getColor()+"','"+in.getStatus()+"','"+in.getPeriode()+"')";
c.ManipulasiData(save);

for(int i=0;i<=row;i++){
JSONArray ar= (JSONArray) jsonObj.get("details");
JSONObject fr = (JSONObject) ar.get(i);
        String id=fr.get("id").toString();
        String quer="select * from items where items_id='"+id+"'";
        ResultSet r=c.GetData(quer);
        r.next();
        Double uprecent=r.getDouble("items_uprecent");
        Double volume=Double.parseDouble(fr.get("volume").toString());
        Double price=Double.valueOf(df.format((volume/1000)*uprecent));
String sdetail="insert into inkDetail(detail_id,items_id,priceWet,volume,price,periode)values('"+in.getDet_id()+"','"+id+"','"+uprecent+"','"+volume+"','"+price+"','"+periode+"')";
c.ManipulasiData(sdetail);
}
%> 