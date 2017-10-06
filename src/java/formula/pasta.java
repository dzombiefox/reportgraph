/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formula;

import config.connect;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

/**
 *
 * @author surya
 */

public class pasta {
    DecimalFormat df=new DecimalFormat(".###");
    private int id;
    private String name;
    private int det_id;
    private int size;
    private String date;
    private int color;
    private String opt;
    private Double weight;
    private int status;
    private int periode;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getOpt() {
        return opt;
    }

    public void setOpt(String opt) {
        this.opt = opt;
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

    public connect getC() {
        return c;
    }

    public void setC(connect c) {
        this.c = c;
    }
    
    
connect c=new connect();
public Double getTotalPrice(int id)throws SQLException{
        String query="select sum(price) as price from pastaDetail where detail_id='"+id+"'";
        ResultSet rprice=c.GetData(query);
        rprice.next();
        return rprice.getDouble("price");

}

public Double getTotalValue(int id)throws SQLException{
        String cekVolume="select sum(volume) as volume from pastaDetail where detail_id='"+id+"'";
        ResultSet rvol=c.GetData(cekVolume);
        rvol.next();
        return rvol.getDouble("volume");
}

public Double getAverage(int id) throws SQLException{
        Double avg=getTotalPrice(id);
        Double vol=getTotalValue(id);
        Double average=avg*100/vol;
        return Double.valueOf(df.format(average));
    }

public Double getDryWeight(int id)throws SQLException{
        String cekSize="select * from pasta where detail_id='"+id+"'";
        ResultSet rcek=c.GetData(cekSize);
        rcek.next();
        int size=rcek.getInt("size_id");
        Double weight=rcek.getDouble("weight");
        String query="select quantity as qty from size where size_id='"+size+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        int qty=rs.getInt("qty");
        Double wetWight=weight*qty/1000;
        return Double.valueOf(df.format(wetWight));   
    
}

public Double getDoubleCostDry(int id)throws SQLException{
        String query="select weight from pasta where detail_id='"+id+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        Double weight=rs.getDouble("weight");
        Double av=getAverage(id);
        Double dry=getDryWeight(id);
        Double costDry=av*dry;
        return Double.valueOf(df.format(costDry));
}
public int getDetailId() throws SQLException{
        String cekId="select isnull(max(pasta_id)+0,0) as id from pasta";
        ResultSet rs=c.GetData(cekId);
        rs.next();
        return rs.getInt("id")+1;
}
}

