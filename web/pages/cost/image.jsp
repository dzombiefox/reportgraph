





<%@page import="org.apache.poi.hssf.usermodel.HSSFPicture"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFPatriarch"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFClientAnchor"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.poi.ss.usermodel.Picture"%>
<%@page import="org.apache.poi.ss.usermodel.ClientAnchor"%>
<%@page import="org.apache.poi.ss.usermodel.Drawing"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.CreationHelper"%>
<%@page import="org.apache.poi.util.IOUtils"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%
  FileInputStream chart_file_input = new FileInputStream(new File("D:/LaporanTHRKabag.xls"));
               
                HSSFWorkbook my_workbook = new HSSFWorkbook(chart_file_input);
              
                HSSFSheet my_sheet = my_workbook.getSheetAt(0);
                
                DefaultPieDataset my_pie_chart_data = new DefaultPieDataset();
                           Iterator<Row> rowIterator = my_sheet.iterator(); 
              
                String chart_label="a";
                Number chart_data=0;            
                while(rowIterator.hasNext()) {
                    
                        Row row = rowIterator.next();  
                        
                        Iterator<Cell> cellIterator = row.cellIterator();
                                while(cellIterator.hasNext()) {
                                        Cell cell = cellIterator.next(); 
                                        switch(cell.getCellType()) { 
                                        case Cell.CELL_TYPE_NUMERIC:
                                                chart_data=cell.getNumericCellValue();
                                                break;
                                        case Cell.CELL_TYPE_STRING:
                                                chart_label=cell.getStringCellValue();
                                                break;
                                        }
                                }
                      
                my_pie_chart_data.setValue(chart_label,chart_data);
                }               
               
                JFreeChart myPieChart=ChartFactory.createPieChart("Excel Pie Chart Java Example",my_pie_chart_data,true,true,false);
              
                int width=640; /* Width of the chart */
                int height=480; /* Height of the chart */
                float quality=1; /* Quality factor */
             
                ByteArrayOutputStream chart_out = new ByteArrayOutputStream();          
                ChartUtilities.writeChartAsJPEG(chart_out,quality,myPieChart,width,height);
          
                InputStream feed_chart_to_excel=new ByteArrayInputStream(chart_out.toByteArray());
                byte[] bytes = IOUtils.toByteArray(feed_chart_to_excel);
             
                int my_picture_id = my_workbook.addPicture(bytes, Workbook.PICTURE_TYPE_JPEG);
          
                feed_chart_to_excel.close();
             
                chart_out.close();
               
                HSSFPatriarch drawing = my_sheet.createDrawingPatriarch();
            
                ClientAnchor my_anchor = new HSSFClientAnchor();
               
                my_anchor.setCol1(4);
                my_anchor.setRow1(5);
                
                HSSFPicture  my_picture = drawing.createPicture(my_anchor, my_picture_id);
             
                my_picture.resize();
              
                chart_file_input.close();               
          
                FileOutputStream outs = new FileOutputStream(new File("my_chart.xls"));
                my_workbook.write(outs);
                out.close();    

%>


