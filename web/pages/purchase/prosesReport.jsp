<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String query="select * from purchase";
ResultSet rs=c.GetData(query);
while(rs.next()){
String no_po=rs.getString("no_po");
Float totalPurchase=rs.getFloat("qty_received");
Float kurs=rs.getFloat("kurs");
Float usd=rs.getFloat("usd");
Double nilai=1.44;
Double m2=usd*nilai*kurs;
DecimalFormat twoDForm = new DecimalFormat("#.##");
Double ofreight,control_fee,verification,trucking,custom_fee,loan_interest,other_exp;
String d1="select * from total join category on total.category_id=category.category_id where no_po='"+no_po+"' and total.category_id=1";
ResultSet rs1=c.GetData(d1);
String d2="select * from total join category on total.category_id=category.category_id where no_po='"+no_po+"' and total.category_id=2";
ResultSet rs2=c.GetData(d2);
String d3="select * from total join category on total.category_id=category.category_id where no_po='"+no_po+"' and total.category_id=3";
ResultSet rs3=c.GetData(d3);
String d4="select * from total join category on total.category_id=category.category_id where no_po='"+no_po+"' and total.category_id=4";
ResultSet rs4=c.GetData(d4);
String d5="select * from total join category on total.category_id=category.category_id where no_po='"+no_po+"' and total.category_id=5";
ResultSet rs5=c.GetData(d5);
String d6="select * from total join category on total.category_id=category.category_id where no_po='"+no_po+"' and total.category_id=6";
ResultSet rs6=c.GetData(d6);
String d7="select * from total join category on total.category_id=category.category_id where no_po='"+no_po+"' and total.category_id=7";
ResultSet rs7=c.GetData(d7);
if(rs1.next())
{
ofreight=Double.valueOf(twoDForm.format(rs1.getDouble("teidr")));
//Double.valueOf(twoDForm.format(m2));
}
else{
ofreight=0.0;
}
if(rs2.next()){
control_fee=Double.valueOf(twoDForm.format(rs2.getDouble("teidr")));
}
else{
control_fee=0.0;
}
if(rs3.next()){
verification=Double.valueOf(twoDForm.format(rs3.getDouble("teidr")));
}
else{
verification=0.0;
}
if(rs4.next()){
trucking=Double.valueOf(twoDForm.format(rs4.getDouble("teidr")));
}
else{
trucking=0.0;
}
if(rs5.next()){
custom_fee=Double.valueOf(twoDForm.format(rs5.getDouble("teidr")));
}
else{
custom_fee=0.0;
}
if(rs6.next()){
loan_interest=Double.valueOf(twoDForm.format(rs6.getDouble("teidr")));
}
else{
loan_interest=0.0;
}
if(rs7.next()){
other_exp=Double.valueOf(twoDForm.format(rs7.getDouble("teidr")));
}
else{
other_exp=0.0;
}


Double importExp=ofreight+control_fee+verification+trucking+custom_fee+loan_interest+other_exp;
double purchaseCost = Double.valueOf(twoDForm.format(m2));
double perBox=purchaseCost+importExp;
double perM2=perBox/nilai;

String cekData="select * from detail where no_po='"+no_po+"'";
ResultSet rd=c.GetData(cekData);
if(!rd.next())
{
String input="insert into detail(purch_m2,purch_box,purch_cost,import,ofreight,control_fee,verification,trucking,custom_fee,loan_interest,other_exp,no_po)values"
        + "('"+perM2+"','"+perBox+"','"+purchaseCost+"','"+importExp+"','"+ofreight+"','"+control_fee+"','"+verification+"','"+trucking+"','"+custom_fee+"','"+loan_interest+"','"+other_exp+"','"+no_po+"')";
c.ManipulasiData(input);
}
else{
String update="update detail set purch_m2='"+perM2+"',purch_box='"+perBox+"',purch_cost='"+purchaseCost+"',import='"+importExp+"',ofreight='"+ofreight+"',control_fee='"+control_fee+"',verification='"+verification+"',trucking='"+trucking+"',custom_fee='"+custom_fee+"',loan_interest='"+loan_interest+"',other_exp='"+other_exp+"' where no_po='"+no_po+"'";
c.ManipulasiData(update);
}


}






%>