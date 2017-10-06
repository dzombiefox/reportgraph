<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>

<style>
    #example{
        font-size: 12px;
    }
</style>
<script>
    function formatDuit(number, places) {
	number = number || 0;
	places = !isNaN(places = Math.abs(places)) ? places : 2;
	var negative = number < 0 ? "-" : "",
	    i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
	    j = (j = i.length) > 3 ? j % 3 : 0;
	return '' + negative + (j ? i.substr(0, j) + ',' : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + ',');
}
$(document).ready(function(){
 $("#example").dataTable();
    var sumsch = 0;
    var sumqty=0;
    var sumkw1=0;
    var sumkw2=0;
    var sumkw3=0;
    var sumkw4=0;
    var sumkw5=0;
    var vsc=0;
    var vre=0;
    var psc=0;
    var pre=0;
	$('.sch').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			sumsch += parseFloat(value);
		}
        });
        $('.qty').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			sumqty+= parseFloat(value);
		}
    });
    $('.kw1').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			sumkw1+= parseFloat(value);
		}
    });
    $('.kw2').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			sumkw2+= parseFloat(value);
		}
    });
    $('.kw3').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			sumkw3+= parseFloat(value);
		}
    });
    $('.kw4').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			sumkw4+= parseFloat(value);
		}
    });
    $('.kw5').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			sumkw5+= parseFloat(value);
		}
    });
    
     $('.vsc').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			vsc+= parseFloat(value);
		}
    });
     $('.vre').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			vre+= parseFloat(value);
		}
    });
     $('.psc').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			psc+= parseFloat(value);
		}
    });
     $('.pre').each(function() {
        var value = parseFloat($(this).text().replace(/[^0-9]/g, ''));
		if(!isNaN(value) && value.length != 0) {
			pre+= parseFloat(value);
		}
    });
       $('.totsch').text(formatDuit(sumsch));
       $('.totqty').text(formatDuit(sumqty));
       $('.totkw1').text(formatDuit(sumkw1));
       $('.totkw2').text(formatDuit(sumkw2));
       $('.totkw3').text(formatDuit(sumkw3));
       $('.totkw4').text(formatDuit(sumkw4));
       $('.totkw5').text(formatDuit(sumkw5));
       $('.totvsc').text(formatDuit(vsc));
       $('.totvre').text(formatDuit(vre));
       $('.totpsc').text(formatDuit(psc));
       $('.totpre').text(formatDuit(pre));
    });
    
</script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Data Cost</a></li>
    <li><a href="#">data</a></li>
</ul>

<%
String begin=request.getParameter("begin");
String end=request.getParameter("end");
String li=request.getParameter("line");
int line=Integer.parseInt(li);	
    String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "excel.xls");

		}
                
                String href="cost/exportData.jsp?begin="+begin+"&end="+end+"&line="+line+"&exportToExcel=YES";
	%>
        <a href="<%=href%>" class="button primary">Export to Excel</a>       
<table class="condensed border bordered dataTable"  data-auto-width="false" id="example">
                        <thead>
                        <tr>
                            <th >No</th>                            
                            <th>DATE</th>
                            <th >ITEM CODE</th>
                            <th >LINE</th>
                            <th >SCHEDULE</th>
                            <th >QUANTITY</th>
                            <th >KW 1</th>
                            <th >KW 2</th>
                            <th >KW 3</th>
                            <th >KW 4</th>
                            <th >KW 5</th>
                            <th>Val Sch</th>
                            <th>Val Real</th>
                            <th>Pro Sch</th>
                            <th>Pro Real</th>                            
                        </tr>
                        </thead>
                        <tbody >
                        <%
                            int no=0;

