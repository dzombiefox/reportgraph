 <%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="config.connect"%>
<%  

        connect c=new connect();
        String jsonString = request.getParameter("data");        
        JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
        String name=jsonObj.get("name").toString();
        String id=jsonObj.get("id").toString();
        String tanggal=jsonObj.get("tanggal").toString();
        String persen=jsonObj.get("persen").toString();
        String kw1=jsonObj.get("kw1").toString();
        String hpp1=jsonObj.get("hpp1").toString();
        String sell1=jsonObj.get("sell1").toString();        
        String kw2=jsonObj.get("kw2").toString();
        String hpp2=jsonObj.get("hpp2").toString();
        String sell2=jsonObj.get("sell2").toString();        
        String kw3=jsonObj.get("kw3").toString();
        String hpp3=jsonObj.get("hpp3").toString();
        String sell3=jsonObj.get("sell3").toString();        
        String kw4=jsonObj.get("kw4").toString();
        String hpp4=jsonObj.get("hpp4").toString();
        String sell4=jsonObj.get("sell4").toString();       
        String kw5=jsonObj.get("kw5").toString();
        String hpp5=jsonObj.get("hpp5").toString();
        String sell5=jsonObj.get("sell5").toString();
        String query="update report set date='"+tanggal+"',persen_id='"+persen+"',kw1='"+kw1+"',hpp_1='"+hpp1+"',sell_1='"+sell1+"',kw2='"+kw2+"',hpp_2='"+hpp2+"',sell_2='"+sell2+"',kw3='"+kw3+"',hpp_3='"+hpp3+"',sell_3='"+sell3+"',kw4='"+kw4+"',hpp_4='"+hpp4+"',sell_4='"+sell4+"',kw5='"+kw5+"',hpp_5='"+hpp5+"',sell_5='"+sell5+"' where report_id='"+id+"' ";
        c.ManipulasiData(query);
    
       
%>