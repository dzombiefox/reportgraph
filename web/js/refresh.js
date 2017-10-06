    function RefreshTable(tableId, urlData)
{
  $.getJSON(urlData, null, function( json )
  {
   var  table = $(tableId).dataTable();
   var  oSettings = table.fnSettings();    
    table.fnClearTable(this);
    for (var i=0; i<json.aaData.length; i++)
    {
      table.oApi._fnAddData(oSettings, json.aaData[i]);
    }
    oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
    table.fnDraw();
  });
}