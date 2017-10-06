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
int rowroller=Integer.parseInt(jsonObj.get("rowroller").toString());
int idetail=f.getDetailId();
if(idetail==0 || idetail==1){
idetail=f.getDetailId()+1;
}
else{
idetail=f.getDetailId()-1;
}
for(int i=0;i<=rowroller;i++){
JSONArray ar= (JSONArray) jsonObj.get("dataRollers");
JSONObject fr = (JSONObject) ar.get(i);
String id=fr.get("id").toString();
String query="insert into droller(dfinish_id,roller_id)values('"+finish+"','"+id+"')";
c.ManipulasiData(query);
}


%>