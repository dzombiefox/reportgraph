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
n++;
String no=Integer.toString(n);
Float  cqtyre=rs.getFloat("qty_received");
Float  cm2=rs.getFloat("m2");
Float  cpm2=rs.getFloat("purch_m2");
Float  cpbox=rs.getFloat("purch_box");
Float  cpc=rs.getFloat("purch_cost");
Float  cim=rs.getFloat("import");
Float  cof=rs.getFloat("ofreight");
Float  ccfee=rs.getFloat("control_fee");
Float  cver=rs.getFloat("verification");
Float  ctr=rs.getFloat("trucking");
Float  ccus=rs.getFloat("custom_fee");
Float  cli=rs.getFloat("loan_interest");
Float  coe=rs.getFloat("other_exp");
Float  ckci=rs.getFloat("kci_depo");
Float  cscost=rs.getFloat("sales_cost");
Float  ctotal=ckci+cscost+cpbox;
NumberFormat nf = NumberFormat.getInstance();
String mqtyre =nf.format(cqtyre);
String mm2 =nf.format(cm2);
String mpm2 =nf.format(cpm2);
String mpbox =nf.format(cpbox);
String mpc =nf.format(cpc);
String mim =nf.format(cim);
String mof =nf.format(cof);
String mcfee =nf.format(ccfee);
String mver =nf.format(cver);
String mtr =nf.format(ctr);
String mcus =nf.format(ccus);
String mli =nf.format(cli);
String moe =nf.format(coe);
String mkci =nf.format(ckci);
String mscost =nf.format(cscost);
String mtotal =nf.format(ctotal);
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
mtotal
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
