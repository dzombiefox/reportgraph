<%@page import="config.koma"%>
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
  koma k=new koma();
  String begin=request.getParameter("begin");
  String bulan="";
  String[] date1 = begin.split("-");
  int t=Integer.parseInt(date1[1]);
  int y=Integer.parseInt(date1[0]);
  Double up=Double.parseDouble(request.getParameter("up"));
  Double down=Double.parseDouble(request.getParameter("down"));
  String  width=request.getParameter("width");
  String monthString;
        switch (t) {
            case 1:  monthString = "January";
                     break;
            case 2:  monthString = "February";
                     break;
            case 3:  monthString = "March";
                     break;
            case 4:  monthString = "April";
                     break;
            case 5:  monthString = "May";
                     break;
            case 6:  monthString = "June";
                     break;
            case 7:  monthString = "July";
                     break;
            case 8:  monthString = "August";
                     break;
            case 9:  monthString = "September";
                     break;
            case 10: monthString = "October";
                     break;
            case 11: monthString = "November";
                     break;
            case 12: monthString = "December";
                     break;
            default: monthString = "Invalid month";
                     break;
        }
  String end=request.getParameter("end");
  String li=request.getParameter("line");
  String cekLine="select line_name from line where line_id='"+li+"'";   
  ResultSet rsli=c.GetData(cekLine);
  rsli.next();
  String nline=rsli.getString("line_name");
  out.print("<h4 align='center'>Graphic Production "+nline+" &nbsp;"+monthString+"&nbsp;"+y+" Real Nyata</h4>");
    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
    String query="select ((b.sch*CONVERT(decimal(16,2),b.pkw1/100.0)*(sell_kw1-hpp_kw1))+(b.sch*CONVERT(decimal(16,2),b.pkw2/100.0)*(sell_kw2-hpp_kw2))+(b.sch*CONVERT(decimal(16,2),b.pkw3/100.0)*(sell_kw3-hpp_kw3))+(b.sch*CONVERT(decimal(16,2),b.pkw4/100.0)*(sell_kw4-hpp_kw4))+(b.sch*CONVERT(decimal(16,2),b.pkw5/100.0)*(sell_kw5-hpp_kw5)))/1000000 as proSch,((kw1*(sell_kw1-hpp_kw1))+(kw2*(sell_kw2-hpp_kw2))+(kw3*(sell_kw3-hpp_kw3))+(kw4*(sell_kw4-hpp_kw4))+(kw5*(sell_kw5-hpp_kw5)))/1000000as proReal,((b.sch*CONVERT(DECIMAL(16,2),b.pkw1/100.0)*hpp_kw1)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw2/100.0)*hpp_kw2)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw3/100.0)*hpp_kw3)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw4/100.0)*hpp_kw4)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw5/100.0)*hpp_kw5) )/1000000 as valSch,((kw1*hpp_kw1)+(kw2*hpp_kw2)+(kw3*hpp_kw3)+(kw4*hpp_kw4)+(kw5*hpp_kw5))/1000000 as valReal  from sch s join  prices p on s.price_id=p.prices_id join persen b on p.persen_id=b.persen_id  where line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
    ResultSet rs=c.GetData(query);
    int no=0; 
    DecimalFormat df = new DecimalFormat(".##");
    NumberFormat nf = NumberFormat.getInstance();
     while(rs.next()){
     no++;
     String n=Integer.toString(no);
        int decimalPlace = 0; 
        Float proSch=rs.getFloat("proSch"); 
        Float proReal=rs.getFloat("proReal");
        Double valSch=rs.getDouble("valSch");
        Float valReal=rs.getFloat("valReal");
        dataset.addValue(proSch, "Profit Schedule", n);
        dataset.addValue(proReal, "Profit Real", n);  
        dataset.addValue(valSch, "Val Schedule", n);  
        dataset.addValue(valReal, "Val Real", n);  
            } 
        JFreeChart chart=ChartFactory.createLineChart("", "Date", "Rp(Juta) ", dataset,PlotOrientation.VERTICAL,true,true,true);
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
                legend.setFrame(new BlockBorder(Color.black));
                legend.setPosition(RectangleEdge.BOTTOM);
                LineAndShapeRenderer lrenderer = (LineAndShapeRenderer) plot.getRenderer();
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
<div style="margin-left:-10px"><img src="../surya.png" alt="subject Bar Chart" style="width: <%=width%>%;height:200px;" /></div>
<br>
<table   data-auto-width="false" id="example" style='border :1px solid black;' > 
      <%
       String queryDate="select * from sch join prices on sch.price_id=prices.prices_id join persen on prices.persen_id=persen.persen_id join line on persen.line_id=line.line_id where line.line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
           ResultSet rdate=c.GetData(queryDate);
            ResultSet rmotif=c.GetData(queryDate);
             ResultSet rkw1=c.GetData(queryDate);
            ResultSet rkw2=c.GetData(queryDate);
            ResultSet rkw3=c.GetData(queryDate);
            ResultSet rkw4=c.GetData(queryDate);
            ResultSet rkw5=c.GetData(queryDate); 
            ResultSet rkw6=c.GetData(queryDate);
            out.print("<tr class='rw tebal' >");
            out.print("<td align='center'  class='first' style='border-right:1px solid black' >&nbsp;&nbsp;&nbsp;DATE</td>");
         while(rdate.next()){
              String tgl=rdate.getString("date");
              tgl= tgl.substring(tgl.length() - 2); 
              int tg=Integer.parseInt(tgl);
            out.print("<td align='center'  style='border-right:1px solid black'>"+tg +"</td>");
          }
               out.print("<td rowspan='2' align='center' >TOTAL</td>");
            out.print("<td  align='center' rowspan='2' style='border:1px solid black;'>MOTIF</td>");
            out.print("</tr>"); 
            out.print("<tr class='motif tebal'>");    
            out.print("<td >MOTIF</td>");
            while(rmotif.next()){
                String cod=rmotif.getString("item_code");
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
            out.print("<td align='center'>"+cod1+"<br>"+cod2+"</td>");                }
            out.print("</tr>");   
            out.print("<tr >");
       String querySch="select ((p.sch*p.pkw1)+(p.sch*p.pkw2)+(p.sch*p.pkw3)+(p.sch*p.pkw4)+(p.sch*p.pkw5))/100 as hasil from sch a join prices b on a.price_id=b.prices_id join persen p on b.persen_id=p.persen_id  where line_id='"+li+"' and date between '"+begin+"' and '"+end+"'";
          ResultSet rsch=c.GetData(querySch);
            out.print("<td style='border-bottom:1px solid #D0D0D0'>QTY SCH/M&nbsp;&sup2;</td>");
            Double totQtysch=0.0;
                 while(rsch.next()){
                 String msch =nf.format(rsch.getFloat("hasil"));
                 out.print("<td style='border-right:1px solid black'><table  class='in'><tr><td align='right' class='satu'>"+msch+"</td><td align='right'>(100%)</td></tr></table></td>");
                 totQtysch+=rsch.getDouble("hasil");
                                   }
            out.print("<td align='right'>"+nf.format(totQtysch)+"</td>");
            out.print("<td style='border-bottom:1px solid #D0D0D0'>QTY SCH/M&nbsp;&sup2;;</td>");
            out.print("</tr>");     
           out.print("<tr >");
            out.print("<td style='border-bottom:1px solid black;border-top:1px solid #D0D0D0'>QTY REAL/M&nbsp;&sup2;</td>");
            String queryQtyReal="select ((b.sch*b.pkw1)+(b.sch*b.pkw2)+(b.sch*b.pkw3)+(b.sch*b.pkw4)+(b.sch*b.pkw5))/100 as sch,a.kw1+a.kw2+a.kw3+a.kw4+a.kw5+a.kw6 as qty from sch a join prices p on a.price_id=p.prices_id join persen b on b.persen_id=p.persen_id where line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
            ResultSet rqtyReal=c.GetData(queryQtyReal);
            Double totQtyReal=0.0;
            while(rqtyReal.next()){
                double sch=rqtyReal.getDouble("sch");
                double qty=rqtyReal.getDouble("qty");
                double hasil=Math.round((qty/sch)*100);
                totQtyReal+=qty;
                String font="";
                    if(qty<sch){
                    font="#003399";
                    }
            out.print("<td style='border-top:1px solid #D0D0D0;border-bottom:1px solid black;border-right:1px solid black'><table class='in'><tr><td align='right' class='satu'><font style='color:"+font+"'>"+nf.format(qty)+"</font></td><td align='right'>("+nf.format(hasil)+"%)</td></tr></table></td>");
                    }
					String fontQtyReal="";
					if(totQtyReal<totQtysch){
						fontQtyReal="#003399";
					}
            out.print("<td align='right' style='border-bottom:1px solid black;border-top:1px solid #D0D0D0'><font style='color:"+fontQtyReal+"'>"+nf.format(totQtyReal)+"</font></td>");
            out.print("<td style='border-bottom:1px solid black;style='border-right:1px solid black;border-top:1px solid #D0D0D0'>QTY REAL/M&nbsp;&sup2;</td>");
            out.print("</tr >");
            out.print("<tr class='rw'> ");
            out.print("<td align='center' style='border-left:1px solid black'>KW 1</td>");
            Double totKw1=0.0;
            while(rkw1.next()){
                totKw1+=rkw1.getDouble("kw1");
                Double qty=rkw1.getDouble("kw1")+rkw1.getDouble("kw2")+rkw1.getDouble("kw3")+rkw1.getDouble("kw4")+rkw1.getDouble("kw5")+rkw1.getDouble("kw6");
                String totSatu=nf.format(Math.round((rkw1.getDouble("kw1")/qty)*100));
            out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0  '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(rkw1.getDouble("kw1"))+"</td><td align='right'>("+totSatu+"%)</td></tr></table></td>");   
            }
            out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0;border-right:1px solid black;border-left:1px solid black  '><table class='in'><tr><td align='right' class='satu'>"+nf.format(totKw1)+"</td><td align='right'>("+(int) Math.round(((totKw1/totQtyReal)*100))+"%)</td></tr></table></td>");
            out.print("<td align='center' style='border-right:1px solid black' class='brd'>KW 1</td>");
            out.print("</tr > ");
            out.print("<tr class='rw'>");
            out.print("<td align='center' style='border-left:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 '>KW 2</td>");
            Double totKw2=0.0;
            while(rkw2.next()){
                Double kw2=rkw2.getDouble("kw2");
                totKw2+=kw2;
                Double qty=rkw2.getDouble("kw1")+rkw2.getDouble("kw2")+rkw2.getDouble("kw3")+rkw2.getDouble("kw4")+rkw2.getDouble("kw5")+rkw2.getDouble("kw6");
                String totTiga=nf.format(Math.round((kw2/qty)*100));
                out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0 ;border-right:1px solid black '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw2)+"</td><td align='right'>("+totTiga+"%)</td></tr></table></td>");
            }
            out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0  '><table class='in'><tr><td align='right' class='satu'>"+nf.format(totKw2)+"</td><td align='right'>("+(int) Math.round(((totKw2/totQtyReal)*100))+"%)</td></tr></table></td>");
            out.print("<td align='center' style='border-right:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 '>KW 2</td>");
            out.print("</tr >");
            out.print("<tr class='rw'>");
            out.print("<td align='center' style='border-left:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 '>KW 3</td>");
            Double totKw3=0.0;
            while(rkw3.next()){
                Double kw3=rkw3.getDouble("kw3");
                totKw3+=kw3;
                Double qty=rkw3.getDouble("kw1")+rkw3.getDouble("kw2")+rkw3.getDouble("kw3")+rkw3.getDouble("kw4")+rkw3.getDouble("kw5")+rkw3.getDouble("kw6");
                String totDua=nf.format(Math.round((kw3/qty)*100));
                out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0 ;border-right:1px solid black '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw3)+"</td><td align='right'>("+totDua+"%)</td></tr></table></td>");
            }
            out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0  '><table class='in'><tr><td align='right' class='satu'>"+nf.format(totKw3)+"</td><td align='right'>("+(int) Math.round(((totKw3/totQtyReal)*100))+"%)</td></tr></table></td>");
            out.print("<td align='center' style='border-right:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 '>KW 3</td>");
            out.print("</tr >");
            out.print("<tr class='rw'>");
            out.print("<td align='center' style='border-left:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 '>KW 4</td>");
            Double totKw4=0.0;
            while(rkw4.next()){
                Double kw4=rkw4.getDouble("kw4");
                totKw4+=kw4;
                Double qty=rkw4.getDouble("kw1")+rkw4.getDouble("kw2")+rkw4.getDouble("kw3")+rkw4.getDouble("kw4")+rkw4.getDouble("kw5")+rkw4.getDouble("kw6");
                String totEmpat=nf.format(Math.round((kw4/qty)*100));
                out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0 ;border-right:1px solid black '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw4)+"</td><td align='right'>("+totEmpat+"%)</td></tr></table></td>");
            }
            out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0  '><table class='in'><tr><td align='right' class='satu'>"+nf.format(totKw4)+"</td><td align='right'>("+(int) Math.round(((totKw4/totQtyReal)*100))+"%)</td></tr></table></td>");
            out.print("<td align='center' style='border-right:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid #D0D0D0 '>KW 4</td>");
            out.print("</tr >");
            out.print("<tr class='rw'>");
            out.print("<td align='center' style='border-left:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px #D0D0D0 '>KW 5</td>");
            Double totKw5=0.0;
            while(rkw5.next()){
                Double kw5=rkw5.getDouble("kw5");
                totKw5+=kw5;
                Double qty=rkw5.getDouble("kw1")+rkw5.getDouble("kw2")+rkw5.getDouble("kw3")+rkw5.getDouble("kw4")+rkw5.getDouble("kw5")+rkw5.getDouble("kw6");
                String totLima=nf.format(Math.round((kw5/qty)*100));
                out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0 ;border-right:1px solid black '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw5)+"</td><td align='right'>("+totLima+"%)</td></tr></table></td>");
            }
            out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0  '><table class='in'><tr><td align='right' class='satu'>"+nf.format(totKw5)+"</td><td align='right'>("+(int) Math.round(((totKw5/totQtyReal)*100))+"%)</td></tr></table></td>");
            out.print("<td align='center' style='border-right:1px solid black;border-top:1px solid #D0D0D0 ;'>KW 5</td>");
            out.print("</tr >");
              out.print("</tr >");
            out.print("<tr class='rw'>");
            out.print("<td align='center' style='border-left:1px solid black ;border-bottom:1px solid black ;border-top:1px solid #D0D0D0  '>KW 6</td>");
            Double totKw6=0.0;
            while(rkw6.next()){
                Double kw6=rkw6.getDouble("kw6");
                totKw6+=kw6;
                Double qty=rkw6.getDouble("kw1")+rkw6.getDouble("kw2")+rkw6.getDouble("kw3")+rkw6.getDouble("kw4")+rkw6.getDouble("kw5")+rkw6.getDouble("kw6");
                String totEnam=nf.format(Math.round((kw6/qty)*100));
                out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0 ;border-right:1px solid black '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(kw6)+"</td><td align='right'>("+totEnam+"%)</td></tr></table></td>");
            }
            out.print("<td align='center' style='border-left:1px solid #D0D0D0  ;border-top:1px solid #D0D0D0  '><table class='in'><tr><td align='right' class='satu'>"+nf.format(totKw6)+"</td><td align='right'>("+(int) Math.round(((totKw6/totQtyReal)*100))+"%)</td></tr></table></td>");
            out.print("<td align='center' style='border-right:1px solid black;border-top:1px solid #D0D0D0 ;border-bottom:1px solid black'>KW 6</td>");
            out.print("</tr >");
         out.print("<tr >");
            out.print("<td style='border-top:1px solid black'>VAL SCH</td>");
            String queryValsch="select ((b.sch*CONVERT(DECIMAL(16,2),b.pkw1/100.0)*hpp_kw1)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw2/100.0)*hpp_kw2)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw3/100.0)*hpp_kw3)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw4/100.0)*hpp_kw4)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw5/100.0)*hpp_kw5) )/1000000 as hasil from sch a join prices p on a.price_id=p.prices_id join  persen b on p.persen_id=b.persen_id where line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc ";
            ResultSet rvalsch=c.GetData(queryValsch);
            Double valTotsch=0.0;
            Double schBanding=0.0;
            while(rvalsch.next()){
                String totalvalSch=nf.format(rvalsch.getDouble("hasil"));
                schBanding=rvalsch.getDouble("hasil");
                valTotsch+=rvalsch.getDouble("hasil");
                String angka="";
                int x=totalvalSch.indexOf('.');
                
                angka=k.getPlus(rvalsch.getDouble("hasil"));                
            out.print("<td align='right'  style='border-left:1px solid black  ;border-top:1px solid black; border-bottom:1px solid #D0D0D0'>"+angka+"</td>");
            }
            String totSche=k.getPlus(valTotsch);
            out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid black;border-bottom:1px solid black #D0D0D0'><table  class='in'><tr><td align='right' class='satu'>"+totSche+"</td><td align='right'>(100%)</td></tr></table></td>");
            out.print("<td >VAL SCH</td>");
            out.print("</tr>");
              out.print("<tr '>");
            out.print("<td style='border-top:1px solid #D0D0D0'>VAL REAL</td>");
            String queryValReal="select ((b.sch*CONVERT(DECIMAL(16,2),b.pkw1/100.0)*hpp_kw1)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw2/100.0)*a.hpp_kw2)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw3/100.0)*hpp_kw3)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw4/100.0)*a.hpp_kw4)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw5/100.0)*hpp_kw5) )/1000000 as valSch,(s.kw1*a.hpp_kw1)+(s.kw2*a.hpp_kw2)+(s.kw3*a.hpp_kw3)+(s.kw4*hpp_kw4)+(s.kw5*a.hpp_kw5)as hasil,(((b.sch*b.pkw1)+(b.sch*b.pkw2)+(b.sch*b.pkw3)+(b.sch*b.pkw4)+(b.sch*b.pkw5))/100)/ISNULL(NULLIF(hpp_kw1,0),1) as banding from  sch s join prices a on s.price_id=a.prices_id join persen b on a.persen_id=b.persen_id where line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
            ResultSet rvalreal=c.GetData(queryValReal);
                double totalValReal=0;
                String totalSch="";
             int z=nf.format(totalValReal).indexOf('.');
                double realBanding=0.0;    
                double bandingSch=0.0;
                while(rvalreal.next()){
                        double banding=rvalreal.getDouble("banding");
                        double  valReal=rvalreal.getDouble("hasil")/1000000;
		        bandingSch=rvalreal.getDouble("valSch");
                        totalValReal+=valReal;
                        String font="";
                        String angka="";
                        if(valReal==0){
                        font="black";
                        angka="0";
                        }
                        else if(valReal<0){
                            font="red";
                            angka=k.getPlus(valReal);
                            }
                        else if((valReal>0)&&(valReal<banding)){
                             font="#003399";
                             angka=k.getMinus(valReal);
                         }
                        else{
                        font="black";
                        angka=k.getPlus(valReal);
                        }
                        out.print("<td align='right' style='border-left:1px solid black  '><font style='color:"+font+"'>"+angka+"</font></td>");    
           }	
				String fontValReal="";
				if(valTotsch>totalValReal){
					fontValReal="#003399";
				}
            totalSch=k.getBehind(totalValReal);
            out.print("<td align='center' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0'><table  class='in'><tr><td align='right' class='satu'><font style='color:"+fontValReal+"'>"+totalSch+"</font></td><td align='right'>("+(int)Math.round(((totalValReal/(valTotsch))*100))+")%</td></tr></table></td>");
            out.print("<td style='border-top:1px solid #D0D0D0;'>VAL REAL</td>");
            out.print("</tr '>");
             out.print("<tr '>");
            out.print("<td style='border-top:1px solid #D0D0D0'>Variant</td>");
                String queryVariantVal="select ((((b.sch*CONVERT(DECIMAL(16,2),b.pkw1/100.0)*hpp_kw1)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw2/100.0)*hpp_kw2)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw3/100.0)*hpp_kw3)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw4/100.0)*hpp_kw4)+(b.sch*CONVERT(DECIMAL(16,2),b.pkw5/100.0)*hpp_kw5) ))-((kw1*hpp_kw1)+(kw2*hpp_kw2)+(kw3*hpp_kw3)+(kw4*hpp_kw4)+(kw5*hpp_kw5)))/1000000 as variant from  sch s join prices a on s.price_id=a.prices_id join persen b on a.persen_id=b.persen_id where line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
                ResultSet rvarVal=c.GetData(queryVariantVal);
                double variant=0.0;
                    while(rvarVal.next()){
		    String fo="";
                    String replace="";
                    double vari=rvarVal.getDouble("variant"); 
                    variant+=vari;    
                    String angka="";
                    if(vari==0){
                        angka="0";
                        fo="black";
                               }
                    else if((vari<0)){
                    angka=k.getMinus(vari);
                    fo="red";
                    }
                    else if(vari >0){
                    angka=k.getPlus(vari);
                    fo="#003399";
                    }
                     out.print("<td style='border-top:1px solid #D0D0D0;border-left:1px solid black;' align='right'><font style='color:"+fo+"'>"+angka+"</font></td>");
                    }
                    String totalVarian,fontVariant="";
                    if(variant<0){
                    totalVarian=k.getMinus(variant);
                    fontVariant="red";
                    }
                    else if(variant==0){
                    fontVariant="black";
                    totalVarian="0";
                    }
                    else{
                    fontVariant="#003399";
                    totalVarian=k.getPlus(variant);
                    }
           out.print("<td align='right' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0'><table  class='in' ><tr><td align='right' class='satu'><font style='color:"+fontVariant+"'>"+totalVarian+"</font></td><td align='right'>("+(int)Math.round(100-((totalValReal/(valTotsch))*100))+")%</td></tr></table></td>");
            out.print("<td style='border-top:1px solid #D0D0D0;border-bottom:1px solid black'>Variant</td>");       
            out.print("</tr '>");
            out.print("<tr '>");
            out.print("<td style='border-top:1px solid black;border-bottom:1px solid #D0D0D0'>PRO SCH</td>");
            String queryvalSch="select ((b.sch*CONVERT(decimal(16,2),b.pkw1/100.0)*(sell_kw1-hpp_kw1))+(b.sch*CONVERT(decimal(16,2),b.pkw2/100.0)*(sell_kw2-hpp_kw2))+(b.sch*CONVERT(decimal(16,2),b.pkw3/100.0)*(sell_kw3-hpp_kw3))+(b.sch*CONVERT(decimal(16,2),b.pkw4/100.0)*(sell_kw4-hpp_kw4))+(b.sch*CONVERT(decimal(16,2),b.pkw5/100.0)*(sell_kw5-hpp_kw5)))/1000000 as proSch from  sch s join prices a on s.price_id=a.prices_id join persen b on a.persen_id=b.persen_id where line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
            ResultSet rvalSch=c.GetData(queryvalSch);
            Double totalValSch=0.0;
            
            while(rvalSch.next()){
                Double proSch=rvalSch.getDouble("proSch");
                totalValSch+=proSch;
                String angka="";
				String font="";
				if(proSch<0){
					angka=k.getMinus(proSch);				
					font="red";
				}
				else{
                                    angka=k.getPlus(proSch);
                                }
				out.print("<td align='right' style='border-left:1px solid black  ;border-top:1px solid black ;border-bottom:1px solid #D0D0D0 '><font color='"+font+"'>"+angka+"</font></td>");
            }
            out.print("<td align='center' style='border-left:1px solid black ;border-top:1px solid black;border-bottom:1px solid #D0D0D0 '><table  class='in'><tr><td align='right' class='satu'>"+nf.format(totalValSch)+"</td><td align='right'>(100%)</td></tr></table></td>");
            out.print("<td >PRO SCH</td>");
            out.print("</tr>");
             out.print("<tr >");
            out.print("<td >PRO REAL</td>");
            String queryProReal="select ((p.sch*CONVERT(decimal(16,2),p.pkw1/100.0)*(b.sell_kw1-b.hpp_kw1))+(p.sch*CONVERT(decimal(16,2),p.pkw2/100.0)*(b.sell_kw2-b.hpp_kw2))+(p.sch*CONVERT(decimal(16,2),p.pkw3/100.0)*(b.sell_kw3-b.hpp_kw3))+(p.sch*CONVERT(decimal(16,2),p.pkw4/100.0)*(b.sell_kw4-b.hpp_kw4))+(p.sch*CONVERT(decimal(16,2),p.pkw5/100.0)*(b.sell_kw5-b.hpp_kw5)))/1000000 as proSch ,((a.kw1*(b.sell_kw1-b.hpp_kw1))+(a.kw2*(b.sell_kw2-b.hpp_kw2))+(a.kw3*(b.sell_kw3-b.hpp_kw3))+(a.kw4*(b.sell_kw4-b.hpp_kw4))+(a.kw5*(b.sell_kw5-b.hpp_kw5))+(a.kw6*(b.sell_kw6-b.hpp_kw6)))/1000000 as pro from  sch a join prices b on a.price_id=b.prices_id join persen p on b.persen_id=p.persen_id where line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
            ResultSet rqueryPro=c.GetData(queryProReal);
            Double totalProReal=0.0;
            while(rqueryPro.next()){
                    String f="";
                    String angka="";
                    String replace="";
                    Double valDataPro=rqueryPro.getDouble("pro");
		    Double band=rqueryPro.getDouble("proSch");                   
                    if(valDataPro<0){
                     replace=k.getMinus(valDataPro);
                     f="red";
                    }
                    else if((valDataPro<band)&& valDataPro>0){
                     replace=nf.format(valDataPro);    
                     f="#003399";
                    }
                    else{
                     replace=k.getPlus(valDataPro);  
                     f="black";
                    }
          
                    totalProReal+=valDataPro;               
            out.print("<td align='right' style='border-right:1px solid black   '><font style='color:"+f+"'>"+replace+"</font></td>");
            }
			String fn="";	
                        String totPro="";
                        if(totalProReal<0){
			totPro=k.getMinus(totalProReal);
                         }
                        else if((totalProReal<totalValSch)&& totalProReal>0){
                            totPro=nf.format(totalProReal);
			    fn="#003399";				
			}
			else if((totalProReal>totalValSch)){
                            totPro=nf.format(totalProReal);
			    fn="black";				
			}
			
                        
                        
            out.print("<td align='center'><table  class='in'><tr><td align='right' class='satu'><font style='color:"+fn+"'>"+totPro+"</font></td><td align='right'>("+(int)Math.round(((totalProReal/totalValSch)*100))+")%</td></tr></table></td>");
            out.print("<td style='border-top:1px solid #D0D0D0;'>PRO REAL</td>");
            out.print("</tr>"); 
            out.print("<tr >");
            out.print("<td  style='border-top:1px solid #D0D0D0;'>Variant</td>");
                String varianPro="select (((p.sch*CONVERT(decimal(16,2),p.pkw1/100.0)*(sell_kw1-hpp_kw1))+(p.sch*CONVERT(decimal(16,2),p.pkw2/100.0)*(sell_kw2-hpp_kw2))+(p.sch*CONVERT(decimal(16,2),p.pkw3/100.0)*(sell_kw3-hpp_kw3))+(p.sch*CONVERT(decimal(16,2),p.pkw4/100.0)*(sell_kw4-hpp_kw4))+(p.sch*CONVERT(decimal(16,2),p.pkw5/100.0)*(sell_kw5-hpp_kw5))+(p.sch*CONVERT(decimal(16,2),0/100.0)*(sell_kw6-hpp_kw6)))/1000000)-(((a.kw1*(b.sell_kw1-b.hpp_kw1))+(a.kw2*(b.sell_kw2-b.hpp_kw2))+(a.kw3*(b.sell_kw3-b.hpp_kw3))+(a.kw4*(b.sell_kw4-b.hpp_kw4))+(a.kw5*(b.sell_kw5-b.hpp_kw5))+(a.kw6*(b.sell_kw6-b.hpp_kw6)))/1000000)as variant from  sch a join prices b on a.price_id=b.prices_id join persen p on b.persen_id=p.persen_id where line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
                ResultSet rvarianPro=c.GetData(varianPro);
                Double totalVarianProd=0.0;
                while(rvarianPro.next()){
                        Double varianProd=rvarianPro.getDouble("variant");
						String fnt="";
						String replace="";
						String vari=nf.format(varianProd);
                                                if(varianProd==0){
                                                replace="0";
                                                }
						if(varianProd<0){
                                                    replace=k.getMinus(varianProd);                                                   
                                                    fnt="red";
						}                                               
                                                
                                                else if(varianProd>0)
                                                {
                                                replace=k.getPlus(varianProd);
                                                fnt="black";
                                                }		
                 totalVarianProd+=varianProd;
              
                       
						
                        out.print("<td style='border-top:1px solid #D0D0D0;border-left:1px solid black;' align='right'><font style='color:"+fnt+"'>"+replace+"</font></td>");
                        }
						String fo="";
						String totVar=nf.format(totalVarianProd);
						if(totalVarianProd<0){
							fo="red";
							totVar=k.getMinus(totalVarianProd);
							
						}
            out.print("<td align='right' style='border-left:1px solid black  ;border-top:1px solid #D0D0D0'><table  class='in' ><tr><td align='right' class='satu'><font style='color:"+fo+"'>"+totVar+"</font></td><td align='right'>("+(int)Math.round(100-((totalProReal/(totalValSch))*100))+")%</td></tr></table></td>");
            out.print("<td style='border-top:1px solid #D0D0D0;border-bottom:1px solid black'>Variant</td>");
            out.print("</tr >");
            
           
            
      %>  
        
             </table>
   <%
