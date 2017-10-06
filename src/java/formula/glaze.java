/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formula;

import config.connect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;


/**
 *
 * @author surya
 */
public class glaze {
    connect c=new connect();
    DecimalFormat df=new DecimalFormat(".##");

    public connect getC() {
        return c;
    }

    public void setC(connect c) {
        this.c = c;
    }

    public DecimalFormat getDf() {
        return df;
    }

    public void setDf(DecimalFormat df) {
        this.df = df;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDet_id() {
        return det_id;
    }

    public void setDet_id(int det_id) {
        this.det_id = det_id;
    }

    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getPeriode() {
        return periode;
    }

    public void setPeriode(int periode) {
        this.periode = periode;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }
    private String name;
    private int det_id;
    private int color;
    private int size;
    private int periode;
    private Double weight;  
    
   public int getDetailId() throws SQLException{
        String cekId="select isnull(max(glaze_id)+0,0) as id from glaze";
        ResultSet rs=c.GetData(cekId);
        rs.next();
        return rs.getInt("id")+1;
    }
    public Double getAmountPrice(int id) throws SQLException{
        String query="select  sum(price)as price from glazeDetail where detail_id='"+id+"' and category='0'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return Double.valueOf(df.format(rs.getDouble("price")));
    }    
    public Double getAmountValue(int id)throws SQLException{
        String query="select  sum(volume)as volume from glazeDetail where detail_id='"+id+"' and category='0' ";
        ResultSet rs=c.GetData(query);
        rs.next();
        return Double.valueOf(df.format(rs.getDouble("volume")));
    }    
    public Double getAverage(int id)throws SQLException{
         return Double.valueOf(df.format(getAmountPrice(id)*100/getAmountValue(id)));
    }
    public Double getWeightDry(int id)throws SQLException{
        String query="select * from glaze where detail_id='"+id+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        int size=rs.getInt("size_id");
        Double weightDry=rs.getDouble("weight");
        String cekQty="select quantity from size where size_id='"+size+"'";
        ResultSet r=c.GetData(cekQty);
        r.next();
        String cekVal="select * from formula where size_id='"+size+"' and data_id='2' AND status='kering'"; //query mendapatkan value formula
        ResultSet rsval=c.GetData(cekVal);
        rsval.next();
        Double value=rsval.getDouble("value")/1000;
        int qty=r.getInt("quantity");
        //return Double.valueOf(df.format(value*qty));
        return Double.valueOf(df.format((weightDry*qty*value)/1000));
    }
   public Double getCostDry(int id)throws SQLException{
       return Double.valueOf(df.format(getTotalAverage(id)*getWeightDry(id)));  
   
   }
   public Double getPriceWater(int id)throws SQLException{
        String query="select items_uprecent as recent from items where items_id='"+id+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getDouble("recent");
    }
   public Double getroPrice(int id)throws SQLException{
        String query="select (volume*priceWet/100)AS total  from glazeDetail where detail_id='"+id+"' and category ='1'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getDouble("total");
    }
   
  public Double getTotalRo(int id)throws SQLException{
    String query="select (volume*priceWet/100)AS total  from glazeDetail where detail_id='"+id+"' and category ='1'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getDouble("total");
  
  } 
  public Double getTotalAverage(int id )throws SQLException{
        return Double.valueOf(df.format(getroPrice(id)+getAverage(id)));
    } 
}
