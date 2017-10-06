<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%
    DecimalFormat formatData = new DecimalFormat("#.###");
String has="10.01";
String angka="";
int x=has.indexOf('.');
if(x>0){
String[] pecah = has.split("\\.");
String da=pecah[1];
int leng=da.length();
if(leng==2){
angka=has+"0";
}
else if(leng==1){
angka=has+"00";
}
else{
angka=has;
}
}
else{
angka=has+".000";
}
out.print(angka);
%>