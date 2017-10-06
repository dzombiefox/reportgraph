<%@page import="java.text.DecimalFormat"%>
<%@page import="formula.body"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="config.connect"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%    
body b=new body();    
connect c=new connect();
DecimalFormat df=new DecimalFormat(".##");
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String tanggal=dateFormat.format(date);
String exTahun=tanggal.substring(2,4 );
String exBulan=tanggal.substring(5,7 );
String jsonString = request.getParameter("data");
        JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
        String name=jsonObj.get("name").toString();
        String body=jsonObj.get("body").toString();
        int ro=Integer.parseInt(jsonObj.get("ro").toString());
        Double water=Double.parseDouble(jsonObj.get("water").toString());
        String weight=jsonObj.get("weight").toString();
        String periode=jsonObj.get("periode").toString();
        int row=Integer.parseInt(jsonObj.get("row").toString());
        int detailId=b.getDetailId();
        Double waterPrice=b.getPriceWater(ro);
        String size=jsonObj.get("size").toString();
        String query="insert into body(detail_id,name,choose,date,weightPcs,size_id,status,periode)"
                + "values('"+detailId+"','"+name+"','"+body+"','"+tanggal+"','"+weight+"','"+size+"','0','"+periode+"')";
        c.ManipulasiData(query);
        Double upPrice=b.getPriceWater(ro);
        Double totalPrice=(water/100)*upPrice;
        String adRo="insert into bodyDetail(detail_id,items_id,priceWet,price,volume,periode,category)values('"+detailId+"','"+ro+"','"+upPrice+"','"+waterPrice+"','"+water+"','"+periode+"','1')";
        c.ManipulasiData(adRo);

        for(int i=0;i<=row;i++){
                JSONArray ar= (JSONArray) jsonObj.get("details");
                JSONObject fr = (JSONObject) ar.get(i);
                String id=fr.get("id").toString();
                Double volume=Double.parseDouble(fr.get("volume").toString());
                String quer="select * from items where items_id='"+id+"'";
                ResultSet r=c.GetData(quer);
                r.next();
                int percent=100;
                Double vol=r.getDouble("items_volume");
                Double uprecent=r.getDouble("items_uprecent");
                Double priceDry =Double.valueOf(df.format(uprecent/((percent-vol)/percent)));
                Double totalPrices=Double.valueOf(df.format(priceDry*volume/100));
                String qu="insert into bodyDetail(detail_id,items_id,maxVolume,priceWet,priceDry,volume,price,periode,category)values('"+detailId+"','"+id+"','"+vol+"','"+uprecent+"','"+priceDry+"','"+volume+"','"+totalPrices+"','"+periode+"','0')";
                c.ManipulasiData(qu);
        }

%>
