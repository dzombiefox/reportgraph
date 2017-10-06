<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script>     
  /*  $("#tableInk tr").click(function() {
    var checkbox = $(this).find("input[type='checkbox']");
		checkbox.attr('checked', !checkbox.attr('checked'));
}); */  
</script>
<style>
   
</style>



         <input type="hidden" value="<%=session.getAttribute("id")%>"  id="id">
         <fieldset>
             <legend><strong>Data Digital Ink</strong></legend>
                <table id="tableInk" class="table condensed border bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
						<th>NO</th>                                               
                                                <th>Date</th>
						<th>Name</th>
						<th>Size</th>
                                                <th>Color</th>
                                                <th style="width: 1%"><span class="mif-checkmark"></span></th>
                                             
                                               
            </tr>
        </thead>
 
     
 
        <tbody>
            
            <%
            String periode=request.getParameter("periode");
            String color=request.getParameter("color");
                                                int no=1;
                                                 connect c=new connect();
    String q="select i.detail_id,i.ink_id,i.name,i.date,s.size,c.name as color from ink i join size s on i.size_id=s.size_id join color c on i.color_id=c.color_id where i.periode='"+periode+"' ";
    ResultSet rs=c.GetData(q);
    
    while(rs.next()){
                                                %>
                                                 <tr class="gradeX">
        <td style="width: 5%"><% out.print(no); %></td>                                    
       
<td><% out.print(rs.getString("date")); %></td>
<td><% out.print(rs.getString("name")); %></td>
<td><% out.print(rs.getString("size")); %></td>      
<td><% out.print(rs.getString("color")); %></td>   
<td><input type="checkbox" name="categories" value='<% out.print(rs.getString("detail_id")); %>'  class="dInk" ></td>
     <% no++;}%>
                                                 </tr>
        </tbody>
         
    </table>
         </fieldset>