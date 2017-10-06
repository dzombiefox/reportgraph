<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.List" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Graphic Production</title>
	</head>
<body>
	<h1>Export to Excel Example</h1>
        
	<table cellpadding="1"  cellspacing="1" bordercolor="gray">
		
		<%
                    DecimalFormat df = new DecimalFormat(".##");
NumberFormat nf = NumberFormat.getInstance();
                    connect c=new connect();
                    String quer="select * from report join line on report.line_id=line.line_id";
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
    	        response.setContentType("application/vnd.ms-excel");
        	    response.setHeader("Content-Disposition", "inline; filename="+ "employeereport.xls");
        	
	out.print("<tr>");
out.print("<td >DATE</td>");
while(rt.next()){
    String tgl=rt.getString("date");
    tgl= tgl.substring(tgl.length() - 2); 
    int tg=Integer.parseInt(tgl);
out.print("<td align='center'>"+tg +"</td>");
}
out.print("<tr>");
out.print("<td>MOTIF</td>");
while(rs1.next()){
out.print("<td align='center'>"+rs1.getString(3) +"</td>");
}
out.print("</tr>");
out.print("<tr>");
out.print("<td>SCH/BOX</td>");
while(rs2.next()){
    Double sch=rs2.getDouble("sch");
    String msch =nf.format(sch)+" (100%)";
    out.print("<td align='center'>"+msch +"</td>");
}
out.print("</tr>");
out.print("<tr>");
out.print("<td>QUANTITY</td>");
while(rs3.next()){
Double sch=rs3.getDouble("sch");
Double kw1=rs3.getDouble("kw1");
Double kw2=rs3.getDouble("kw2");
Double kw3=rs3.getDouble("kw3");
Double kw4=rs3.getDouble("kw4");
Double kw5=rs3.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pqt=Math.round((qty/sch)*100);
String mqty=nf.format(qty)+" ("+nf.format(pqt)+"%)";
out.print("<td align='center'>"+mqty+"</td>");
}
out.print("</tr>");
out.print("<tr>");
out.print("<td align='center'>KW 1</td>");
while(rs4.next()){
Double kw1=rs4.getDouble("kw1");
Double kw2=rs4.getDouble("kw2");
Double kw3=rs4.getDouble("kw3");
Double kw4=rs4.getDouble("kw4");
Double kw5=rs4.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw1=Math.round((kw1/qty)*100);
String mkw1=nf.format(kw1)+" ("+nf.format(pkw1)+"%)";
out.print("<td align='center'>"+mkw1+"</td>");
}
out.print("</tr>");     
out.print("<tr>");
out.print("<td align='center'>KW 2</td>");
while(rs5.next()){
Double kw1=rs5.getDouble("kw1");
Double kw2=rs5.getDouble("kw2");
Double kw3=rs5.getDouble("kw3");
Double kw4=rs5.getDouble("kw4");
Double kw5=rs5.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw2=Math.round((kw2/qty)*100);
String mkw2=nf.format(kw2)+" ("+nf.format(pkw2)+"%)";
out.print("<td align='center'>"+mkw2+"</td>");
}
out.print("</tr>"); 
out.print("<tr>");
out.print("<td align='center'>KW 3</td>");
while(rs6.next()){
Double kw1=rs6.getDouble("kw1");
Double kw2=rs6.getDouble("kw2");
Double kw3=rs6.getDouble("kw3");
Double kw4=rs6.getDouble("kw4");
Double kw5=rs6.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw1=Math.round((kw3/qty)*100);
String mkw1=nf.format(kw3)+" ("+nf.format(pkw1)+"%)";
out.print("<td align='center'>"+mkw1+"</td>");
}
out.print("</tr>"); 
out.print("<tr>");
out.print("<td align='center'>KW 4</td>");
while(rs7.next()){
Double kw1=rs7.getDouble("kw1");
Double kw2=rs7.getDouble("kw2");
Double kw3=rs7.getDouble("kw3");
Double kw4=rs7.getDouble("kw4");
Double kw5=rs7.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw1=Math.round((kw4/qty)*100);
String mkw1=nf.format(kw4)+" ("+nf.format(pkw1)+"%)";
out.print("<td align='center'>"+mkw1+"</td>");
}
out.print("</tr>"); 
out.print("<tr>");
out.print("<td align='center'>KW 5</td>");
while(rs8.next()){
Double kw1=rs8.getDouble("kw1");
Double kw2=rs8.getDouble("kw2");
Double kw3=rs8.getDouble("kw3");
Double kw4=rs8.getDouble("kw4");
Double kw5=rs8.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pkw1=Math.round((kw5/qty)*100);
String mkw1=nf.format(kw5)+" ("+nf.format(pkw1)+"%)";
out.print("<td align='center'>"+mkw1+"</td>");
}
out.print("</tr>"); 
out.print("<tr>");
out.print("<td>VAL SCH</td>");
while(rs9.next()){
Double sch=rs9.getDouble("sch");
Float hpp1=rs9.getFloat("hpp_qty1");
Float hpp2=rs9.getFloat("hpp_qty2");
Float hpp3=rs9.getFloat("hpp_qty3");
Float hpp4=rs9.getFloat("hpp_qty4");
Float hpp5=rs9.getFloat("hpp_qty5");
double totHpp=((hpp1+hpp2+hpp3+hpp4+hpp5)*sch/1000000);
totHpp=Double.valueOf(df.format(totHpp));
String mtotHpp=nf.format(totHpp);
out.print("<td align='center'>"+mtotHpp+"</td>");
}
out.print("</tr>"); 
out.print("<tr>");
out.print("<td>VAL EST</td>");
while(rs10.next()){
Double sch=rs10.getDouble("sch");
Float hpp1=rs10.getFloat("hpp_qty1");
Float hpp2=rs10.getFloat("hpp_qty2");
Float hpp3=rs10.getFloat("hpp_qty3");
Float hpp4=rs10.getFloat("hpp_qty4");
Float hpp5=rs10.getFloat("hpp_qty5");
Double kw1=rs10.getDouble("kw1");
Double kw2=rs10.getDouble("kw2");
Double kw3=rs10.getDouble("kw3");
Double kw4=rs10.getDouble("kw4");
Double kw5=rs10.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double realHpp=((hpp1+hpp2+hpp3+hpp4+hpp5)*qty/1000000);
realHpp=Double.valueOf(df.format(realHpp));
String mtotHpp=nf.format(realHpp);
out.print("<td align='center'>"+mtotHpp+"</td>");
}
out.print("</tr>"); 
out.print("<tr>");
out.print("<td>PRO SCH</td>");
while(rs11.next()){
Double sch=rs11.getDouble("sch");
Float hpp1=rs11.getFloat("hpp_qty1");
Float hpp2=rs11.getFloat("hpp_qty2");
Float hpp3=rs11.getFloat("hpp_qty3");
Float hpp4=rs11.getFloat("hpp_qty4");
Float hpp5=rs11.getFloat("hpp_qty5");
Float sell1=rs11.getFloat("sell_qty1");
Float sell2=rs11.getFloat("sell_qty2");
Float sell3=rs11.getFloat("sell_qty3");
Float sell4=rs11.getFloat("sell_qty4");
Float sell5=rs11.getFloat("sell_qty5");
double totSell=sell1+sell2+sell3+sell4+sell5;
double tot=hpp1+hpp2+hpp3+hpp4+hpp5;
double profit=totSell-tot;
double totHpp=((hpp1+hpp2+hpp3+hpp4+hpp5)*sch/1000000);
totHpp=Double.valueOf(df.format(totHpp));
double etotProf=profit*sch/1000000;
etotProf=Double.valueOf(df.format(etotProf));
out.print("<td align='center'>"+etotProf+"</td>");
}
out.print("</tr>"); 
out.print("<tr>");
out.print("<td>VAL EST</td>");
while(rs12.next()){
Double sch=rs12.getDouble("sch");
Float hpp1=rs12.getFloat("hpp_qty1");
Float hpp2=rs12.getFloat("hpp_qty2");
Float hpp3=rs12.getFloat("hpp_qty3");
Float hpp4=rs12.getFloat("hpp_qty4");
Float hpp5=rs12.getFloat("hpp_qty5");
Double kw1=rs12.getDouble("kw1");
Double kw2=rs12.getDouble("kw2");
Double kw3=rs12.getDouble("kw3");
Double kw4=rs12.getDouble("kw4");
Double kw5=rs12.getDouble("kw5");
double realHpp=((hpp1+hpp2+hpp3+hpp4+hpp5)*sch/1000000);
realHpp=Double.valueOf(df.format(realHpp));
String mtotHpp=nf.format(realHpp);
out.print("<td align='center'>"+mtotHpp+"</td>");
}
out.print("</tr>"); 
out.print("<tr>");
out.print("<td>PRO REAL</td>");
while(rs13.next()){
Double sch=rs13.getDouble("sch");
Float hpp1=rs13.getFloat("hpp_qty1");
Float hpp2=rs13.getFloat("hpp_qty2");
Float hpp3=rs13.getFloat("hpp_qty3");
Float hpp4=rs13.getFloat("hpp_qty4");
Float hpp5=rs13.getFloat("hpp_qty5");
Double kw1=rs13.getDouble("kw1");
Double kw2=rs13.getDouble("kw2");
Double kw3=rs13.getDouble("kw3");
Double kw4=rs13.getDouble("kw4");
Double kw5=rs13.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
Float sell1=rs13.getFloat("sell_qty1");
Float sell2=rs13.getFloat("sell_qty2");
Float sell3=rs13.getFloat("sell_qty3");
Float sell4=rs13.getFloat("sell_qty4");
Float sell5=rs13.getFloat("sell_qty5");
double totSell=sell1+sell2+sell3+sell4+sell5;
double tot=hpp1+hpp2+hpp3+hpp4+hpp5;
double profit=totSell-tot;
double etotProf=profit*qty/1000000;
etotProf=Double.valueOf(df.format(etotProf));
out.print("<td align='center'>"+etotProf+"</td>");
}
out.print("</tr>"); 
		%>
	</table>
</body>
</html>