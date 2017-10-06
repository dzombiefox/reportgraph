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
public class body {
    DecimalFormat df = new DecimalFormat(".##");
    connect c=new connect();
    private int id;
    private int det_id;
    private String name;
    private String choose;
    private String date;
    private Float tro;
    private int size;
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

    public String getChoose() {
        return choose;
    }

    public void setChoose(String choose) {
        this.choose = choose;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Float getTro() {
        return tro;
    }

    public void setTro(Float tro) {
        this.tro = tro;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
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
    
    public Double getAmountPrice(int id) throws SQLException{
        String query="select sum(price) as price from bodyDetail where detail_id='"+id+"' and category='0'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return Double.valueOf(df.format(rs.getDouble("price")));
    }
    public Double getAmountVolume(int id)throws SQLException{
        String query="select sum(volume) as volume from bodyDetail where detail_id='"+id+"' and category='0'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return Double.valueOf(df.format(rs.getDouble("volume")));
    }
    
    public Double getAverage(int id)throws SQLException{
        return Double.valueOf(df.format(getAmountPrice(id)*100/getAmountVolume(id)));
    }
    
    public Double getroPrice(int id)throws SQLException{
        String query="select (volume*priceWet/100)AS total  from bodyDetail where detail_id='"+id+"' and category ='1'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getDouble("total");
    }    
    
    public Double getTotalAverage(int id )throws SQLException{
        return Double.valueOf(df.format(getroPrice(id)+getAverage(id)));
    }
    public Double getweightDry(int id)throws SQLException{
        String cek="select * from body where detail_id='"+id+"'";
        ResultSet rcek=c.GetData(cek);
        rcek.next();
        Double weight=rcek.getDouble("weightPcs");
        String cekSize="select size_id from body where detail_id='"+id+"'";
        ResultSet rst=c.GetData(cekSize);
        rst.next();
        int size=rst.getInt("size_id");                     
        String query="select quantity as qty from size where size_id='"+size+"'";
        ResultSet rs=c.GetData(query);
        rs.next();      
        return Double.valueOf(df.format(rs.getInt("qty")*weight));
    }
    
    public Double getcostDry(int id)throws SQLException{    
        String cek="select weightPcs from body where detail_id='"+id+"' ";
        ResultSet rs=c.GetData(cek);
        rs.next();
        Double weight=rs.getDouble("weightPcs");
        return Double.valueOf(df.format(getTotalAverage(id)*getweightDry(id)));
    }
    public int getDetailId() throws SQLException{
        String cekId="select isnull(max(body_id)+0,0) as id from body";
        ResultSet rs=c.GetData(cekId);
        rs.next();
        return rs.getInt("id")+1;
    }
    
    public Double getPriceWater(int id)throws SQLException{
        String query="select items_uprecent as recent from items where items_id='"+id+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getDouble("recent");
    }
    
    public int removeBody(int id){
        String query="delete from body where body_detail='"+id+"'";
        c.ManipulasiData(query);
        String rdetail="delete from bodyDetail where body_detail='"+id+"'";
        c.ManipulasiData(rdetail);
        return 1;
    
    }
}
