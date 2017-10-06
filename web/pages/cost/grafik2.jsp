<%@page import="org.jfree.chart.axis.CategoryAxis"%>
<%@page import="org.jfree.util.ShapeUtilities"%>
<%@page import="org.jfree.chart.labels.StandardCategoryItemLabelGenerator"%>
<%@page import="org.jfree.ui.HorizontalAlignment"%>
<%@page import="org.jfree.chart.axis.NumberTickUnit"%>
<%@page import="org.jfree.chart.axis.NumberAxis"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.awt.BasicStroke"%>
<%@page import="org.jfree.chart.renderer.category.LineAndShapeRenderer"%>
<%@page import="org.jfree.ui.RectangleInsets"%>
<%@page import="org.jfree.ui.RectangleAnchor"%>
<%@page import="org.jfree.chart.annotations.XYTitleAnnotation"%>
<%@page import="org.jfree.chart.block.BlockBorder"%>
<%@page import="java.awt.Font"%>
<%@page import="org.jfree.ui.RectangleEdge"%>
<%@page import="org.jfree.chart.title.LegendTitle"%>
<%@page import="org.jfree.chart.axis.CategoryLabelPositions"%>
<%@page import="org.jfree.chart.axis.ValueAxis"%>
<%@page import="java.awt.Color"%>
<%@page import="config.connect"%>
<%@page contentType="text/html"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="org.jfree.data.category.*" %>
<%@page import="org.jfree.chart.*" %>
<%@page import="org.jfree.chart.plot.*" %>

<html>
<head>
<style>

.vertical-text {
bottom:-110px;
left:207px;
position:absolute;
-moz-transform: rotate(-90deg);

-webkit-transform: rotate(-90deg);
transform: rotate(-90deg);
}

</style>
<style>


.datagrid  .in td{
    border:1px solid #ffffff;

}
.in  td:first-child{
border:1px solid #ffffff;
}
  td:first-child {
border-right :1px solid black; 
//border-top :1px solid black; 
}

td:last-child {
border-left :1px solid black; 
//border-top :1px solid black; 
}

tr:nth-child(2) { border:1px solid black; border-left:1px solid black; }
tr:nth-child(2) td{ border:1px solid black; border-left:1px solid black; }

.datagrid .in{
width:100%;
//border:1px solid black;
}

.datagrid .satu{
width:45%;
 margin-right:10px;
 
}

.motif{
height:5px;
}

.tebal   { 
border:1px solid black;

}
 .datagrid table { 
    border-collapse: collapse;
    text-align: left; width: 100%; 

} 
.datagrid #example{
  border-left: 1px solid black;
  border-right: 1px solid black;
}
.datagrid {
          font: normal 12px/150% Arial, Helvetica, sans-serif; 
          background: #fff; overflow: hidden; -webkit-border-radius: 3px;
          -moz-border-radius: 3px; 
          border-radius: 3px;
}
.datagrid table td, 
.datagrid table th { padding: 0px 0px;

 }
  
.datagrid table tr { 
height:9px;

 }


.datagrid table tbody td {  
//border-left: 1px solid #E1EEF4;
font-size: 8px;font-weight: normal;

}




