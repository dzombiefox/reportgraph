<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<style type="text/css">
    #wrap {
      overflow: hidden;
    }
    .box {
      width: 20%;
      padding-bottom: 20%;
      color: olive;
      position: relative;
      float: left;
    }
    .innerContent {
      position: absolute;
      left: 1px;
      right: 1px;
      top: 1px;
      bottom: 1px;
      background:  inherit;
      padding: 10px;
      
    }
   div.desc {
    padding: 15px;
    text-align: center;
}
 img {
    width: 100%;
    height: 80%;
}
  </style>





  
  
  <div id="wrap">
  <%
  connect c=new connect();
  String query="select * from rmotif where image IS NOT NULL";
  ResultSet rs=c.GetData(query);
  while(rs.next()){
  String path="motif/image/"+rs.getString("image");
  String name=rs.getString("name");
  String servletPath = request.getServletPath();
  String realPath = request.getSession().getServletContext().getRealPath(path);
  %>
      <div class="box">
      <div class="innerContent">         
      <img src="<%=path%>"  />
      <div class="desc"><%=name%></div>
      </div>
    </div>
    <%}%>
  </div>
  

 
        

