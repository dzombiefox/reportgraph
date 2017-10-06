<%@page import="formula.drop"%>
<%@page import="formula.roller"%>
<%@page import="formula.pasta"%>
<%@page import="formula.ink"%>
<%@page import="formula.glaze"%>
<%@page import="formula.engobe"%>
<%@page import="formula.alumina"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="formula.body"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script src="../../js/jquery-2.1.3.min.js" type="text/javascript"></script>
<link href="../../build/css/metro.css" rel="stylesheet" type="text/css"/>
<script src="../../js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../js/dataTables.tableTools.js" type="text/javascript"></script>
  <script src="../../js/jQuery.print.js" type="text/javascript"></script>
<style>
    #example tbody td  { 
    width:100%;
    color: #00557F;
    border: 1px solid #E1EEF4;
    font-size: 11px;
    font-weight: normal;
    }    
    .in{
        width: 100%;
    }
    .datagrid table tbody td { 
    color: #00557F;
    font-size: 11px;font-weight: normal;    
   }
 .datagrid .in tbody tr { 
  height: 5px;
}
</style>
 <ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Detail</a></li>
    <li><a href="#">Finish Goods</a></li>
</ul> 
<div class="example" id="example" data-text="Detail Formula Body"  style="margin-left: 30px">
      <div class="datagrid">
            <div class="inner">
<table data-auto-width="false" id="example" class="border condensed">
    <thead>
    <th>NO</th>
    <th>IMAGE</th>
    <th>Motif /Design</th>
    <th>Size</th>
    <th>Cost(Rp/M&sup2;)</th>
    </thead>
    <tbody>
<%
            int no=0;
                      
