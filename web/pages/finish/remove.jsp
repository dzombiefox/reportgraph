<%@page import="java.sql.ResultSet"%>
<%@page import="formula.roller"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String qu="select opt from finish where dfinish_id='"+id+"'";
ResultSet r=c.GetData(qu);
r.next();
int opt=r.getInt("opt");
if(opt==0){
String query="delete from finish where dfinish_id='"+id+"'";
c.ManipulasiData(query);
}
else if(opt==1){
String query="delete from finish where dfinish_id='"+id+"'";
c.ManipulasiData(query);
String removePasta="delete from dpasta where dfinish_id='"+id+"'";
c.ManipulasiData(removePasta);
String removeRoller="delete from droller where dfinish_id='"+id+"'";
c.ManipulasiData(removeRoller);
}
else{
String query="delete from finish where dfinish_id='"+id+"'";
c.ManipulasiData(query);
String removeInk="delete from dink where dfinish_id='"+id+"'";
c.ManipulasiData(removeInk);
}


%>
