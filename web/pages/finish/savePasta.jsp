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
        f.setOpt(Integer.parseInt(jsonObj.get("option").toString()));
        f.setBody(Integer.parseInt(jsonObj.get("body").toString()));
        f.setAlumina(Integer.parseInt(jsonObj.get("alumina").toString()));
        f.setEngobe(Integer.parseInt(jsonObj.get("engobe").toString()));
        f.setGlaze(Integer.parseInt(jsonObj.get("glaze").toString()));
        f.setDrop(Integer.parseInt(jsonObj.get("drop").toString()));
        int rowpasta=Integer.parseInt(jsonObj.get("rowpasta").toString());
        int rowroller=Integer.parseInt(jsonObj.get("rowroller").toString());
        int idetail=f.getDetailId();
        String ref=jsonObj.get("ref").toString();  
String brand=f.getBrandCode(f.getMotif());
String size=f.getSizeCode(f.getSize());
String codeMotif=f.getMotivCode(f.getMotif());
String color=f.getColorCode(f.getColor());
String code=brand+size+codeMotif+ref+color;
String que="insert into finish(date,item_code,motif_id,size_id,periode_id,color_id,opt,body_id,alumina_id,engobe_id,glaze_id,drop_id,dfinish_id)values"
        + "('"+tanggal+"','"+code+"','"+f.getMotif()+"','"+f.getSize()+"','"+f.getPeriode()+"','"+f.getColor()+"','"+f.getOpt()+"','"+f.getBody()+"','"+f.getAlumina()+"','"+f.getEngobe()+"','"+f.getGlaze()+"','"+f.getDrop()+"','"+finish+"')";
c.ManipulasiData(que);
        for(int i=0;i<=rowpasta;i++){
                JSONArray ar= (JSONArray) jsonObj.get("dataPastas");
                JSONObject fr = (JSONObject) ar.get(i);
                String id=fr.get("id").toString();
                String query="insert into dpasta(dfinish_id,pasta_id)values('"+finish+"','"+id+"')";
                c.ManipulasiData(query);
        }


%>