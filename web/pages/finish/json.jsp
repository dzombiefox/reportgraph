<%@page import="formula.drop"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="formula.roller"%>
<%@page import="formula.pasta"%>
<%@page import="formula.ink"%>
<%@page import="formula.glaze"%>
<%@page import="formula.engobe"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="formula.alumina"%>
<%@page import="formula.body"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%> 
<%
connect c=new connect();
NumberFormat nf=NumberFormat.getInstance();
body b=new body();
alumina a=new alumina();
engobe e=new engobe();
glaze g=new glaze();
ink i=new ink();
pasta p=new pasta();
roller r=new roller();
drop d=new drop();
String query="select bo.choose,f.opt,f.dfinish_id,f.item_code,f.finish_id,f.date,f.body_id,f.alumina_id,f.glaze_id,f.engobe_id,f.drop_id,p.periode ,m.name as motif,b.name as brand ,s.size,c.name as color from finish f JOIN PERIODE p on f.periode_id=p.id JOIN rmotif m on f.motif_id=m.rmotif_id join brand b on m.brand_id=b.brand_id join size s on f.size_id=s.size_id join color c on f.color_id=c.color_id join body bo on f.body_id=bo.detail_id ";
ResultSet rs=c.GetData(query);
int no=0;
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
    no++;
    int body=rs.getInt("body_id");
    int alumina=rs.getInt("alumina_id");
    int engobe=rs.getInt("engobe_id");
    int glaze=rs.getInt("glaze_id");
    int drop=rs.getInt("drop_id");
    int opt=rs.getInt("opt");
    int id=rs.getInt("dfinish_id");  
    String finishId=rs.getString("finish_id");	
    String ch=rs.getString("choose");
    String date=rs.getString("date");
  
    String code=rs.getString("item_code");
    code=code.replace("<", "&lt");
    String periode=rs.getString("periode");
    String motif=rs.getString("motif");
    String brand =rs.getString("brand");
    String color=rs.getString("color");
    String size=rs.getString("size");
    Double cBody=b.getcostDry(body);
    Double cAlumina=a.getCostDry(alumina);
    Double cEngobe=e.getCostDry(engobe);
    Double cGlaze=g.getCostDry(glaze);
    Double cDrop=d.getCostDry(drop);
    Double roller=0.0;
    Double ink=0.0;
    Double pasta=0.0;
    Double total=0.0;
    if(opt==0){        
        total=cBody+cAlumina+cEngobe+cGlaze+cDrop;
    }
    else if(opt==1){
     String que="select * from dpasta where dfinish_id='"+id+"'";
     ResultSet rst=c.GetData(que);
     while(rst.next()){
     Double totPasta=p.getDoubleCostDry(rst.getInt("pasta_id"));
     pasta+=totPasta;
     
     }
     String qu="select * from droller where dfinish_id='"+id+"'";
     ResultSet rslt=c.GetData(qu);
     while(rslt.next()){
     Double totRoller=r.getCostPrint(rslt.getInt("roller_id"));
     roller+=totRoller;     
     }
     total=cBody+cAlumina+cEngobe+cGlaze+pasta+roller+cDrop;
    }
    else if(opt==2){
       String que="select * from dink where dfinish_id='"+id+"'";
       ResultSet rink=c.GetData(que);
       rink.next();
       int ink_id=rink.getInt("ink_id");
       roller=0.0;
       pasta=0.0;
       ink=i.getTotalPrice(ink_id);
       total=cBody+cAlumina+cEngobe+cGlaze+ink+cDrop;
       }
String[] value = {
Integer.toString(no),
Integer.toString(id),
date,
code,

motif+" "+size+" "+color+" ("+ch+")",
brand,
nf.format(cBody),
nf.format(cAlumina),
nf.format(cEngobe),
nf.format(cGlaze),
nf.format(cDrop),
nf.format(pasta),
nf.format(roller),
nf.format(ink),
nf.format(total)
       
       
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString()); 


%>