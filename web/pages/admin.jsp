<!DOCTYPE html>
<%
    if ((session.getAttribute("id") == null) || (session.getAttribute("id") =="")|| session.getAttribute("level") == null || (session.getAttribute("level") =="")) {
response.sendRedirect("./");
    }
%>
<html>
<head>
    <meta charset="UTF-8" >
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="Metro, a sleek, intuitive, and powerful framework for faster and easier web development for Windows Metro Style.">
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development">
    <meta name="author" content="Sergey Pimenov and Metro UI CSS contributors">
    <link rel='shortcut icon' type='image/x-icon' href='../favicon.ico' />
    <title>Cost</title>
    <link href="../css/select2.css" rel="stylesheet" type="text/css"/>
    <link href="../build/css/autocomplete.css" rel="stylesheet" type="text/css"/>
    <link href="../css/dataTables.tableTools.css" rel="stylesheet" type="text/css"/>
    <link href="../build/css/metro.css" rel="stylesheet" type="text/css"/>
    <link href="../build/css/metro-icons.css" rel="stylesheet" type="text/css"/>
    <link href="../build/css/metro-responsive.css" rel="stylesheet" type="text/css"/>
    <script src="../js/dataTables.tableTools.js" type="text/javascript"></script>
    <script src="../js/refresh.js" type="text/javascript"></script>
    <script src="../js/jquery-2.1.3.min.js" type="text/javascript"></script>
    <script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../js/metro.js" type="text/javascript"></script>
    <script src="../build/js/jquery.number.js" type="text/javascript"></script>
    <script src="../js/jQuery.print.js" type="text/javascript"></script>
    <script src="../js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
    <script src="../js/autocomplete.js" type="text/javascript"></script>
    <script src="../js/select2.js" type="text/javascript"></script>
    <script src="../js/jquery.jeditable.mini.js" type="text/javascript"></script>
    <script>
        var timoutWarning = 840000; // Display warning in 14 Mins.
var timoutNow = 900000; // Timeout in 15 mins.
var logoutUrl = 'logout.jsp'; // URL to logout page.

var warningTimer;
var timeoutTimer;

// Start timers.
function StartTimers() {
    warningTimer = setTimeout("IdleWarning()", timoutWarning);
    timeoutTimer = setTimeout("IdleTimeout()", timoutNow);
}

// Reset timers.
function ResetTimers() {
    clearTimeout(warningTimer);
    clearTimeout(timeoutTimer);
    StartTimers();
    $("#timeout").dialog('close');
}

// Show idle timeout warning dialog.
function IdleWarning() {
    $("#timeout").dialog({
        modal: true
    });
}

// Logout the user.
function IdleTimeout() {
    window.location = logoutUrl;
}

  

});
    </script>
    <style>
    .loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('image/725.GIF') 50% 50% no-repeat rgb(249,249,249);
}

  #myIframe{
  height: 98%;
  width: 1200px;
  border: none;
}
</style>

<script type="text/javascript">
$(window).load(function() {
	$(".loader").fadeOut("slow");
})
</script>

    <style>
        html, body {
            height: 100%;
        }
        body {
        }
        .page-content {
            padding-top: 3.125rem;
            min-height: 100%;
            height: 100%;
        }
        .table .input-control.checkbox {
            line-height: 1;
            min-height: 0;
            height: auto;
        }

        @media screen and (max-width: 800px){
            #cell-sidebar {
                flex-basis: 52px;
            }
            #cell-content {
                flex-basis: calc(100% - 52px);
            }
        }
    </style>
    <script>
        function pushMessage(){
            var mes = 'Info|Implement independently';
            $.Notify({
                caption: mes.split("|")[0],
                content: mes.split("|")[1],
                type: 'alert'
            });
        }   
    </script>