.datagrid table tfoot ul.active, 
.datagrid table tfoot ul a:hover { text-decoration: none;border-color: #00557F; color: #FFFFFF;
background: none; background-color:#006699;}div.dhtmlx_window_active, 
div.dhx_modal_cover_dv { position: fixed !important; }
</style>

<style>
.rw{
height:12px;
}
          
   
	
	table td {
    width: 220px;
       white-space: nowrap;
}
</style>
</head>
<body>

<div id="mydiv" >





<%
   connect c=new connect();
  String begin=request.getParameter("begin");
  String bulan="";
  String[] date1 = begin.split("-");
  int t=Integer.parseInt(date1[1]);
  int y=Integer.parseInt(date1[0]);
  Double up=Double.parseDouble(request.getParameter("up"));
  Double down=Double.parseDouble(request.getParameter("down"));
  if(t==1){
  bulan="January";
  }
  else if(t==2){
  bulan="February";
  }
  else if(t==3){
  bulan="Maret";
  }
  else if(t==4){
  bulan="April";
  }
  else if(t==5){
  bulan="May";
  }
  else if(t==6){
  bulan="June";
  }
  else if(t==7){
  bulan="July";
  }
  else if(t==8){
  bulan="Agustus";
  }
  else if(t==9){
  bulan="September";
  }
  else if(t==10){
  bulan="Oktober";
  }
  else if(t==11){
  bulan="November";
  }
  else if(t==12){
  bulan="December";
  }
  String end=request.getParameter("end");
  String li=request.getParameter("line");
  String cekLine="select line_name from line where line_id='"+li+"'";
  ResultSet rsli=c.GetData(cekLine);
  rsli.next();
  String nline=rsli.getString("line_name");
  out.print("<h4 align='center'>Graphic Production "+nline+" &nbsp;"+bulan+"&nbsp;"+y+" Real Nyata</h4>");
   DefaultCategoryDataset dataset = new DefaultCategoryDataset();
   String query="select * from report join line on report.line_id=line.line_id where line.line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc ";
   ResultSet rs=c.GetData(query);
   int no=0; 
   DecimalFormat df = new DecimalFormat(".##");
   NumberFormat nf = NumberFormat.getInstance();
    while(rs.next()){
    no++;
    String n=Integer.toString(no);
int decimalPlace = 0; 
Float hpp1=rs.getFloat("hpp_qty1");
Float hpp2=rs.getFloat("hpp_qty2");
Float hpp3=rs.getFloat("hpp_qty3");
Float hpp4=rs.getFloat("hpp_qty4");
Float hpp5=rs.getFloat("hpp_qty5");

Float sell1=rs.getFloat("sell_qty1");
Float sell2=rs.getFloat("sell_qty2");
Float sell3=rs.getFloat("sell_qty3");
Float sell4=rs.getFloat("sell_qty4");
Float sell5=rs.getFloat("sell_qty5");
    
Float kw1=rs.getFloat("kw1");
Float kw2=rs.getFloat("kw2");
Float kw3=rs.getFloat("kw3");
Float kw4=rs.getFloat("kw4");
Float kw5=rs.getFloat("kw5");



Float sch=rs.getFloat("sch");
//rumus pro sch
Float proSch=sch*(sell1-hpp1)/1000000; 
//rumus pro real
Float proReal=((kw1*(sell1-hpp1))+(kw2*(sell2-hpp2))+(kw3*(sell3-hpp3))+(kw4*(sell4-hpp4))-(kw5*(sell5-hpp5)))/1000000;
//rumus val sch
Float valSch=sch*hpp1/1000000;
//rumus val real
Float valReal=((kw1*hpp1)+(kw2*hpp2)+(kw3+hpp3)+(kw4*hpp4)+(kw5*hpp5))/1000000;

dataset.addValue(proSch, "Profit Schedule", n);
dataset.addValue(proReal, "Profit Real", n);  
dataset.addValue(valSch, "Val Schedule", n);  
dataset.addValue(valReal, "Val Real", n);  

    }  
     //   JFreeChart bar = ChartFactory.createBarChart("Enrollment Chart", "subject","Count",dataset, PlotOrientation.HORIZONTAL,true, false, false);   
        //BarRenderer renderer = (BarRenderer) bar.getCategoryPlot().getRenderer();
JFreeChart chart=ChartFactory.createLineChart("", "Date", "Rp(Juta) ", dataset,PlotOrientation.VERTICAL, 
				true, 
				true, 
				true);
CategoryPlot plot = (CategoryPlot) chart.getPlot();

  DecimalFormat dfKey = new DecimalFormat("###,###");
  StandardCategoryItemLabelGenerator labelGenerator = new StandardCategoryItemLabelGenerator("{2}", dfKey);
  LineAndShapeRenderer renderer = new LineAndShapeRenderer();
  renderer.setBaseItemLabelsVisible(true);
  renderer.setBaseItemLabelGenerator(labelGenerator);

        renderer.setBaseItemLabelFont(new java.awt.Font("SansSerif", java.awt.Font.PLAIN, 4));        

        renderer.setSeriesShape(0, ShapeUtilities.createDiamond(1F));

        plot.setRenderer(renderer);
CategoryAxis domainAxis = plot.getDomainAxis();
domainAxis.setLowerMargin(up);
plot.getRenderer().setSeriesStroke(
    0, 
    new BasicStroke(
        2.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
        2.5f, new float[] {6.0f, 6.0f}, 0.0f
    ));
plot.getRenderer().setSeriesStroke(
    2, 
    new BasicStroke(
        2.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
        2.5f, new float[] {6.0f, 6.0f}, 0.0f
    ));
 plot.getRenderer().setSeriesPaint(0, new Color(139,0,139));  
 plot.getRenderer().setSeriesPaint(1, new Color(139,0,139));  
 plot.getRenderer().setSeriesPaint(2, Color.BLUE);  
 plot.getRenderer().setSeriesPaint(3, Color.BLUE);

 plot.getRenderer().setSeriesStroke(1, new BasicStroke(2.5f));
 plot.getRenderer().setSeriesStroke(3, new BasicStroke(2.5f));
plot.getDomainAxis().setVisible(false);
plot.setBackgroundPaint(Color.white);
plot.setRangeGridlinePaint(Color.black);
LegendTitle legend = chart.getLegend();
legend.setItemFont(new Font("Dialog", Font.PLAIN, 15));
//legend.setBackgroundPaint(new Color(200, 200, 255, 100));
legend.setFrame(new BlockBorder(Color.black));
legend.setPosition(RectangleEdge.BOTTOM);
LineAndShapeRenderer lrenderer = (LineAndShapeRenderer) plot.getRenderer();
//lrenderer.setStroke(new BasicStroke(1.8f, BasicStroke.JOIN_ROUND, BasicStroke.JOIN_BEVEL));



XYTitleAnnotation ta = new XYTitleAnnotation(0.98, 0.02, legend,RectangleAnchor.BOTTOM_RIGHT);
        String fileName = "/surya.png";
        String file = application.getRealPath("/") + fileName;
        try
        {
            FileOutputStream fileOut = new FileOutputStream(file);
            ChartUtilities.writeChartAsPNG(fileOut, chart,2000, 400);
        }
        catch (IOException e)
        {
             out.print(e);
        }


%>

<div style="margin-left:-10px"><img src="../surya.png" alt="subject Bar Chart" style="width: 98%;height:200px;" /></div>
<hr>
<div class="datagrid">
      <div class="inner"> 
<table   data-auto-width="false" id="example" style='border :1px solid black;' > 
    <%   
String quer="select * from report join line on report.line_id=line.line_id where line.line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
ResultSet rt=c.GetData(quer);
ResultSet rs1=c.GetData(quer);
ResultSet rs2=c.GetData(quer);
ResultSet rs3=c.GetData(quer);
ResultSet rs4=c.GetData(quer);
ResultSet rs5=c.GetData(quer);
ResultSet rs6=c.GetData(quer);
ResultSet rs7=c.GetData(quer);
ResultSet rs8=c.GetData(quer);
ResultSet rs9=c.GetData(quer);
ResultSet rs10=c.GetData(quer);
ResultSet rs11=c.GetData(quer);
ResultSet rs12=c.GetData(quer);
ResultSet rs13=c.GetData(quer);
ResultSet rs14=c.GetData(quer);
ResultSet rs15=c.GetData(quer);
out.print("<tr class='rw tebal' >");
out.print("<td align='center'  class='first' style='border-right:1px solid black' >&nbsp;&nbsp;&nbsp;DATE</td>");
while(rt.next()){
    String tgl=rt.getString("date");
    tgl= tgl.substring(tgl.length() - 2); 
    int tg=Integer.parseInt(tgl);
out.print("<td align='center'  style='border-right:1px solid black'>"+tg +"</td>");
}
out.print("<td rowspan='2' align='center' >TOTAL</td>");

out.print("<td  align='center' rowspan='2' style='border:1px solid black;'>MOTIF</td>");
out.print("</tr>");
out.print("<tr class='motif tebal'>");

out.print("<td >MOTIF</td>");
while(rs1.next()){
String cod=rs1.getString("item_code");
String cod1="";
String cod2="";
if(cod.equals("-")){
cod1="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Belum &nbsp;&nbsp;&nbsp;&nbsp;";
cod2="Produksi";
}
else{
String code=cod.replace("<", "&lt");
cod1=code.substring(0,6);
cod2=code.replace(cod1,"");
}
out.print("<td align='center'>"+cod1+"<br>"+cod2+"</td>");

}


out.print("</tr>");


out.print("<tr >");
out.print("<td style='border-bottom:1px solid #D0D0D0'>QTY SCH/M&nbsp;&sup2;</td>");
while(rs2.next()){
    Double hasil=0.0;
    int tipe=rs2.getInt("type_id");
    Double sch=rs2.getDouble("sch");
    if(tipe==1){
    hasil=(sch*0.8)+(sch*0.13)+(sch*0.02)+(sch*0.03)+(sch*0.01);
    }
    else{
     hasil=((sch*0.9)+(sch*0.03)+(sch*0.02)+(sch*0.03)+(sch*0.01))/1000000;
    }  
    String msch =nf.format(hasil);
    out.print("<td style='border-right:1px solid black'><table  class='in'><tr><td align='right' class='satu'>"+msch+"</td><td align='right'>(100%)</td></tr></table></td>");
}
String tsch="select SUM(hasil)as hsl from(select case when type_id = '1' then (Sch*0.8)+(sch*0.13)+(sch*0.02)+(sch*0.03)+(sch*0.01) when type_id >1 then (Sch*0.9)+(sch*0.03)+(sch*0.02)+(sch*0.03)+(sch*0.01)end as hasil from report where line_id="+li+" and date between '"+begin+"' and '"+end+"')a  ";
ResultSet rsch=c.GetData(tsch);
rsch.next();
 Double stot=rsch.getDouble("hsl");
 String msch=nf.format(stot);
out.print("<td align='right'>"+msch+"</td>");
out.print("<td style='border-bottom:1px solid #D0D0D0'>QTY SCH/M&nbsp;&sup2;;</td>");
out.print("</tr>");
out.print("<tr >");
out.print("<td style='border-bottom:1px solid black;border-top:1px solid #D0D0D0'>QTY REAL/M&nbsp;&sup2;</td>");
while(rs3.next()){
Double sch=rs3.getDouble("sch");
Double kw1=rs3.getDouble("kw1");
Double kw2=rs3.getDouble("kw2");
Double kw3=rs3.getDouble("kw3");
Double kw4=rs3.getDouble("kw4");
Double kw5=rs3.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pqt=Math.round((qty/sch)*100);
String font="";
if(qty<sch){
font="red";
}
String mqty=nf.format(qty)+" ("+nf.format(pqt)+"%)";
out.print("<td style='border-top:1px solid #D0D0D0;border-bottom:1px solid black;border-right:1px solid black'><table class='in'><tr><td align='right' class='satu'><font style='color:"+font+"'>"+nf.format(qty)+"</font></td><td align='right'>("+nf.format(pqt)+"%)</td></tr></table></td>");
}
String tqtyt="select SUM(kw1)+SUM(kw2)+SUM(kw3)+SUM(kw4)+SUM(kw5) as total from report  join line on report.line_id=line.line_id where line.line_id='"+li+"' and date between '"+begin+"' and '"+end+"'";
String cekKw="select sum(kw1)as kw1,sum(kw2)as kw2,sum(kw3)as kw3,sum(kw4)as kw4,sum(kw5)as kw5 from report  join line on report.line_id=line.line_id where line.line_id='"+li+"' and date between '"+begin+"' and '"+end+"'";
ResultSet rqtyr=c.GetData(tqtyt);
rqtyr.next();
double pp=rqtyr.getDouble("total");
String pto=nf.format(pp);
out.print("<td align='right' style='border-bottom:1px solid black;border-top:1px solid #D0D0D0'>"+pto+"</td>");
out.print("<td style='border-bottom:1px solid black;style='border-right:1px solid black;border-top:1px solid #D0D0D0'>QTY REAL/M&nbsp;&sup2;</td>");
out.print("</tr>");
out.print("<tr class='rw'> ");
out.print("<td align='center' style='border-left:1px solid black'>KW 1</td>");
while(rs4.next()){
Double kw1=rs4.getDouble("kw1");
Double kw2=rs4.getDouble("kw2");
Double kw3=rs4.getDouble("kw3");
Double kw4=rs4.getDouble("kw4");
Double kw5=rs4.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw1=Math.round((kw1/qty)*100);
String mkw1=nf.format(kw1)+" ("+nf.format(pkw1)+"%)";
out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0  '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw1)+"</td><td align='right'>("+nf.format(pkw1)+"%)</td></tr></table></td>");
}
ResultSet rkw=c.GetData(cekKw);
rkw.next();
double vkw1=rkw.getDouble("kw1");
String nkw1=nf.format(vkw1);
out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0;border-right:1px solid black;border-left:1px solid black  '><table class='in'><tr><td align='right' class='satu'>"+nkw1+"</td><td align='right'>("+(int) Math.round(((vkw1/pp)*100))+"%)</td></tr></table></td>");
out.print("<td align='center' style='border-right:1px solid black' class='brd'>KW 1</td>");
out.print("</tr>");     
out.print("<tr class='rw'>");
out.print("<td align='center' style='border-left:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 '>KW 2</td>");
while(rs5.next()){
Double kw1=rs5.getDouble("kw1");
Double kw2=rs5.getDouble("kw2");
Double kw3=rs5.getDouble("kw3");
Double kw4=rs5.getDouble("kw4");
Double kw5=rs5.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw2=Math.round((kw2/qty)*100);
String mkw2=nf.format(kw2)+" ("+nf.format(pkw2)+"%)";
out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0 ;border-right:1px solid black '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw2)+"</td><td align='right'>("+nf.format(pkw2)+"%)</td></tr></table></td>");
}
double vkw2=rkw.getDouble("kw2");
String nkw2=nf.format(vkw2);
out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0  '><table class='in'><tr><td align='right' class='satu'>"+nkw2+"</td><td align='right'>("+(int) Math.round(((vkw2/pp)*100))+"%)</td></tr></table></td>");
out.print("<td align='center' style='border-right:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 '>KW 2</td>");
out.print("</tr >"); 
out.print("<tr class='rw'>");
out.print("<td align='center' style='border-left:1px solid black'>KW 3</td>");
while(rs6.next()){
Double kw1=rs6.getDouble("kw1");
Double kw2=rs6.getDouble("kw2");
Double kw3=rs6.getDouble("kw3");
Double kw4=rs6.getDouble("kw4");
Double kw5=rs6.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw1=Math.round((kw3/qty)*100);
String mkw1=nf.format(kw3)+" ("+nf.format(pkw1)+"%)";
out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0;border-right:1px solid black  '> <table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw3)+"</td><td align='right'>("+nf.format(pkw1)+"%)</td></tr></table></td>");
}
double vkw3=rkw.getDouble("kw3");
String nkw3=nf.format(vkw3);
out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0  '><table class='in'><tr><td align='right' class='satu'>"+nkw3+"</td><td align='right'>("+(int) Math.round(((vkw3/pp)*100))+"%)</td></tr></table></td>");
out.print("<td align='center' style='border-right:1px solid black' >KW 3</td>");
out.print("</tr>"); 
out.print("<tr class='rw'>");
out.print("<td align='center' style='border-left:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 ' >KW 4</td>");
while(rs7.next()){
Double kw1=rs7.getDouble("kw1");
Double kw2=rs7.getDouble("kw2");
Double kw3=rs7.getDouble("kw3");
Double kw4=rs7.getDouble("kw4");
Double kw5=rs7.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw1=Math.round((kw4/qty)*100);
String mkw1=nf.format(kw4)+" ("+nf.format(pkw1)+"%)";
out.print("<td align='center' style='border-left:1px solid black;border-top:1px solid #D0D0D0 ;border-right:1px solid black '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw4)+"</td><td align='right'>("+nf.format(pkw1)+"%)</td></tr></table></td>");
}
double vkw4=rkw.getDouble("kw4");
String nkw4=nf.format(vkw4);
out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0  '><table class='in'><tr><td align='right' class='satu'>"+nkw4+"</td><td align='right'>("+(int) Math.round(((vkw4/pp)*100))+"%)</td></tr></table></td>");
out.print("<td align='center'  style='border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 '>KW 4</td>");
out.print("</tr>"); 
out.print("<tr class='rw'>");
out.print("<td align='center' style='border-bottom:1px solid black   '>KW 5</td>");
while(rs8.next()){
Double kw1=rs8.getDouble("kw1");
Double kw2=rs8.getDouble("kw2");
Double kw3=rs8.getDouble("kw3");
Double kw4=rs8.getDouble("kw4");
Double kw5=rs8.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw1=Math.round((kw5/qty)*100);
String mkw1=nf.format(kw5)+" ("+nf.format(pkw1)+"%)";
out.print("<td align='center' style='border-left:1px solid black;border-top:1px solid #D0D0D0 ;border-right:1px solid black '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw5)+"</td><td align='right'>("+nf.format(pkw1)+"%)</td></tr></table></td>");
}
double vkw5=rkw.getDouble("kw5");
String nkw5=nf.format(vkw5);
out.print("<td align='center'  style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0  '><table class='in'><tr><td align='right' class='satu'>"+nkw5+"</td><td align='right'>("+(int) Math.round(((vkw5/pp)*100))+"%)</td></tr></table></td>");
out.print("<td align='center' style='border-bottom:1px solid black' >KW 5</td>");
out.print("</tr>"); 
out.print("<tr >");
out.print("<td >VAL SCH</td>");
while(rs11.next()){   
    Double hasil=0.0;
    Float sch=rs11.getFloat("sch");
    Float hpp1=rs11.getFloat("hpp_qty1");
    Float hpp2=rs11.getFloat("hpp_qty2");
    Float hpp3=rs11.getFloat("hpp_qty3");
    Float hpp4=rs11.getFloat("hpp_qty4");
    Float hpp5=rs11.getFloat("hpp_qty5");
    
//  Float hasil=sch*hpp1/1000000;    
    int tipe=rs11.getInt("type_id");
   if(tipe==1){
     hasil=((sch*0.8*hpp1)+(sch*0.13*hpp2)+(sch*0.02*hpp3)+(sch*0.03*hpp4)+(sch*0.01*hpp5))/1000000;
     }
    else{
     hasil=((sch*0.9*hpp1)+(sch*0.03*hpp2)+(sch*0.02*hpp3)+(sch*0.03*hpp4)+(sch*0.01*hpp5))/1000000;
    }
String has=nf.format(hasil);
String angka="";
int x=has.indexOf('.');
if(x>0){
String[] pecah = has.split("\\.");
String da=pecah[1];
int leng=da.length();
if(leng==2){
angka=has+"0";
}
else if(leng==1){
angka=has+"00";
}
else{
angka=has;
}
}
else{
angka=has;
}
out.print("<td align='right'  style='border-left:1px solid black  ;border-top:1px solid black; border-bottom:1px solid #D0D0D0'>"+angka+"</td>");
}
String valSch="select SUM(hasil)as hsl from (select case when  TYPE_ID='1' then((SCH*0.8*hpp_qty1)+(SCH*0.13*hpp_qty2)+(SCH*0.02*hpp_qty3)+(SCH*0.03*hpp_qty4)+(SCH*0.01*hpp_qty5))when TYPE_ID >1 then ((SCH*0.9*hpp_qty1)+(SCH*0.03*hpp_qty2)+(SCH*0.02*hpp_qty3)+(SCH*0.03*hpp_qty4)+(SCH*0.01*hpp_qty5)) end as hasil from report where line_id="+li+" and date between '"+begin+"' and '"+end+"')a";
ResultSet rVal=c.GetData(valSch);
rVal.next();
Float dVal=rVal.getFloat("hsl")/1000000;
String sVal=nf.format(dVal);
out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid black;border-bottom:1px solid black #D0D0D0'><table  class='in'><tr><td align='right' class='satu'>"+sVal+"</td><td align='right'>(100%)</td></tr></table></td>");
out.print("<td >VAL SCH</td>");
out.print("</tr>"); 

out.print("<tr '>");
out.print("<td style='border-top:1px solid #D0D0D0'>VAL REAL</td>");
while(rs13.next()){
Double sch=rs13.getDouble("sch");
Double hpp1=rs13.getDouble("hpp_qty1");
Double hpp2=rs13.getDouble("hpp_qty2");
Double hpp3=rs13.getDouble("hpp_qty3");
Double hpp4=rs13.getDouble("hpp_qty4");
Double hpp5=rs13.getDouble("hpp_qty5");
Double kw1=rs13.getDouble("kw1");
Double kw2=rs13.getDouble("kw2");
Double kw3=rs13.getDouble("kw3");
Double kw4=rs13.getDouble("kw4");
Double kw5=rs13.getDouble("kw5");
String font="";
Double banding=sch*hpp1/1000000;
Double totals=((kw1*hpp1)+(kw2*hpp2)+(kw3*hpp3)+(kw4*hpp4)+(kw5*hpp5))/1000000;
if(totals<banding){
font="Red";
}
String has=nf.format(totals);

String angka="";

int x=has.indexOf('.');
if(x>0){
String[] pecah = has.split("\\.");
String da=pecah[1];
int leng=da.length();
if(leng==2){
angka=has+"0";
}
else if(leng==1){
angka=has+"00";
}
else{
angka=has;
}
}
else{
angka=has;
}
out.print("<td align='right' style='border-left:1px solid black  '><font style='color:"+font+"'>"+angka+"</font></td>");
}

String vre="select SUM(qty)as total from(select ((kw1*hpp_qty1)+(kw2*hpp_qty2)+(kw3*hpp_qty3)+(kw4*hpp_qty4)+(kw5*hpp_qty5))/1000000 as qty from report where date between '"+begin+"' and '"+end+"' and line_id='"+li+"' )a";
ResultSet rvre=c.GetData(vre);
rvre.next();
Float nil=rvre.getFloat("total");
String nilai=nf.format(nil);
out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0'><table  class='in'><tr><td align='right' class='satu'>"+nilai+"</td><td align='right'>("+(int)Math.round(((nil/dVal)*100))+")%</td></tr></table></td>");
out.print("<td style='border-top:1px solid #D0D0D0;'>VAL REAL</td>");
out.print("</tr>");

out.print("<tr '>");
out.print("<td style='border-top:1px solid #D0D0D0'>Deviation</td>");
while(rs15.next()){
Double sch=rs15.getDouble("sch");
Double hpp1=rs15.getDouble("hpp_qty1");
Double hpp2=rs15.getDouble("hpp_qty2");
Double hpp3=rs15.getDouble("hpp_qty3");
Double hpp4=rs15.getDouble("hpp_qty4");
Double hpp5=rs15.getDouble("hpp_qty5");
Double kw1=rs15.getDouble("kw1");
Double kw2=rs15.getDouble("kw2");
Double kw3=rs15.getDouble("kw3");
Double kw4=rs15.getDouble("kw4");
Double kw5=rs15.getDouble("kw5");

Double hasil=sch*hpp1/1000000;
Double totals=((kw1*hpp1)+(kw2*hpp2)+(kw3*hpp3)+(kw4*hpp4)+(kw5*hpp5))/1000000;
String totHasil=nf.format(hasil-totals);
out.print("<td align='right' style='border-left:1px solid black ;border-top:1px solid #D0D0D0; '>"+totHasil+"</td>");
}

out.print("<td style='border-top:1px solid #D0D0D0;border-left:1px solid black;' align='right'>"+nf.format(dVal-nil)+"</td>");
out.print("<td style='border-top:1px solid #D0D0D0;border-bottom:1px solid black'>Deviation</td>");
out.print("</tr>");

out.print("<tr>");

out.print("<td style='border-top:1px solid black;border-bottom:1px solid #D0D0D0'>PRO SCH</td>");
while(rs9.next()){
    Float sch=rs9.getFloat("sch");
    Float sell1=rs9.getFloat("sell_qty1");
    Float sell2=rs9.getFloat("sell_qty2");
    Float sell3=rs9.getFloat("sell_qty3");
    Float sell4=rs9.getFloat("sell_qty4");
    Float sell5=rs9.getFloat("sell_qty5");
    Float hpp1=rs9.getFloat("hpp_qty1");
    Float hpp2=rs9.getFloat("hpp_qty2");
    Float hpp3=rs9.getFloat("hpp_qty3");
    Float hpp4=rs9.getFloat("hpp_qty4");
    Float hpp5=rs9.getFloat("hpp_qty5");
    
Double rencana=0.0; 
 int tipe=rs9.getInt("type_id");
   if(tipe==1){
    rencana=(sch*0.8+(sell1-hpp1)+(sch*0.13+(sell2-hpp2))+(sch*0.02+(sell3-hpp3))+(sch*0.03+(sell4-hpp4))+(sch*0.01+(sell5-hpp5)));
    }
    else{
    rencana=(sch*0.9+(sell1-hpp1)+(sch*0.03+(sell2-hpp2))+(sch*0.02+(sell3-hpp3))+(sch*0.03+(sell4-hpp4))+(sch*0.01+(sell5-hpp5)));
    }
Double totHpp=Double.valueOf(df.format(rencana));
String has=nf.format(rencana);
String angka="";
int x=has.indexOf('.');
if(x>0){
String[] pecah = has.split("\\.");
String da=pecah[1];
int leng=da.length();
if(leng==2){
angka=has+"0";
}
else if(leng==1){
angka=has+"00";
}
else{
angka=has;
}
}
else{
angka=has;
}
out.print("<td align='right' style='border-left:1px solid black  ;border-top:1px solid black ;border-bottom:1px solid #D0D0D0 '>"+angka+"</td>");
}
String proSch="select sum(hasil) as hsl from(select case when TYPE_ID='1' then((sch*0.8+(sell_qty1-hpp_qty1))+(sch*0.13+(sell_qty2-hpp_qty2))+(sch*0.02+(sell_qty3-hpp_qty3))+(sch*0.03+(sell_qty4-hpp_qty4))+(sch*0.01+(sell_qty5-hpp_qty5)))when TYPE_ID>1 then ((sch*0.9+(sell_qty1-hpp_qty1))+(sch*0.03+(sell_qty2-hpp_qty2))+(sch*0.02+(sell_qty3-hpp_qty3))+(sch*0.03+(sell_qty4-hpp_qty4))+(sch*0.01+(sell_qty5-hpp_qty5)))end as hasil from report where line_id="+li+" and date between '"+begin+"' and '"+end+"')a";
ResultSet rPro=c.GetData(proSch);
rPro.next();
Float dPro=rPro.getFloat("hsl")/1000000;
String sPro=nf.format(dPro);
out.print("<td align='center' style='border-left:1px solid black ;border-top:1px solid black;border-bottom:1px solid #D0D0D0 '><table  class='in'><tr><td align='right' class='satu'>"+sPro+"</td><td align='right'>(100%)</td></tr></table></td>");
out.print("<td >PRO SCH</td>");
out.print("</tr>"); 
out.print("<tr >");
out.print("<td >PRO REAL</td>");
while(rs10.next()){
Float hpp1=rs10.getFloat("hpp_qty1");
Float hpp2=rs10.getFloat("hpp_qty2");
Float hpp3=rs10.getFloat("hpp_qty3");
Float hpp4=rs10.getFloat("hpp_qty4");
Float hpp5=rs10.getFloat("hpp_qty5");

Float sell1=rs10.getFloat("sell_qty1");
Float sell2=rs10.getFloat("sell_qty2");
Float sell3=rs10.getFloat("sell_qty3");
Float sell4=rs10.getFloat("sell_qty4");
Float sell5=rs10.getFloat("sell_qty5");
    
Float kw1=rs10.getFloat("kw1");
Float kw2=rs10.getFloat("kw2");
Float kw3=rs10.getFloat("kw3");
Float kw4=rs10.getFloat("kw4");
Float kw5=rs10.getFloat("kw5");
Float sch=rs10.getFloat("sch");
String font="";
Float rencana=sch*(sell1-hpp1)/1000000; 
Float hasil=((kw1*(sell1-hpp1))+(kw2*(sell2-hpp2))+(kw3*(sell3-hpp3))+(kw4*(sell4-hpp4))+(kw5*(sell5-hpp5)))/1000000;
if(hasil<rencana){
font="red";
}
String has=nf.format(hasil);
String angka="";

int x=has.indexOf('.');
if(x>0){
String[] pecah = has.split("\\.");
String da=pecah[1];
int leng=da.length();
if(leng==2){
angka=has+"0";
}
else if(leng==1){
angka=has+"00";
}
else{
angka=has;
}
}
else{
angka=has;
}out.print("<td align='right' style='border-right:1px solid black   '><font style='color:"+font+"'>"+angka+"</font></td>");
}
String proReal="select SUM(qty)as total from(select (kw1*(sell_qty1-hpp_qty1)+kw2*(sell_qty2-hpp_qty2)+kw3*(sell_qty3-hpp_qty3)+kw4*(sell_qty4-hpp_qty4)+kw5*(sell_qty5-hpp_qty5))/1000000 as qty from report where date between '"+begin+"' and '"+end+"' and line_id='"+li+"' )a";
ResultSet rReal=c.GetData(proReal);
rReal.next();
Float dReal=rReal.getFloat("total");
String sReal=nf.format(dReal);
out.print("<td align='center'><table  class='in'><tr><td align='right' class='satu'>"+sReal+"</td><td align='right'>("+(int)Math.round(((dReal/dPro)*100))+")%</td></tr></table></td>");
out.print("<td style='border-top:1px solid #D0D0D0;'>PRO REAL</td>");
out.print("</tr>"); 
out.print("<tr >");
out.print("<td  style='border-top:1px solid #D0D0D0;'>Deviation</td>");
while(rs14.next()){
Float hpp1=rs14.getFloat("hpp_qty1");
Float hpp2=rs14.getFloat("hpp_qty2");
Float hpp3=rs14.getFloat("hpp_qty3");
Float hpp4=rs14.getFloat("hpp_qty4");
Float hpp5=rs14.getFloat("hpp_qty5");

Float sell1=rs14.getFloat("sell_qty1");
Float sell2=rs14.getFloat("sell_qty2");
Float sell3=rs14.getFloat("sell_qty3");
Float sell4=rs14.getFloat("sell_qty4");
Float sell5=rs14.getFloat("sell_qty5");
    
Float kw1=rs14.getFloat("kw1");
Float kw2=rs14.getFloat("kw2");
Float kw3=rs14.getFloat("kw3");
Float kw4=rs14.getFloat("kw4");
Float kw5=rs14.getFloat("kw5");
Float sch=rs14.getFloat("sch");

Float rencana=sch*(sell1-hpp1)/1000000; 
Float hasil=((kw1*(sell1-hpp1))+(kw2*(sell2-hpp2))+(kw3*(sell3-hpp3))+(kw4*(sell4-hpp4))+(kw5*(sell5-hpp5)))/1000000;
Float total=rencana-hasil;

String has=nf.format(total);
out.print("<td align='right' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0;'>"+has+"</td>");

}
Float Dtot=dPro-dReal;
out.print("<td align='right' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0;'>"+nf.format(Dtot)+"</td>");
out.print("<td style='border-top:1px solid #D0D0D0;'>Deviation</td> ");
out.print("</tr >");
%>
</table>

<br>
<%
DefaultCategoryDataset data = new DefaultCategoryDataset();
 String x="select * from report join line on report.line_id=line.line_id where line.line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
 ResultSet rsl=c.GetData(x);
 int nx=0;
 while(rsl.next()){
    nx++;
    String n=Integer.toString(nx);
int decimalPlace = 0; 
Float hpp1=rsl.getFloat("hpp_qty1");
Float hpp2=rsl.getFloat("hpp_qty2");
Float hpp3=rsl.getFloat("hpp_qty3");
Float hpp4=rsl.getFloat("hpp_qty4");
Float hpp5=rsl.getFloat("hpp_qty5");

Float sell1=rsl.getFloat("sell_qty1");
Float sell2=rsl.getFloat("sell_qty2");
Float sell3=rsl.getFloat("sell_qty3");
Float sell4=rsl.getFloat("sell_qty4");
Float sell5=rsl.getFloat("sell_qty5");
    
Float kw1=rsl.getFloat("kw1");
Float kw2=rsl.getFloat("kw2");
Float kw3=rsl.getFloat("kw3");
Float kw4=rsl.getFloat("kw4");
Float kw5=rsl.getFloat("kw5");

Double kwData=0.9*kw1;
Float qty=kw1+kw2+kw3+kw4+kw5;
Float sch=rsl.getFloat("sch");
data.addValue(sch, "Quantity Schedule", n);
data.addValue(qty, "Quantity Real", n);
data.addValue(kwData, "KW1 Schedule", n);
data.addValue(kw1, "KW1 Real", n);
//data.addValue(qty, "Profit Real", n); 

JFreeChart cha=ChartFactory.createLineChart("", "Date", "M2", data,PlotOrientation.VERTICAL, 
				true, 
				true, 
				true);
CategoryPlot plots = (CategoryPlot) cha.getPlot();

DecimalFormat dfKey2 = new DecimalFormat("###,###");
StandardCategoryItemLabelGenerator labelGenerator2 = new StandardCategoryItemLabelGenerator("{2}", dfKey2);
LineAndShapeRenderer renderer2 = new LineAndShapeRenderer();
renderer2.setBaseItemLabelsVisible(true);
renderer2.setBaseItemLabelGenerator(labelGenerator2);
renderer2.setBaseItemLabelFont(new java.awt.Font("SansSerif", java.awt.Font.PLAIN, 4)); 
renderer2.setSeriesShape(0, ShapeUtilities.createDiamond(1F));
plots.setRenderer(renderer2);
CategoryAxis domainAxis2 = plots.getDomainAxis();
domainAxis2.setLowerMargin(down);
plots.getRenderer().setSeriesStroke(
    0, 
    new BasicStroke(
        2.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
        2.5f, new float[] {6.0f, 6.0f}, 0.0f
    ));

plots.getRenderer().setSeriesStroke(
    2, 
    new BasicStroke(
        2.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,
        2.5f, new float[] {6.0f, 6.0f}, 0.0f
    ));
 plots.getRenderer().setSeriesStroke(1, new BasicStroke(2.0f));
 plots.getRenderer().setSeriesStroke(3, new BasicStroke(2.0f));
 
 plots.getRenderer().setSeriesPaint(0, new Color(255, 119, 51)); 
 plots.getRenderer().setSeriesPaint(1, new Color(255, 119, 51)); 
 plots.getRenderer().setSeriesPaint(2, Color.GREEN); 
 plots.getRenderer().setSeriesPaint(3, Color.GREEN);
 plots.getDomainAxis().setVisible(false);
 plots.setBackgroundPaint(Color.white);
 plots.setRangeGridlinePaint(Color.black);
 XYTitleAnnotation tas = new XYTitleAnnotation(0.98, 0.02, legend,RectangleAnchor.BOTTOM_RIGHT);
        String fileNames = "/surya2.png";
        String files = application.getRealPath("/") + fileNames;
        try
        {
            FileOutputStream fileOuts = new FileOutputStream(files);
            ChartUtilities.writeChartAsPNG(fileOuts, cha,2000, 400);
        }
        catch (IOException e)
        {
             out.print(e);
        }
   
 
 
 
 }


%>
<div style="margin-left:-14px"><img src="../surya2.png" alt="subject Bar Chart" style="width: 98%;height:200px;  "/></div>
<br>
<div>

</div>
</div>
</div>
</div>
<input type="button" value="Print Data" onclick="jQuery('#mydiv').print()" />
</body>
</html>
