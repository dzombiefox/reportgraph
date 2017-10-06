<%@page import="config.connect"%>
<%
connect c=new connect();
String choose=request.getParameter("choose");
String qty=request.getParameter("qty");
String kode=request.getParameter("kode");
String category=request.getParameter("category");
String idr=request.getParameter("idr");
String eidr=request.getParameter("eidr");
String usd=request.getParameter("usd");
String rusd=request.getParameter("rusd");
String estimasi=request.getParameter("estimasi");
String est=request.getParameter("est");
String query="insert into  detail_purchase(no_po,category_id,usd,rate_usd,idr,eqr_idr,estimation,status)values('"+kode+"','"+category+"','"+usd+"','"+rusd+"','"+idr+"','"+eidr+"','"+estimasi+"','"+est+"')";
c.ManipulasiData(query);
int ch=Integer.parseInt(choose);
Float q=Float.parseFloat(qty);
Float i=Float.parseFloat(eidr);
Float id=Float.parseFloat(idr);
Float r=Float.parseFloat(rusd);
Float e=Float.parseFloat(estimasi);
if(ch==1){
Float eqf=i/q; //eqv e idr
Float us=eqf/r; //usd
Float es=e/q; //estimation
Float idt=id/q;//total idr
String que="insert into total(tusd,tidr,trusd,teidr,testimation,no_po,category_id,status)values('"+us+"','"+idt+"','0','"+eqf+"','"+es+"','"+kode+"','"+category+"','"+est+"')";
c.ManipulasiData(que);
}
else {
Float tid=id/q;
Float teqf=i/q;
Float test=e/q;
String ch2="insert into total(tusd,tidr,trusd,teidr,testimation,no_po,category_id,status)values('0','"+tid+"','0','"+teqf+"','"+test+"','"+kode+"','"+category+"','"+est+"')";
c.ManipulasiData(ch2);
}
/*

*/%>