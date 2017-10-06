<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
JSONArray userArray = new JSONArray();      
String jsons=null;
String id=request.getParameter("id");

String query="select COALESCE(p.persen_id, 0 )as persen_id ,COALESCE(s.size, '-' )as size,COALESCE(l.line_name,'-')as line_name,COALESCE(t.name,'-') AS type,pr.prices_id,pr.item_name,pr.item_code,r.name as motif,b.name as brand ,pr.hpp_kw1,pr.hpp_kw2,pr.hpp_kw3,pr.hpp_kw4,pr.hpp_kw5,pr.hpp_kw6,pr.sell_kw1,pr.sell_kw2,pr.sell_kw3,pr.sell_kw4,pr.sell_kw5,pr.sell_kw6 from prices pr left join persen p on pr.persen_id=p.persen_id left join size s on s.size_id=p.size_id  left join line l on p.line_id=l.line_id left join type t on p.type_id=t.type_id left join rmotif r on pr.motif_id=r.rmotif_id left join brand b on pr.brand_id=b.brand_id where prices_id='"+id+"'";
ResultSet rs=c.GetData(query);
rs.next();
 String[] value = { rs.getString("prices_id"),rs.getString("item_name"),rs.getString("item_code"),rs.getString("motif"),rs.getString("brand"),rs.getString("persen_id"),rs.getString("line_name"),rs.getString("type"),rs.getString("size"),rs.getString("hpp_kw1"),rs.getString("hpp_kw2"),rs.getString("hpp_kw3"),rs.getString("hpp_kw4"),rs.getString("hpp_kw5"),rs.getString("hpp_kw6"),rs.getString("sell_kw1"),rs.getString("sell_kw2"),rs.getString("sell_kw3"),rs.getString("sell_kw4"),rs.getString("sell_kw5"),rs.getString("sell_kw6")};
 String[] key={"price_id","item_name","item_code","motif","brand","persenid","line","type","size","hpp1","hpp2","hpp3","hpp4","hpp5","hpp6","sell1","sell2","sell3","sell4","sell5","sell6"};
 userArray.add(new pushData(key, value));
 StringWriter hasil = new StringWriter();        
            userArray.writeJSONString(hasil);
            jsons = hasil.toString();
            out.print(jsons.substring(1, jsons.length()-1));
            
%>