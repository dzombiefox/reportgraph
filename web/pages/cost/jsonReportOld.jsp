<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    int n=0;
connect c=new connect();
String query="select * from reportOld join line on reportOld.line_id=line.line_id";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
    int decimalPlace = 0; 
    DecimalFormat df = new DecimalFormat(".##");
Double sch=rs.getDouble("sch");
Double kw1=rs.getDouble("kw1");
Double kw2=rs.getDouble("kw2");
Double kw3=rs.getDouble("kw3");
Double kw4=rs.getDouble("kw4");
Double kw5=rs.getDouble("kw5");
Double qty=kw1+kw2+kw3+kw4+kw5;
double pqty=Math.round((qty/sch)*100);
double pkw1=Math.round((kw1/qty)*100);
double pkw2=Math.round((kw2/qty)*100);
double pkw3=Math.round((kw3/qty)*100);
double pkw4=Math.round((kw4/qty)*100);
double pkw5=Math.round((kw5/qty)*100);




//String tqty=Float.toString(pqty);

NumberFormat nf = NumberFormat.getInstance();
String msch =nf.format(sch)+" (100%)";
String mkw1=nf.format(kw1)+" ("+nf.format(pkw1)+"%)";
String mkw2=nf.format(kw2)+" ("+nf.format(pkw2)+"%)";
String mkw3=nf.format(kw3)+" ("+nf.format(pkw3)+"%)";
String mkw4=nf.format(kw4)+" ("+nf.format(pkw4)+"%)";
String mkw5=nf.format(kw5)+" ("+nf.format(pkw5)+"%)";
String mqty=nf.format(qty);
String mpqty=nf.format(pqty)+"%";
String cod=rs.getString("item_code");
cod=cod.replace("<", "&lt");
        
n++;
String no=Integer.toString(n);
String[] value = {
    no,
    rs.getString("report_id"),
    rs.getString("date"),
    cod,
    rs.getString("line_name"),
    msch,
    mqty+" ("+mpqty+")",
    mkw1,
    mkw2,
    mkw3,
    mkw4,
    mkw5
   
    
};
 js.put(value);
 
 }

json.put("aaData", js);
 out.print(json);
%>
