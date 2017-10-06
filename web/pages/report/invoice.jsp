<%@page import="java.text.NumberFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<style type="text/css">
.notes { 
      padding: 3px 10px;
      border-collapse: collapse;
   font-size: 10px;font-weight: normal;}  
.datagrid table { 
    border-collapse: collapse;
    text-align: left; width: 100%; } 
.datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; 
          background: #fff; overflow: hidden; -webkit-border-radius: 3px;
          -moz-border-radius: 3px; 
          border-radius: 3px;}
.datagrid table td, 
.datagrid table th { padding: 3px 10px; }
.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );
background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );
filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');
background-color:#006699; color:#FFFFFF; font-size: 10px; font-weight: bold; border-left: 1px solid #0070A8; 
} 
.datagrid table thead th:first-child { border: none; }
.datagrid table tbody td { color: #00557F; border-left: 1px solid #E1EEF4;
font-size: 10px;font-weight: normal;
}.datagrid table tbody .alt td { background: #E1EEF4; color: #00557F; }
.datagrid table tbody td:first-child { border-left: none; }
.datagrid table tbody tr:last-child td { border-bottom: none; }
 </style>
<div align="center">
<br><br>
<div class="datagrid">
<table  id="example" class="tg  " style="width: 90%" align="center" border="1">
<thead>
    <tr>
      <th rowspan="2" align="center">NO PERFORMA INVOICE</th>
      <th colspan="6" align="center"><% 
          connect c=new connect();
          String kode=request.getParameter("kode");
       String header="select * from purchase join motif on purchase.motif_id=motif.motif_id where no_po='"+kode+"'";
   ResultSet he=c.GetData(header);
   he.next();      
out.print(he.getString("no_po"));%></th>
      </tr>
      <tr>
        <th>USD</th>
        <th>IDR</th>
        <th>RATE USD</th>
        <th>EQR IDR</th>
        <th>ESTIMATION</th>       
      </tr>
</thead>
<tbody>
   <%
   int no=0;   
   String query="select* from DETAIL_PURCHASE JOIN CATEGORY ON CATEGORY.CATEGORY_ID=DETAIL_PURCHASE.CATEGORY_ID where no_po='"+kode+"' ORDER BY CATEGORY.CATEGORY_ID ASC ";
   ResultSet rs=c.GetData(query);
   while(rs.next()){
   no++;
   String color;
if(no%2==0){
    color="#E1EEF4";
}
else{
    color="";
}
  int decimalPlace = 0; 
 Double  cusd=rs.getDouble("usd");
 BigDecimal busd = new BigDecimal(cusd);
 busd=busd.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cusd=busd.doubleValue(); 
 Double  crusd=rs.getDouble("rate_usd");
 BigDecimal brusd = new BigDecimal(crusd);
 brusd=brusd.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 crusd=brusd.doubleValue(); 
 Double  cidr=rs.getDouble("idr");
 BigDecimal bidr = new BigDecimal(cidr);
 bidr=bidr.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cidr=bidr.doubleValue(); 
 Double  ceidr=rs.getDouble("eqr_idr");
 BigDecimal beidr = new BigDecimal(ceidr);
 beidr=beidr.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ceidr=beidr.doubleValue(); 
 
 Double  cest=rs.getDouble("estimation");
 BigDecimal best = new BigDecimal(cest);
 best=best.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cest=best.doubleValue(); 
 NumberFormat nf = NumberFormat.getInstance();
 String musd =nf.format(cusd);
 String mrusd =nf.format(crusd);
 String midr =nf.format(cidr);
 String mest =nf.format(cest);
 String meidr =nf.format(ceidr);
%>
<tr>
<td><% out.print(rs.getString("category_name"));%></td>
<td align="right"><%=musd%></td>
<td align="right"><%=midr%></td>
<td align="right"><%=mrusd%></td>
<td align="right"><%=meidr%></td>
<td align="right"><%=mest%></td>
</tr>
   <%}%>
   <tr bgcolor="red">
       <th colspan="7"><font style="color: white;font-size: 12px"><strong>Detail Received</strong></font></th>
   </tr>
<% String detail="select* from total JOIN CATEGORY ON CATEGORY.CATEGORY_ID=total.CATEGORY_ID where no_po='"+kode+"' ORDER BY CATEGORY.CATEGORY_ID ASC ";
   ResultSet rsl=c.GetData(detail);
   while(rsl.next()){
 int decimalPlace = 0; 
 Double  cusd=rsl.getDouble("tusd");
 BigDecimal busd = new BigDecimal(cusd);
 busd=busd.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cusd=busd.doubleValue();
 Double  ctidr=rsl.getDouble("tidr");
 BigDecimal btidr = new BigDecimal(ctidr);
 btidr=btidr.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ctidr=btidr.doubleValue(); 
 Double  ctrusd=rsl.getDouble("trusd");
 BigDecimal btrusd = new BigDecimal(ctrusd);
 btrusd=btrusd.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ctrusd=btrusd.doubleValue(); 
 Double  cteidr=rsl.getDouble("teidr");
 BigDecimal bteidr = new BigDecimal(cteidr);
 bteidr=bteidr.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cteidr=bteidr.doubleValue(); 
 Double  cest=rsl.getDouble("testimation");
 BigDecimal best = new BigDecimal(cest);
 best=best.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cest=best.doubleValue(); 
 NumberFormat nf = NumberFormat.getInstance();
 String musd =nf.format(cusd);
 String mtidr =nf.format(ctidr);  
 String mtrusd =nf.format(ctrusd); 
 String mteidr =nf.format(cteidr); 
 String mest =nf.format(cest); 
%>   
<tr>
   <td><% out.print(rsl.getString("category_name"));%></td>
   <td align="right"><%=musd%></td>
   <td align="right"><%=mtidr%></td>
   <td align="right"><%=mtrusd%></td>
   <td align="right"><%=mteidr%></td>
   <td align="right"><%=mest%></td>
 </tr>
   <%}%>
<tr style="background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );
filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');
background-color:#006699; color:#FFFFFF; font-size: 10px; font-weight: bold; border-left: 1px solid #0070A8; ">
    <th rowspan="2">ITEM NAME</th>
    <th colspan="2">QTY RECEIVED</th>
    <th>PURCHASE UNIT PRICE</th>
    <th rowspan="2">KURS</th>
    <th rowspan="2">NOTES</th>
  </tr>
<tr style="background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );
filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');
background-color:#006699; color:#FFFFFF; font-size: 10px; font-weight: bold; border-left: 1px solid #0070A8; ">
    <th>BOX</th>
    <th>M2</th>
    <th>USD</th>
    </tr>
  <tr bgcolor="white">
    <td><% out.print(he.getString("motif_name"));%></td>
    <td><% 
 int decimalPlace = 0; 
 Double  cqty=he.getDouble("qty_received");
 BigDecimal bqty = new BigDecimal(cqty);
 bqty=bqty.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cqty=bqty.doubleValue();    
 NumberFormat nf = NumberFormat.getInstance();
 String mcqty =nf.format(cqty);
 out.print(mcqty);    
 Double  cm2=he.getDouble("m2");
 BigDecimal bm2 = new BigDecimal(cm2);
 bm2=bm2.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 cm2=bm2.doubleValue();  
 Double  cusd=he.getDouble("usd");
 Double  ckurs=he.getDouble("kurs");
 BigDecimal bkurs= new BigDecimal(ckurs);
 bkurs=bkurs.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ckurs=bkurs.doubleValue(); 
 String mm2 =nf.format(cm2);
 String mkurs =nf.format(ckurs);
 Double fusd=he.getDouble("usd");
 Double ctotIdr=fusd*1.44*ckurs; 
 Double cexpIdr=he.getDouble("m2")-he.getDouble("usd");
 BigDecimal bexpIdr= new BigDecimal(cexpIdr);
 bexpIdr=bexpIdr.setScale(decimalPlace,BigDecimal.ROUND_UP);
 cexpIdr=bexpIdr.doubleValue(); 
 Double cpIdr=ctotIdr+cexpIdr;
 BigDecimal bpIdr= new BigDecimal(cpIdr);
 bpIdr=bpIdr.setScale(decimalPlace,BigDecimal.ROUND_UP);
 cpIdr=bpIdr.doubleValue(); 
 BigDecimal btotIdr= new BigDecimal(ctotIdr);
 btotIdr=btotIdr.setScale(decimalPlace,BigDecimal.ROUND_UP); 
 ctotIdr=btotIdr.doubleValue();
 String mtotIdr =nf.format(ctotIdr);
 String mexpIdr =nf.format(cexpIdr);
 String mpIdr =nf.format(cpIdr);
    %></td>
   <td><%=mm2%></td>
   <td><%=fusd%></td>
   <td><%=mkurs%></td>
   <td>-</td>
  </tr>
</tbody>
</table>
</div>
    <br />
</div><table width="50%" align="right" class=notes>
  <tr>
    <td>NOTE :</td>
    <td>&nbsp;</td>
    <td>1 BOX=1.44 M2</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>UNIT PRICE IDR(BOX)</td>
    <td><%=mtotIdr%></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>TOTAL EXP IDR(BOX)</td>
    <td><%=mexpIdr%></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>GROSS PRICE IDR(BOX)</td>
    <td><%=mpIdr%></td>
  </tr>
</table>