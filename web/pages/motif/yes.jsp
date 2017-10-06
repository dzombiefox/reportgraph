<script>
     function printDiv(divID) {
    var printContent = document.getElementById(divID);
    var windowUrl = '';
    var uniqueName = new Date();
    var windowName = 'Print' ;
    var printWindow = window.open(windowUrl, windowName, 'left=-20,top=-20,width=800px,height=600px');
    printWindow.document.write("<HTML><Head><Title></Title><link rel='stylesheet' type='text/css' href='/Style%20Library/CarBookingCSS.txt' media='print' />");
    printWindow.document.write("</Head><Body style='margin-left:10px;margin-top:0px;font-weight:bold'>");
    printWindow.document.write(printContent.innerHTML);
    printWindow.document.write('</Body></HTML>');
    printWindow.document.close();
    printWindow.focus();
    //Print Page
    setTimeout(function () { print_page(); }, 1000);
    function print_page() {
        printWindow.print();
    }

    //Restore orignal HTML
    setTimeout(function () { restore_page(); }, 6000);
    function restore_page() {    
        printWindow.close();
    }
}
</script>
<input onclick="printDiv('page_printer');" type="button" value="Print" />
<table id="page_printer">
    <tr>
        <td>
        <fieldset class="box">
                <legend class="text_transportation">EMPLOYEE GATE PASS</legend>
            <table>
                <tr>
                    <td width="190px" valign="top" class="ms-formlabel">
                        <H3 class="ms-standardheader">
                            <nobr>Date</nobr>
                        </H3>
                    </td>
                    <td width="400px" valign="top" class="ms-formbody">
                        <div>2014</div>
                    </td>
                </tr>
                <tr>
                    <td width="190px" valign="top" class="ms-formlabel">
                        <H3 class="ms-standardheader">
                            <nobr>Requester</nobr>
                        </H3>
                    </td>
                    <td width="400px" valign="top" class="ms-formbody">
                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="190px" valign="top" class="ms-formlabel">
                        <H3 class="ms-standardheader">
                            <nobr>Place From</nobr>
                        </H3>
                    </td>
                    <td width="400px" valign="top" class="ms-formbody">
                        <div>P1</div>
                    </td>
                </tr>
                <tr>
                    <td width="190px" valign="top" class="ms-formlabel">
                        <H3 class="ms-standardheader">
                            <nobr>Place To</nobr>
                        </H3>
                    </td>
                    <td width="400px" valign="top" class="ms-formbody">
                        <div>P3</div>
                    </td>
                </tr>
                <tr>
                    <td width="190px" valign="top" class="ms-formlabel">
                        <H3 class="ms-standardheader">
                            <nobr>Purpose</nobr>
                        </H3>
                    </td>
                    <td width="400px" valign="top" class="ms-formbody">
                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td width="190px" valign="top" class="ms-formlabel">
                        <H3 class="ms-standardheader">
                            <nobr>Business date - From</nobr>
                        </H3>
                    </td>
                    <td width="400px" valign="top" class="ms-formbody">
                        <div>2014</div>
                    </td>
                </tr>
                <tr>
                    <td width="190px" valign="top" class="ms-formlabel">
                        <H3 class="ms-standardheader">
                            <nobr>Business date - To</nobr>
                        </H3>
                    </td>
                    <td width="400px" valign="top" class="ms-formbody">
                        <div>2014</div>
                    </td>
                </tr>
            </table>
        </fieldset>
        </td>
    </tr>
</table>