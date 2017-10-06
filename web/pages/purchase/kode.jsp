
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
  
    <script type="text/javascript">
        $(document).ready(function() {
            $('#btnHide').click(function() {
                $('td:nth-child(2)').hide();
                // if your table has header(th), use this
                //$('td:nth-child(2),th:nth-child(2)').hide();
            });
              $('#show').click(function() {
                $('td:nth-child(1)').toggle();
                // if your table has header(th), use this
                //$('td:nth-child(2),th:nth-child(2)').hide();
            });
        });
    </script>
</head>
<body>
<table id="tableone" border="1">
    <tr class="del">
        <td>Row 0 Column 0</td>
        <td >Row 0 Column 1</td>
        <td >Row 0 Column 2</td>
    </tr>
    <tr class="del">
        <td>Row 1 Column 0</td>
        <td>Row 1 Column 1</td>
        <td>Row 1 Column 2</td>
    </tr>
    <tr class="del">
        <td>Row 2 Column 0</td>
        <td>Row 2 Column 1</td>
        <td>Row 2 Column 2</td>
    </tr>
    <tr class="del">
        <td>Row 3 Column 0</td>
        <td>Row 3 Column 1</td>
        <td>Row 3 Column 2</td>
    </tr>
     <tr class="del">
        <td>Row 4 Column 0</td>
        <td>Row 4 Column 1</td>
        <td>Row 4 Column 2</td>
    </tr>
     <tr class="del">
        <td>Row 5 Column 0</td>
        <td>Row 5 Column 1</td>
        <td>Row 5 Column 2</td>
    </tr>
</table>
    <input id="btnHide" type="button" value="Hide Column 2"/>
 <input id="show" type="button" value="show Column 2"/>
</body>
</html>