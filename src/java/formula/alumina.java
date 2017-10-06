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
public class alumina {
    private int id;
    private int det_id;
    private String name;
    private int size;
    private String date;
    private Double weight;
    private int status;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getPeriode() {
        return periode;
    }

    public void setPeriode(int periode) {
        this.periode = periode;
    }

    public DecimalFormat getDf() {
        return df;
    }

    public void setDf(DecimalFormat df) {
        this.df = df;
    }

    public connect getC() {
        return c;
    }

    public void setC(connect c) {
        this.c = c;
    }
   
    
    DecimalFormat df = new DecimalFormat(".##");
    connect c=new connect();    
    public Double getAmountPrice(int id) throws SQLException{
        String query="select  sum(price)as price from aluminaDetail where detail_id='"+id+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return Double.valueOf(df.format(rs.getDouble("price")));
    }    
    public Double getAmountValue(int id)throws SQLException{
        String query="select  sum(volume)as volume from aluminaDetail where detail_id='"+id+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return Double.valueOf(df.format(rs.getDouble("volume")));
    }    
    public Double getAverage(int id)throws SQLException{
         return Double.valueOf(df.format(getAmountPrice(id)*100/getAmountValue(id)));
    }
    public Double getweightDry(int id)throws SQLException{
       
        String query="Select weight,size_id from alumina where detail_id='"+id+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        Double weight=rs.getDouble("weight");
        int size=rs.getInt("size_id");
        String cekqty="select quantity from size where size_id='"+size+"'";
        ResultSet r=c.GetData(cekqty);
        r.next();
        int qty=r.getInt("quantity");
        return qty*weight;
    }    
    public Double getCostDry(int id)throws SQLException{
       String cek="select weight from alumina where detail_id='"+id+"'";
       ResultSet rs=c.GetData(cek);
       rs.next();
       Double weight=rs.getDouble("weight");
       return Double.valueOf(df.format(getweightDry(id)*getAverage(id)));
    }
    public int getDetailId() throws SQLException{
        String cekId="select isnull(max(alumina_id)+0,0) as id from alumina";
        ResultSet rs=c.GetData(cekId);
        rs.next();
        return rs.getInt("id")+1;
    }
   
    
}
