<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String jsonString = request.getParameter("data");        
        JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
        String id=jsonObj.get("id").toString();   
        String name=jsonObj.get("nama").toString();       
String kode=jsonObj.get("kode").toString();
String motif=jsonObj.get("motif").toString();
String brand=jsonObj.get("brand").toString();
String hpp1=jsonObj.get("hpp1").toString();
String hpp2=jsonObj.get("hpp2").toString();
String hpp3=jsonObj.get("hpp3").toString();
String hpp4=jsonObj.get("hpp4").toString();
String hpp5=jsonObj.get("hpp5").toString();
String hpp6=jsonObj.get("hpp6").toString();
String sell1=jsonObj.get("sell1").toString();
String sell2=jsonObj.get("sell2").toString();
String sell3=jsonObj.get("sell3").toString();
String sell4=jsonObj.get("sell4").toString();
String sell5=jsonObj.get("sell5").toString();
String sell6=jsonObj.get("sell6").toString();
String target=jsonObj.get("target").toString();
String query="update prices set item_name='"+name+"',item_code='"+kode+"',motif_id='"+motif+"',brand_id='"+brand+"',hpp_kw1='"+hpp1+"',hpp_kw2='"+hpp2+"',hpp_kw3='"+hpp3+"',hpp_kw4='"+hpp4+"',hpp_kw5='"+hpp5+"',hpp_kw6='"+hpp6+"',sell_kw1='"+sell1+"',sell_kw2='"+sell2+"',sell_kw3='"+sell3+"',sell_kw4='"+sell4+"',sell_kw5='"+sell5+"',sell_kw6='"+sell6+"',persen_id='"+target+"' where prices_id='"+id+"' ";
c.ManipulasiData(query);
%>

