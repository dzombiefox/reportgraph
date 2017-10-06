<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script>     
   /* $("#tablePasta tr").click(function() {
    var checkbox = $(this).find("input[type='checkbox']");
		checkbox.attr('checked', !checkbox.attr('checked'));
});
*/
   
</script>
 <input type="hidden" value="<%=session.getAttribute("id")%>"  id="id">
 <fieldset>
     <legend><strong>Data Pasta</strong></legend>
                <table id="tablePasta"  class="table condensed border bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
						<th>NO</th>
                                               
                                                <th>Date</th>
						<th>Pasta Name</th>
						<th>Pasta</th>
                                                <th>Size</th>
                                                <th>Color</th>
                                                 <th style="width: 1%"><span class="mif-checkmark"></span></th>
                                             
                                               
            </tr>
        </thead>
 
     
 
        <tbody>
            
            <%
            //String periode=request.getParameter("periode");
            int no=1;
            connect c=new connect();
            
    String q="select p.detail_id,p.pasta_id,p.date,p.name,p.opt,s.size,c.name as color from  pasta p join size s on p.size_id=s.size_id  join color c on p.color_id=c.color_id";
    ResultSet rs=c.GetData(q);
    
    while(rs.next()){
                                                %>
                                                 <tr class="gradeX">
        <td style="width: 5%"><% out.print(no); %></td>                                    
        <td><% out.print(rs.getString("date")); %></td>
<td><% out.print(rs.getString("name")); %></td>
<td><% out.print(rs.getString("opt")); %></td>      
<td><% out.print(rs.getString("size")); %></td>   
<td><% out.print(rs.getString("color")); %></td>  
 <td><input type="checkbox" name="categories" value='<% out.print(rs.getString("detail_id")); %>' class="dPasta" ></td>
     <% no++;}%>
                                                 </tr>
        </tbody>
         
    </table>
 </fieldset>
                                                 
  <br>
  <fieldset>
      <legend><strong>Data Roller</strong></legend>
  <table id="tableRoller" cellspacing="0" width="100%" class="table bordered condensed border">
        <thead>
            <tr>
						<th>NO</th>                                                
                                                <th>Roller Code</th>
						<th>Roller Name</th>
						<th>Motiv</th>
                                                <th>Sub Code</th>      
                                                <th>Life Time</th>
						<th>Price</th>
                                                <th>Price per print</th>     
                                                <th style="width: 1%"><span class="mif-checkmark"></span></th>
                                              </tr>
        </thead>  
     <tbody>            
            <%
                                               
                 int n=1;                              
    String que="select * from mroller";
    ResultSet rst=c.GetData(que);    
    while(rst.next()){
                                                %>
                                                 <tr class="gradeX">
        <td style="width: 5%"><% out.print(n); %></td>                                   
       <td><% out.print(rst.getString("code")); %></td>
<td><% out.print(rst.getString("name")); %></td>
<td><% out.print(rst.getString("motif")); %></td>      
<td><% out.print(rst.getString("subCode")); %></td>    
<td><% out.print(rst.getString("life")); %></td>
<td><% out.print(rst.getString("price")); %></td>
<td><% out.print(rst.getString("priceCalc")); %></td>      
 <td><input type="checkbox" name="categories" value='<% out.print(rst.getString("mroller_id")); %>' class="dRoller"></td>
     <% n++;}%>
                                                 </tr>
        </tbody>
         
    </table>      
                                               
  </fieldset>