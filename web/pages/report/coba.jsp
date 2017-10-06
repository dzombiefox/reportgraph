<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    int n=0;
connect c=new connect();
String query="select * from detail join purchase on detail.no_po=purchase.no_po join motif on purchase.motif_id=motif.motif_id ";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
int decimalPlace = 0; 
n++;
String no=Integer.toString(n);
Double cqtyre=rs.getDouble("qty_received");

 BigDecimal bqty = new BigDecimal(cqtyre);  
 bqty= bqty.setScale(decimalPlace,BigDecimal.ROUND_UP);  
 cqtyre = bqty.doubleValue();  
 
 Double  cm2=rs.getDouble("m2");
 BigDecimal bm2 = new BigDecimal(cm2);
 bm2= bm2.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cm2=bm2.doubleValue();
 
 Double  cpm2=rs.getDouble("purch_m2");
 BigDecimal bpm2 = new BigDecimal(cpm2);
 bpm2=bpm2.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cpm2=bpm2.doubleValue();
 
 Double  cpur=rs.getDouble("purch_box");
 BigDecimal bpur = new BigDecimal(cpur);
 bpur=bpur.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cpur=bpur.doubleValue();
 
 Double  cpcost=rs.getDouble("purch_cost");
 BigDecimal bpcost = new BigDecimal(cpcost);
 bpcost=bpcost.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cpcost=bpcost.doubleValue();

 Double  cimp=rs.getDouble("import");
 BigDecimal bimp = new BigDecimal(cimp);
 bimp=bimp.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cimp=bimp.doubleValue();
 
 Double  cofr=rs.getDouble("ofreight");
 BigDecimal bofr = new BigDecimal(cofr);
 bofr=bofr.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cofr=bofr.doubleValue();

 Double  ccfee=rs.getDouble("control_fee");
 BigDecimal bcfee = new BigDecimal(ccfee);
 bcfee=bcfee.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ccfee=bcfee.doubleValue();

 Double  cver=rs.getDouble("verification");
 BigDecimal bver = new BigDecimal(cver);
 bver=bver.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cver=bver.doubleValue();

 Double  ctr=rs.getDouble("trucking");
 BigDecimal bctr = new BigDecimal(ctr);
 bctr=bctr.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ctr=bctr.doubleValue();

 Double  ccus=rs.getDouble("custom_fee");
 BigDecimal bccus = new BigDecimal(ccus);
 bccus=bccus.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ccus=bccus.doubleValue(); 

 Double  cli=rs.getDouble("loan_interest");
 BigDecimal bcli= new BigDecimal(cli);
 bcli=bcli.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cli=bcli.doubleValue();
 
 Double  coe=rs.getDouble("other_exp");
 BigDecimal bcoe= new BigDecimal(coe);
 bcoe=bcoe.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 coe=bcoe.doubleValue();

 Double  ckci=rs.getDouble("kci_depo");
 BigDecimal bckci= new BigDecimal(ckci);
 bckci=bckci.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ckci=bckci.doubleValue();

 Double  cscost=rs.getDouble("sales_cost");
 BigDecimal bcscost= new BigDecimal(cscost);
 bcscost=bcscost.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cscost=bcscost.doubleValue();

 Double  ccell=rs.getDouble("sell_box");
 BigDecimal bcell= new BigDecimal(ccell);
 bcell=bcell.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ccell=bcell.doubleValue();
 Double  ctotal=ckci+cscost+ cpur;
 Double cnet;
 Double cnetRatio=0.0;
 if(ccell<1){
 cnet=0.0;    
 cnetRatio=0.0;
 }
 else{
     cnet=ccell-ctotal;
     cnetRatio=(cnet/ccell)*100;
     
 }
 



 DecimalFormat df = new DecimalFormat(".##");
 cnetRatio=Double.valueOf(df.format(cnetRatio));

Double p20=ccell/0.8;
BigDecimal b20= new BigDecimal(p20);
b20=b20.setScale(decimalPlace,BigDecimal.ROUND_UP); 
p20=b20.doubleValue();

Double p25=ccell/0.75;
BigDecimal b25= new BigDecimal(p25);
b25=b25.setScale(decimalPlace,BigDecimal.ROUND_UP); 
p25=b25.doubleValue();

NumberFormat nf = NumberFormat.getInstance();
String mqtyre =nf.format(cqtyre);
String mm2 =nf.format(cm2);
String mpm2 =nf.format(cpm2);
String mpbox =nf.format(cpur);
String mpc =nf.format(cpcost);
String mim =nf.format(cimp);
String mof =nf.format(cofr);
String mcfee =nf.format(ccfee);
String mver =nf.format(cver);
String mtr =nf.format(ctr);
String mcus =nf.format(ccus);
String mli =nf.format(cli);
String moe =nf.format(coe);
String mkci =nf.format(ckci);
String mscost =nf.format(cscost);
String mtotal =nf.format(ctotal);
String mcell =nf.format(ccell);
String mnet =nf.format(cnet);
String mnetRatio=nf.format(cnetRatio);
String m20=nf.format(p20);
String m25=nf.format(p25);
String[] value = {
no,
rs.getString("no_po"),
rs.getString("motif_name"),
mqtyre,
mm2,
mpm2,
mpbox,
mpc,
mim,
mof,
mcfee,
mver,
mtr,
mcus,
mli,
moe,
mkci,
mscost,
mtotal,
mcell,
mnet,
mnetRatio+"%",
m20,
m25
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