connect c=new connect();
body b=new body();
alumina a=new alumina();
engobe e=new engobe();
glaze g=new glaze();
ink i=new ink();
pasta p=new pasta();
roller r=new roller();
drop d=new drop();
DecimalFormat df=new DecimalFormat(".##");
NumberFormat nf=NumberFormat.getInstance();
String begin=request.getParameter("begin").replace(".", "-");
String end=request.getParameter("end").replace(".", "-");
int opt=Integer.parseInt(request.getParameter("opt"));
int brand=Integer.parseInt(request.getParameter("brand"));
String query="select m.image,bo.choose,f.opt,f.dfinish_id,f.finish_id,f.date,f.body_id,f.alumina_id,f.glaze_id,f.engobe_id,f.drop_id,p.periode ,m.name as motif,b.name as brand ,s.size,c.name as color from finish f JOIN PERIODE p on f.periode_id=p.id JOIN rmotif m on f.motif_id=m.rmotif_id join brand b on m.brand_id=b.brand_id join size s on f.size_id=s.size_id join color c on f.color_id=c.color_id join body bo on f.body_id=bo.body_id where b.brand_id='"+brand+"' and f.opt='"+opt+"'";
ResultSet rs=c.GetData(query);
while(rs.next()){
    String id=rs.getString("dfinish_id");
    String motif=rs.getString("motif");
    String color=rs.getString("color");
    String size=rs.getString("size");
    String image=rs.getString("image");
    int body=rs.getInt("body_id");
    int alumina=rs.getInt("alumina_id");
    int engobe=rs.getInt("engobe_id");
    int glaze=rs.getInt("glaze_id");
    int drop=rs.getInt("drop_id");
    int op=rs.getInt("opt");
    Double tbody=Double.valueOf(df.format(b.getcostDry(body)));
    Double talumina=Double.valueOf(df.format(a.getCostDry(alumina)));
    Double tengobe=Double.valueOf(df.format(e.getCostDry(engobe)));
    Double tglaze=Double.valueOf(df.format(g.getCostDry(glaze)));
    Double cDrop=Double.valueOf(df.format(d.getCostDry(drop)));
    int totbody=tbody.intValue();
    int totAlumina=talumina.intValue();
    int totEngobe=tengobe.intValue();
    int totGlaze=tglaze.intValue();
    int totDrop=cDrop.intValue();
    int totPasta=0;
    int totRoller=0;
    int totInk=0;
    int totWhite=totbody+totAlumina+totEngobe+totGlaze+totDrop;
    no++;
%>
        <tr>
            <td style="width:10px;" align="center"><%=no%></td> 
            <td style="width:20%;" align="center">
                <img src="../motif/image/<%=image%>"  style="width:150px;height:auto">
            </td>
            <td style="width:24%;" align="center">
               <%=motif+" "+color%> 
            </td>
            <td style="width:14%;" align="center">
               <%=size%> 
            </td>
            <td>
              
                <table class="in" style="margin-top: 0px;" >
                    <tr>
                    <td>Body :</td>
                    <td>Rp</td>
                    <td align="right"><% out.print(nf.format(totbody));%> </td>
                    </tr>
                    <tr>
                    <td >Alumina :</td>
                    <td>Rp</td>
                    <td align="right"><% out.print(talumina);%> </td>
                    </tr>
                    <tr>
                    <td>Engobe :</td>
                    <td>Rp</td>
                    <td align="right"><% out.print(nf.format(totEngobe));%> </td>
                    </tr>
                    <tr>
                    <td>Glaze :</td>
                    <td>Rp</td>
                    <td align="right"><% out.print(nf.format(totGlaze));%> </td>
                    </tr>
                    <tr>
                    <td>Drop :</td>
                    <td>Rp</td>
                    <td align="right"><% out.print(nf.format(totDrop));%> </td>
                    </tr>
                    
                    <%  
                    if(op==0){
                    out.print("<tr>");
                    out.print("<td>Total</td>");
                    out.print("<td>Rp</td>");
                    out.print("<td>"+nf.format(totWhite)+"</td>");
                    out.print("</tr>");
                    }
                    
              if(op==1){
                  String que="select * from dpasta d join pasta p on d.pasta_id=p.pasta_id where dfinish_id='"+id+"'";
                  ResultSet rpas=c.GetData(que);                  
                  while(rpas.next()){
                  int idPasta=rpas.getInt("pasta_id"); 
                  Double tPasta=p.getDoubleCostDry(idPasta);
                  int totalPasta=tPasta.intValue();
                  totPasta+=totalPasta;
                  out.print("<tr>");
                  out.print("<td>"+rpas.getString("opt")+"</td>");
                  out.print("<td>Rp</td>");
                  out.print("<td align='right'>"+nf.format(totalPasta)+"</td>");
                  out.print("</tr>");                   
                  }
                   int rol=0;
                    String rrol="select * from droller d join mroller m on d.roller_id=m.mroller_id where dfinish_id='"+id+"'";  
                    ResultSet rr=c.GetData(rrol);
                    while(rr.next()){
                    rol++;
                    int idroller=rr.getInt("roller_id");
                    Double tRoller=r.getCostPrint(idroller);
                    
                    totRoller+=tRoller;
                     out.print("<tr>");
                     out.print("<td>Roller-"+rol+"</td>");
                     out.print("<td>Rp</td>");
                     out.print("<td align='right'>"+nf.format(tRoller)+"</td>");
                     out.print("</tr>");
                    }
                    
                    out.print("<tr>");
                    out.print("<td>Total</td>");
                    out.print("<td>Rp</td>");
                    out.print("<td>"+nf.format(totWhite+totPasta+totRoller)+"</td>");
                    out.print("</tr>");
                    
              }
              else if(op==2){
                  String q="select * from dink where dfinish_id='"+id+"'";
                  ResultSet rq=c.GetData(q);
                  rq.next();
                  int in=rq.getInt("ink_id");
                  String det="select * from inkDetail join items on inkDetail.items_id=items.items_id where detail_id='"+in+"'";
                  ResultSet ri=c.GetData(det);
                  while(ri.next()){
                      Double tInk=ri.getDouble("price");
                      totInk+=tInk;
                      out.print("<tr>");
                      out.print("<td>"+ri.getString("items_desc")+"</td>");
                      out.print("<td>Rp</td>");
                      out.print("<td align='right'>"+nf.format(tInk)+"</td>");                      
                      out.print("</tr>");
                      
                  }
                    out.print("<tr>");
                    out.print("<td>Total</td>");
                    out.print("<td>Rp</td>");
                    out.print("<td>"+nf.format(totWhite+totInk)+"</td>");
                    out.print("</tr>");
              }
           %>
                </table>
               
                
                

              
           
            </td>
        </tr><%}%>
    </tbody>
    
</table>
            </div>
     </div>
    
</div>
   <div style="margin-right: 300px"> 
   <input type="button" value="Print Data" onclick="jQuery('#example').print()" />
   </div>