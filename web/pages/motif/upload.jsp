<%@page import="config.connect"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.io.*" %>
<%@page import="com.oreilly.servlet.*" %>

<%
connect c=new connect();
  String path="/pages/motif/image/";


MultipartRequest multi = new MultipartRequest(request,request.getSession().getServletContext().getRealPath(path),10000000); 
Enumeration files = multi.getFileNames();
 while (files.hasMoreElements()) {
   String name = (String)files.nextElement();
   String filename = multi.getFilesystemName(name);   
   String type = multi.getContentType(name);
   File f = multi.getFile(name); 
   String nama=multi.getParameter("nama");
   String query="update rmotif set image='"+filename+"' where rmotif_id='"+nama+"'";
   c.ManipulasiData(query);
 }

%>


