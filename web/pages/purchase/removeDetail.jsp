<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String detail=request.getParameter("detail");
String query="delete from detail_purchase where no_po='"+kode+"' and category_id='"+detail+"'";
c.ManipulasiData(query);
String q="delete from total where no_po='"+kode+"' and category_id='"+detail+"'";
c.ManipulasiData(q);
int cat=Integer.parseInt(detail);
if(cat==1){
String a="update detail set ofreight='0' where no_po='"+kode+"' ";
c.ManipulasiData(a);
}
else if(cat==2){
String b="update detail set control_fee='0' where no_po='"+kode+"' ";
c.ManipulasiData(b);
}
else if(cat==3){
String d="update detail set verification='0' where no_po='"+kode+"' ";
c.ManipulasiData(d);
}
else if(cat==4){
String e="update detail set trucking='0' where no_po='"+kode+"' ";
c.ManipulasiData(e);
}
else if(cat==5){
String f="update detail set custom_fee='0' where no_po='"+kode+"' ";
c.ManipulasiData(f);
}
else if(cat==6){
String g="update detail set loan_interest='0' where no_po='"+kode+"' ";
c.ManipulasiData(g);
}
else if(cat==7){
String h="update detail set other_exp='0' where no_po='"+kode+"' ";
c.ManipulasiData(h);
}

%>