DefaultCategoryDataset data = new DefaultCategoryDataset();
 String x="select ((p.sch*p.pkw1)+(p.sch*p.pkw2)+(p.sch*p.pkw3)+(p.sch*p.pkw4)+(p.sch*p.pkw5))/100 as sch,a.kw1+a.kw2+a.kw3+a.kw4+a.kw5 as qty,0.9*a.kw1 as kw1sch,a.kw1 as kw1 from sch a join prices b on a.price_id=b.prices_id join  persen p on b.persen_id=p.persen_id where line_id='"+li+"' and date between '"+begin+"' and '"+end+"' order by date asc";
 ResultSet rsl=c.GetData(x);
 int nx=0;
 while(rsl.next()){
        nx++;
        String n=Integer.toString(nx);
        int decimalPlace = 0; 
        Float kw1=rsl.getFloat("kw1");
        Double kwData=rsl.getDouble("kw1sch");
        Float qty=rsl.getFloat("qty");
        Float sch=rsl.getFloat("sch");
        data.addValue(sch, "Quantity Schedule", n);
        data.addValue(qty, "Quantity Real", n);
        data.addValue(kwData, "KW1 Schedule", n);
        data.addValue(kw1, "KW1 Real", n);
        JFreeChart cha=ChartFactory.createLineChart("", "Date", "M2", data,PlotOrientation.VERTICAL, true,true,true);
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
            plots.getRenderer().setSeriesStroke(0,new BasicStroke(2.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,2.5f, new float[] {6.0f, 6.0f}, 0.0f));
            plots.getRenderer().setSeriesStroke(2,new BasicStroke(2.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND,2.5f, new float[] {6.0f, 6.0f}, 0.0f));plots.getRenderer().setSeriesStroke(1, new BasicStroke(2.0f));
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
<div style="margin-left:-14px"><img src="../surya2.png" alt="subject Bar Chart" style="width: <%=width%>%;height:200px;  "/></div>
<br>
</div>
<input type="button" value="Print Data" onclick="jQuery('#mydiv').print()" />
</body>

</html>
