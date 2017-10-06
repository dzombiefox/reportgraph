<style>
    input:required {
    box-shadow:none !important;
}
input:invalid {
    box-shadow:0 0 1px blue;
}
</style>
<script>
    $(document).ready(function(){
        
        $("form#data").submit(function(){
        var data=$("#data").serialize();
        alert(data);
        $.ajax({
        url: "hpp/save.jsp",       
        data: $("#data").serialize(),
        async: false,
        success: function (data) {
            $("#data").trigger('reset');
        },
        cache: false,
        contentType: false,
        processData: false
    });

    return false;
});
         $("#size").select2();
                var data,size; 
         $("#brand").select2({
              //  placeholderOption: 'first'
        });
   
        $.getJSON("jsonData/jsonBrand.jsp",function(data){  
          
       $.each(data,function(index,item)      
    {
      data+="<option value='"+item.id+"'>"+item.name+"</option>";
     
    });
    $("#brand").html(data);  
    
    });  
    $.getJSON("jsonData/jsonSize.jsp",function(data){
         $.each(data,function(index,item) 
    {
      size+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#size").html(size); 
      });
    
           
    });
</script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Finish</a></li>
    <li><a href="#">Create Cost Production</a></li>
</ul>  
<hr class="thin bg-grayLighter">  
  <div id="wrapper">
        <input type="hidden" value="<%=session.getAttribute("id")%>"  id="id">
        <div class="example" data-text="Form Create Cost Production">
            <form id="data" method="post"  >
        <table style="width: 100%"  >
        <tr>
            <td >Brand</td>
          <td width="35%">
              <select id="brand" style="width: 100%" name="brand"><option>Select Brand</option></select>
              
          </td>
          
          <td>&nbsp;</td>
          <td> HPP Kw1 </td>
          <td >
               <div class="input-control text full-size"> <input type="number" name="hkw1" id="hkw1" style="width: 100%" class="input" required ></div>
          </td>
        </tr>
           <tr>
          <td >Size</td>
          <td >
              <select id="size" style="width: 100%" name="size">  <option>Select Size</option></select>
              
          </td>
          <td>&nbsp;</td>
          <td>HPP Kw2  </td>
          <td >
              <div class="input-control text full-size"> <input type="number" name="hkw2" id="hkw2" style="width: 100%" class="input" required ></div>
          </td>
        </tr>
        <tr>
            <td >Carton Box</td>
          
            <td >
                    <div class="input-control text full-size"> <input type="number" name="cbox" id="cbox" style="width: 100%" class="input"required ></div>
         </td>
<td>&nbsp;</td>
<td>HPP KW3</td>
<td >
        <div class="input-control text full-size"> <input type="number" name="hkw3" id="hkw3" style="width: 100%" class="input" required ></div>
</td>
        </tr>
        
           <tr>
            <td>Direct Labour</td>
          
            <td>
                    <div class="input-control text full-size"> <input type="number" name="dlabour" id="dlabour" style="width: 100%" class="input"  required></div>
 </td>
<td>&nbsp;</td>
<td>HPP KW4</td>
<td>
        <div class="input-control text full-size"> <input type="number" name="hkw4" id="hkw4" style="width: 100%" class="input" required></div>
        </tr>
        
   <tr>
            <td>Mfg Overhead</td>
          
            <td>
            <div class="input-control text full-size"> <input type="number" name="ohead" id="ohead" style="width: 100%" class="input" required></div>
                </td>
<td>&nbsp;</td>
<td>HPP KW5</td>
<td>
        <div class="input-control text full-size"> <input type="number" name="hkw5" id="hkw5" style="width: 100%" class="input" required></div>
</td>
        </tr> 
           <tr>
            <td>Sales Disc %</td>
          
            <td>
<div class="input-control text full-size"> <input type="number" name="sdisc"  id="sdisc" required></div>

</td>
<td></td>
<td>SELL KW1</td>
<td>
<div class="input-control text full-size"> <input type="number" name="skw1" id="skw1" style="width: 100%" class="input" required ></div>

</td>
        </tr> 
         
   
                   <tr>
            <td>Fix Opr Exp</td>
          
            <td>
<div class="input-control text full-size"> <input type="number" name="opexp" id ="opexp"  required></div>

</td>
<td></td>
<td>SELL KW2</td>
<td>
<div class="input-control text full-size"> <input type="number" name="skw2" id="skw2" style="width: 100%" class="input" required ></div>

</td>
        </tr> 
        <tr>
            <td>Carriage Charge</td>
          
            <td>
<div class="input-control text full-size"> <input type="number" name="ccharge" id="ccharge" required ></div>

</td>
<td></td>
<td>SELL KW3</td>
<td>
<div class="input-control text full-size"> <input type="number" name="skw3" id="skw3" style="width: 100%" class="input" required ></div>

</td>
        </tr> 
     <tr>
            <td>Percent Kw1 %</td>
          
            <td>
<div class="input-control text full-size"> <input type="number" name="pkw1"  id="pkw1" required></div>

</td>
<td></td>
<td>SELL KW4</td>
<td>
<div class="input-control text full-size"> <input type="number" name="skw4" id="skw4" style="width: 100%" class="input" required></div>

</td>
        </tr> 
       <tr>
            <td>Marketing Exp</td>
          
            <td>
<div class="input-control text full-size"> <input type="number" name="mexp" id="mexp" required></div>

</td>
<td></td>
<td>SELL KW5</td>
<td>
<div class="input-control text full-size"> <input type="number" name="skw5" id="skw5" style="width: 100%" class="input" required></div>

</td>
        </tr>  
      
          <tr>
            <td></td>
          
            <td></td>
            <td>&nbsp;</td>
<td></td>
<td>
    
    <input type="reset" value="Reset" />&nbsp;<input type="submit" value="save" class="primary " >
</td>
        </tr>
    </table> 
                
            </form>      
</div>

