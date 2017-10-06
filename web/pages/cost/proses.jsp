<%@page import="grafik.coba"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
coba cb=new coba();
 String nama=request.getParameter("nama");
 String id=request.getParameter("id");
String action=request.getParameter("action");
int ac=Integer.parseInt(action);
if(ac==1){ 
    cb.saveData(nama);
}
else if(ac==2){
 cb.updateData(id, nama);
}
else if(ac==3){
cb.delete(1);
}
%>