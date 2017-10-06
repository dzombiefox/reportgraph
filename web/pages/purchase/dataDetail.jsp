<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    int n=0;
connect c=new connect();
String kode=request.getParameter("kode");
String detail=request.getParameter("detail");
String query="select* from detail_purchase join category on detail_purchase.category_id=category.category_id and no_po='"+kode+"'  ";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
    n++;
    String status;
    
String no=Integer.toString(n);
Float  cusd=rs.getFloat("usd");
Float  crusd=rs.getFloat("rate_usd");
Float  cidr=rs.getFloat("idr");
Float  ceidr=rs.getFloat("eqr_idr");
Float  cest=rs.getFloat("estimation");
NumberFormat nf = NumberFormat.getInstance();
String musd =nf.format(cusd);
String mrusd =nf.format(crusd);
String midr =nf.format(cidr);
String meidr =nf.format(ceidr);
String mest =nf.format(cest);
int sta=rs.getInt("status");
if(sta==0){
    status="<span class='mif-cross fg-red'>&nbsp;Fake</span>";
}
else{
  status="<span class='mif-checkmark fg-green'>&nbsp;Real</span>";
}
String[] value = {
rs.getString("category_name"),
musd,
midr,
mrusd,
meidr,
mest,
status
};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
