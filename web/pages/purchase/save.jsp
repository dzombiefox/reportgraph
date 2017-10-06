<%@page import="config.connect"%>
<%
connect c=new connect();
String motif=request.getParameter("motif");
String kode=request.getParameter("kode");
String tanggal=request.getParameter("tanggal");
String qty=request.getParameter("qty");
String kontainer=request.getParameter("kontainer");
String us=request.getParameter("us");
String m2=request.getParameter("m2");
String kurs=request.getParameter("kurs");
String query="insert into purchase(motif_id,tanggal,no_po,qty_received,container,m2,usd,kurs,kci_depo,sales_cost)values('"+motif+"','"+tanggal+"','"+kode+"','"+qty+"','"+kontainer+"','"+m2+"','"+us+"','"+kurs+"','0','0')";
c.ManipulasiData(query);
out.print(kode);
%>