connect c=new connect();
String query;
if(line==12){
query="select date,item_code,line_name,sum(sch)as sch,SUM(kw1+kw2+kw3+kw4+kw5)as quantity,sum(kw1)as kw1,sum(kw2)as kw2,sum(kw3)as kw3,sum(kw4)as kw4,sum(kw5)as kw5, round(valsch,2)as valsch ,ROUND(valreal,2)as valreal,ROUND(prosch,2)as prosch,ROUND(proreal,2)as proreal from report join line on report.line_id=line.line_id  join (select item_code as a,sum(sch*hpp_qty1)/1000000 as valsch from report group by item_code)x on item_code=a join (select item_code as b,sum((kw1*hpp_qty1)+(kw2*hpp_qty2)+(kw3+hpp_qty3)+(kw4*hpp_qty4)+(kw5*hpp_qty5))/1000000 as valreal from report group by item_code)y on item_code=b join (select item_code as c,sum(sch*(sell_qty1-hpp_qty1))/1000000 as prosch from report group by item_code)z on item_code=c join (select item_code as d,sum((kw1*(sell_qty1-hpp_qty1))+(kw2*(sell_qty2-hpp_qty2))+(kw3*(sell_qty3-hpp_qty3))+(kw4*(sell_qty4-hpp_qty4))-(kw5*(sell_qty5-hpp_qty5)))/1000000  as  proreal from report group by item_code)f on item_code=d where date between '"+begin+"' and '"+end+"'    group by  item_code,valsch,line_name,date,valreal,prosch,proreal";
}
else{
query="select date,item_code,line_name,sum(sch)as sch,SUM(kw1+kw2+kw3+kw4+kw5)as quantity,sum(kw1)as kw1,sum(kw2)as kw2,sum(kw3)as kw3,sum(kw4)as kw4,sum(kw5)as kw5, round(valsch,2)as valsch ,ROUND(valreal,2)as valreal,ROUND(prosch,2)as prosch,ROUND(proreal,2)as proreal from report join line on report.line_id=line.line_id  join (select item_code as a,sum(sch*hpp_qty1)/1000000 as valsch from report group by item_code)x on item_code=a join (select item_code as b,sum((kw1*hpp_qty1)+(kw2*hpp_qty2)+(kw3+hpp_qty3)+(kw4*hpp_qty4)+(kw5*hpp_qty5))/1000000 as valreal from report group by item_code)y on item_code=b join (select item_code as c,sum(sch*(sell_qty1-hpp_qty1))/1000000 as prosch from report group by item_code)z on item_code=c join (select item_code as d,sum((kw1*(sell_qty1-hpp_qty1))+(kw2*(sell_qty2-hpp_qty2))+(kw3*(sell_qty3-hpp_qty3))+(kw4*(sell_qty4-hpp_qty4))-(kw5*(sell_qty5-hpp_qty5)))/1000000  as  proreal from report group by item_code)f on item_code=d where date between '"+begin+"' and '"+end+"' and report.line_id='"+line+"'   group by  item_code,valsch,line_name,date,valreal,prosch,proreal";
}
ResultSet rs=c.GetData(query);
NumberFormat nf = NumberFormat.getInstance();

while(rs.next()){
    String cod=rs.getString("item_code");
cod=cod.replace("<", "&lt");
Float sc=rs.getFloat("sch");
Float qt=rs.getFloat("quantity");
Float k1=rs.getFloat("kw1");
Float k2=rs.getFloat("kw2");
Float k3=rs.getFloat("kw3");
Float k4=rs.getFloat("kw4");
Float k5=rs.getFloat("kw5");
Float vs=rs.getFloat("valsch");
Float vr=rs.getFloat("valreal");
Float ps=rs.getFloat("prosch");
Float pr=rs.getFloat("proreal");
String sch=nf.format(sc);
String qty=nf.format(qt);
String kw1=nf.format(k1);
String kw2=nf.format(k2);
String kw3=nf.format(k3);
String kw4=nf.format(k4);
String kw5=nf.format(k5);
String vsc=nf.format(vs);
String vre=nf.format(vr);
String psc=nf.format(ps);
String pre=nf.format(pr);
no++;%>
<tr>
    <td><%=no%></td>
    <td><% out.print(rs.getString("date")); %></td>
    <td><%=cod %></td>
    <td><% out.print(rs.getString("line_name")); %></td>
    <td class="sch"><%=sch%></td>
    <td class="qty"><%=qty%></td>
    <td class="kw1"><%=kw1%></td>
    <td class="kw2"><%=kw2%></td>
    <td class="kw3"><%=kw3%></td>
    <td class="kw4"><%=kw4%></td>
    <td class="kw5"><%=kw5%></td>
    <td class="vsc"><%=vsc%></td>
    <td class="vre"><%=vre%></td>
    <td class="psc"><%=psc%></td>
    <td class="pre"><%=pre%></td>
    
    
</tr>
<%}
%>
        
                        </tbody>
                        <tfoot>
                              <tr>
    <td  colspan="4">Total</td>
    <td class="totsch"></td>
    <td class="totqty"></td>
    <td class="totkw1"></td>
    <td class="totkw2"></td>
    <td class="totkw3"></td>
    <td class="totkw4"></td>
    <td class="totkw5"></td>
    <td class="totvsc"></td>
    <td class="totvre"></td>
    <td class="totpsc"></td>
    <td class="totpre"></td>
</tr> 
                        </tfoot>  
                    </table>
