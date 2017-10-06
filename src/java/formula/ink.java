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
public class ink {
     DecimalFormat df=new DecimalFormat(".##");
    connect c=new connect();
    private int id;
    private int det_id;
    private String name;
    private int size;
    private String date;
    private int color;
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

    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
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
        String cekId="select isnull(max(ink_id)+0,0) as id from ink";
        ResultSet rs=c.GetData(cekId);
        rs.next();
        return rs.getInt("id")+1;
}
    
    
    public Double getTotalValue(int id) throws SQLException{
        String cekVolume="select sum(volume) as volume from inkDetail where detail_id='"+id+"'";
        ResultSet rvol=c.GetData(cekVolume);
        rvol.next();
        return rvol.getDouble("volume");
    
    }
    public Double getTotalPrice(int id)throws SQLException{
        String query="select sum(price) as price from inkDetail where detail_id='"+id+"'";
        ResultSet rprice=c.GetData(query);
        rprice.next();
        return Double.valueOf(df.format(rprice.getDouble("price"))) ;

}
}
