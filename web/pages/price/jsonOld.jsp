<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    int n=0;
connect c=new connect();
String query="select * from priceOld";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
n++;
String no=Integer.toString(n);
Float  chkw1=rs.getFloat("hpp_kw1");
Float  chkw2=rs.getFloat("hpp_kw2");
Float  chkw3=rs.getFloat("hpp_kw3");
Float  chkw4=rs.getFloat("hpp_kw4");
Float  chkw5=rs.getFloat("hpp_kw5");
Float  cskw1=rs.getFloat("sell_kw1");
Float  cskw2=rs.getFloat("sell_kw2");
Float  cskw3=rs.getFloat("sell_kw3");
Float  cskw4=rs.getFloat("sell_kw4");
Float  cskw5=rs.getFloat("sell_kw5");
NumberFormat nf = NumberFormat.getInstance();
String mchkw1 =nf.format(chkw1);
String mchkw2 =nf.format(chkw2);
String mchkw3 =nf.format(chkw3);
String mchkw4 =nf.format(chkw4);
String mchkw5 =nf.format(chkw5);
String mskw1 =nf.format(cskw1);
String mskw2 =nf.format(cskw2);
String mskw3 =nf.format(cskw3);
String mskw4 =nf.format(cskw4);
String mskw5 =nf.format(cskw5);
String cod=rs.getString("item_code");
cod=cod.replace("<", "&lt");

String[] value = {
no,
rs.getString("price_id"),

cod,
mchkw1,
mchkw2,
mchkw3,
mchkw4,
mchkw5,
mskw1,
mskw2,
mskw3,
mskw4,
mskw5

};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
