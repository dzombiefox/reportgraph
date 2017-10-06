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
public class engobe {
    connect c=new connect();
    DecimalFormat df = new DecimalFormat(".##");
    private int id;
    private int det_id;
    private String name;
    private int color;
    private int size;
    private String date;
    private Double weight;
    private String status;
    private int periode;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDet_id() {
        return det_id;
    }

    public void setDet_id(int det_id) {
        this.det_id = det_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPeriode() {
        return periode;
    }

    public void setPeriode(int periode) {
        this.periode = periode;
    }
    
    public int getDetailId() throws SQLException{
        String cekId="select isnull(max(engobe_id)+0,0) as id from engobe";
        ResultSet rs=c.GetData(cekId);
        rs.next();
        return rs.getInt("id")+1;
    }
    public Double getAmountPrice(int id) throws SQLException{
        String query="select  sum(price)as price from engobeDetail where detail_id='"+id+"' and category='0'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return Double.valueOf(df.format(rs.getDouble("price")));
    }    
    public Double getAmountValue(int id)throws SQLException{
        String query="select  sum(volume)as volume from engobeDetail where detail_id='"+id+"' and category='0'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return Double.valueOf(df.format(rs.getDouble("volume")));
    }    
    public Double getAverage(int id)throws SQLException{
         return Double.valueOf(df.format(getAmountPrice(id)*100/getAmountValue(id)));
    }
    public Double getweightDry(int id)throws SQLException{
        String query="select * from engobe where detail_id='"+id+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        int size=rs.getInt("size_id");
        Double weightDry=rs.getDouble("weight");
        String cekQty="select quantity from size where size_id='"+size+"'";
        ResultSet rqty=c.GetData(cekQty);
        rqty.next();
        int qty=rqty.getInt("quantity");
        String cekqty="select * from formula where size_id='"+size+"' and data_id='3' AND status='kering' ";
        ResultSet rcek=c.GetData(cekqty);
        rcek.next();
        Double val=rcek.getDouble("value")/1000;
       // return Double.valueOf(df.format(val*qty));
        return Double.valueOf(df.format((val*qty*weightDry)/1000));
    }
    
    public Double getPriceWater(int id)throws SQLException{
        String query="select items_uprecent as recent from items where items_id='"+id+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getDouble("recent");
    }
    public Double getroPrice(int id)throws SQLException{
        String query="select (volume*priceWet/100)AS total  from engobeDetail where detail_id='"+id+"' and category ='1'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getDouble("total");
    }   
    
    public Double getTotalAverage(int id )throws SQLException{
        return Double.valueOf(df.format(getroPrice(id)+getAverage(id)));
    } 
    public Double getCostDry(int id)throws SQLException{    
        String cek="select weight from engobe where detail_id='"+id+"' ";
        ResultSet rs=c.GetData(cek);
        rs.next();
        Double weight=rs.getDouble("weight");
        return Double.valueOf(df.format(getTotalAverage(id)*getweightDry(id)));
    }
}
