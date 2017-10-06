<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<style>
    .datagrid table {
        border-collapse: collapse; 
        text-align: left; width: 100%; 
    } 
    .datagrid {
        font: normal 12px/150% Arial, Helvetica, sans-serif;
        background: #fff;
        overflow: hidden;
        //border: 1px solid #006699;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px; 
    }
    .datagrid table td, 
    .datagrid table th {
        padding: 3px 10px;
    }
    .datagrid table thead th {
        background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );
        background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');
        background-color:#006699; 
        color:#FFFFFF;
        font-size: 7px; font-weight: bold;
        border-left: 1px solid #0070A8; }
    .datagrid table thead th:first-child { border: none; 
    }
    .datagrid table tbody td { color: #00557F;
                              font-size: 7px;font-weight: normal; }.datagrid table tbody .alt td { background: #E1EEf4; color: #00557F; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }
</style> 
<div class="datagrid">  
    <table  id="example" class="tg condensed border bordered dataTable" style="width: 90%" align="center">
<thead>
    <tr>
      
      <th rowspan="2" align="center">Motif</th>
      <th height="27" colspan="2">Total Purchase </th>
      <th colspan="2">Purchase Cost</th>
      <th rowspan="2">Purch Cost</th>
      <th rowspan="2">Import Exp</th>
      <th colspan="7" align="center" >Detail Import</th>
      <th colspan="2" align="center" >Other cost</th>
      <th rowspan="2">Total Cost</th>
      <th colspan="3" >Selling Price</th>
      <th colspan="2" >Suggested Price</th>
      </tr>
    <tr>
        <th>Box</th>
        <th>M2</th>
        <th>PerM2</th>
        <th>PerBox</th>
        <th>Ocean Freight</th>
        <th>Ctrl fee</th>
        <th>Verify</th>
        <th>Trucking</th>
        <th>Custom fee</th>
        <th>Loan Interest</th>
        <th>Oth exp</th>
        <th>KCI Depo</th>
        <th>Sales/box</th>
        <th>Depo/Box</th>
        <th>Net /Box</th>
        <th>Net Profit Ratio/Box</th>
        <th>20%</th>
        <th>25%</th>
        
    </tr>
</thead>
<!--<tfoot><tr><td colspan="4"><div id="paging"><ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul></div></tr></tfoot>-->
<tbody>
<%
    int n=0;
connect c=new connect();
String x=request.getParameter("tanggal1");
String y=request.getParameter("tanggal2");
String query="select * from detail join purchase on detail.no_po=purchase.no_po join motif on purchase.motif_id=motif.motif_id where purchase.tanggal between '"+x+"' and '"+y+"'";
ResultSet rs=c.GetData(query);
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
String color;
if(n%2==0){
    color="#E1EEF4";
}
else{
    color="";
}
%>
<tr bgcolor="<%=color%>">

<td><% out.print(rs.getString("motif_name"));%></td>
<td><%=mqtyre%></td>
<td><%=mm2%></td>
<td><%=mpm2%></td>
<td><%=mpbox%></td>
<td><%=mpc%></td>
<td><%=mim%></td>
<td><%=mof%></td>
<td><%=mcfee%></td>
<td><%=mver%></td>
<td><%=mtr%></td>
<td><%=mcus%></td>
<td><%=mli%></td>
<td><%=moe%></td>
<td><%=mkci%></td>
<td><%=mscost%></td>
<td><%=mtotal%></td>
<td><%=mcell%></td>
<td><%=mnet%></td>
<td><%=mnetRatio+"%"%></td>
<td><%=m20%></td>
<td><%=m25%></td>
       </tr>
<% } %>
    
</tbody>





</table>
</div>
