<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="formula.finish"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
finish f=new finish();
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String tanggal=dateFormat.format(date);
String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
        String finish=jsonObj.get("finish").toString();
        f.setMotif(Integer.parseInt(jsonObj.get("motif").toString()));
        f.setSize(Integer.parseInt(jsonObj.get("size").toString()));
        f.setPeriode(Integer.parseInt(jsonObj.get("periode").toString()));
        f.setColor(Integer.parseInt(jsonObj.get("color").toString()));
        f.setOpt(0);
        f.setBody(Integer.parseInt(jsonObj.get("body").toString()));
        f.setAlumina(Integer.parseInt(jsonObj.get("alumina").toString()));
        f.setEngobe(Integer.parseInt(jsonObj.get("engobe").toString()));
        f.setGlaze(Integer.parseInt(jsonObj.get("glaze").toString()));
        f.setDrop(Integer.parseInt(jsonObj.get("drop").toString()));
   String ref=jsonObj.get("ref").toString();        
String brand=f.getBrandCode(f.getMotif());
String size=f.getSizeCode(f.getSize());
String codeMotif=f.getMotivCode(f.getMotif());

String code=brand+size+codeMotif+ref+"LWH";

     
String que="insert into finish(date,item_code,motif_id,size_id,periode_id,color_id,opt,body_id,alumina_id,engobe_id,glaze_id,drop_id,dfinish_id)values"
        + "('"+tanggal+"','"+code+"','"+f.getMotif()+"','"+f.getSize()+"','"+f.getPeriode()+"','"+f.getColor()+"','"+f.getOpt()+"','"+f.getBody()+"','"+f.getAlumina()+"','"+f.getEngobe()+"','"+f.getGlaze()+"','"+f.getDrop()+"','"+finish+"')";
c.ManipulasiData(que);

out.print(codeMotif);


%>