</head>
<body class="bg-steel" onload="StartTimers();" onmousemove="ResetTimers();">

    <div class="app-bar fixed-top darcula" data-role="appbar">
        <a class="app-bar-element" > <span class="mif-home icon">&nbsp;PT Chang Jui Fang Indonesia</span></a>
  
        <ul class="app-bar-menu">
         
            <li data-flexorder="2" data-flexorderorigin="1">
                <a href="" class="dropdown-toggle">Master Menu</a>
                <ul class="d-menu" data-role="dropdown">
                    <li><a href="?page=item/data">Items</a></li>
                    <li class="divider"></li>
                    <li><a href="?page=formula/data">Formula</a></li>
                     <li class="divider"></li>
                    <li><a href="?page=tipe/data">Tipe</a></li>
                    <li class="divider"></li>
                     <li><a href="?page=motif/data">Motif</a></li>
                    <li class="divider"></li>
					<li><a href="?page=color/data">Color</a></li>
                    <li class="divider"></li>
                    <li><a href="?page=roller/data">Roller</a></li>
                     <li class="divider"></li>
                    <li><a href="?page=target/data">Target</a></li>
                </ul>
            </li>
            <li data-flexorder="3" data-flexorderorigin="1">
                <a href="" class="dropdown-toggle">Menu Transaction</a>
                <ul class="d-menu" data-role="dropdown">
                    <li><a href="?page=body/create">Body</a></li>
                    <li class="divider"></li>
                     <li><a href="?page=alumina/create">Alumina</a></li>
                    <li class="divider"></li>
                     <li><a href="?page=engobe/create">Engobe</a></li>
                    <li class="divider"></li>
                        <li><a href="?page=glaze/create">Glaze</a></li>
                         <li class="divider"></li>
                        <li><a href="?page=drop/create">Drop</a></li>
                    <li class="divider"></li>
                      <li><a href="?page=pasta/create">Pasta</a></li>
                    <li class="divider"></li>
                     <li><a href="?page=ink/create">Ink Digital</a></li>
                    <li class="divider"></li>
                </ul>            
            </li>
          
            <li data-flexorder="5" data-flexorderorigin="4">
                <a href="" class="dropdown-toggle">Data Menu</a>
                <ul class="d-menu" data-role="dropdown">
                    <li><a href="?page=body/data">Data Body</a></li>
                    <li><a href="?page=alumina/data">Data Alumina</a></li>
                    <li><a href="?page=engobe/data">Data Engobe</a></li>
                    <li><a href="?page=drop/data">Data Drop</a></li>
                    <li><a href="?page=glaze/data">Glaze</a></li>
                    <li><a href="?page=pasta/data">Pasta</a></li>
                    <li><a href="?page=ink/data">Ink</a></li>
                </ul>
            </li>
             <li data-flexorder="5" data-flexorderorigin="4">
                <a href="" class="dropdown-toggle">Finish Good</a>
                <ul class="d-menu" data-role="dropdown">
                    <li><a href="?page=finish/create">Create Finish Item</a></li>
                    <li><a href="?page=finish/data">Finish Item</a></li>
                   <li><a href="?page=hpp/create">HPP And SELL Price</a></li>
                </ul>
            </li>
        </ul>
        <div class="app-bar-element place-right">
            <span class="dropdown-toggle"><span class="mif-cog"></span> Welcome :&nbsp;<% out.print(session.getAttribute("nama"));%></span>
            <div class="app-bar-drop-container padding10 place-right no-margin-top block-shadow fg-dark" data-role="dropdown" data-no-close="true" style="width: 220px">
                    <ul class="unstyled-list fg-dark">
                    <li><a href="logout.jsp" class="fg-white3 fg-hover-yellow">Exit</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="page-content" style="height: auto">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
            <div class="row" style="height: 100%">
                <div class="cell size-x200" id="cell-sidebar" style="background-color: #71b1d1; height: 100%">
                    <ul class="sidebar">
                         <li><a href="?page=price/data">
                            <span class="mif-plus icon"></span>
                            <span class="title">Master Price</span>                           
                        </a></li>
                        <li><a href="?page=purchase/create">
                            <span class="mif-apps icon"></span>
                            <span class="title">Purchase Item</span>                           
                        </a></li>
                        
                        <li><a href="?page=report/print">
                            <span class="mif-database icon"></span>
                            <span class="title">Data Purchase</span>
                           
                        </a></li>
                        <li><a href="?page=sch/data">
                            <span class="mif-cogs icon"></span>
                            <span class="title">Cost Item</span>                           
                        </a></li>
                         
                    </ul>
                </div>
                <div class="cell auto-size padding20 bg-white" id="cell-content" style="height: auto">
                    <div class="loader"></div> 
                    <%
String pages="page";
String requestURL = request.getRequestURL().toString();
String queryString = request.getParameter(pages);
if (queryString != null) {requestURL += "?" + queryString;
String g=".jsp";
String c=queryString + g;
        %>
           <%pageContext.include(c); %>
        <% }
else {
        %>
        <%@include file="home.jsp" %>
        <% } %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>