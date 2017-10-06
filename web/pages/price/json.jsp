<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    int n=0;
connect c=new connect();
String query="select p.*,r.name as motif,b.name as brand,l.line_name from prices p LEFT join rmotif r on p.motif_id=r.rmotif_id LEFT join brand b on p.brand_id=b.brand_id LEFT join persen  per on p.persen_id=per.persen_id LEFT join line l on per.line_id=l.line_id";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
n++;
String periode=rs.getString("periode")+" "+rs.getString("year");
String no=Integer.toString(n);
String line=rs.getString("line_name");
Float  chkw1=rs.getFloat("hpp_kw1");
Float  chkw2=rs.getFloat("hpp_kw2");
Float  chkw3=rs.getFloat("hpp_kw3");
Float  chkw4=rs.getFloat("hpp_kw4");
Float  chkw5=rs.getFloat("hpp_kw5");
Float  chkw6=rs.getFloat("hpp_kw6");
Float  cskw1=rs.getFloat("sell_kw1");
Float  cskw2=rs.getFloat("sell_kw2");
Float  cskw3=rs.getFloat("sell_kw3");
Float  cskw4=rs.getFloat("sell_kw4");
Float  cskw5=rs.getFloat("sell_kw5");
Float  cskw6=rs.getFloat("sell_kw6");
NumberFormat nf = NumberFormat.getInstance();
String mchkw1 =nf.format(chkw1);
String mchkw2 =nf.format(chkw2);
String mchkw3 =nf.format(chkw3);
String mchkw4 =nf.format(chkw4);
String mchkw5 =nf.format(chkw5);
String mchkw6 =nf.format(chkw6);
String mskw1 =nf.format(cskw1);
String mskw2 =nf.format(cskw2);
String mskw3 =nf.format(cskw3);
String mskw4 =nf.format(cskw4);
String mskw5 =nf.format(cskw5);
String mskw6 =nf.format(cskw6);
String cod=rs.getString("item_code");
cod=cod.replace("<", "&lt");

String[] value = {
no,
rs.getString("prices_id"),
rs.getString("item_name"),
cod,
rs.getString("motif"),
rs.getString("brand"),
mchkw1,
mchkw2,
mchkw3,
mchkw4,
mchkw5,
mchkw6,
mskw1,
mskw2,
mskw3,
mskw4,
mskw5,
mskw6,
line,
periode

};
 js.put(value);
 }
json.put("aaData", js);
out.print(json.toString());
%>
