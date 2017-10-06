/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formula;

import config.connect;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author surya
 */
public class finish {
    private int motif;
    private int size;
    private int periode;
    private int color;
    private int opt;
    private int body;
    private int alumina;
    private int engobe;
    private int glaze;

    public int getDrop() {
        return drop;
    }

    public void setDrop(int drop) {
        this.drop = drop;
    }
    private int drop;
    public int getMotif() {
        return motif;
    }

    public void setMotif(int motif) {
        this.motif = motif;
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

    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
    }

    public int getOpt() {
        return opt;
    }

    public void setOpt(int opt) {
        this.opt = opt;
    }

    public int getBody() {
        return body;
    }

    public void setBody(int body) {
        this.body = body;
    }

    public int getAlumina() {
        return alumina;
    }

    public void setAlumina(int alumina) {
        this.alumina = alumina;
    }

    public int getEngobe() {
        return engobe;
    }

    public void setEngobe(int engobe) {
        this.engobe = engobe;
    }

    public int getGlaze() {
        return glaze;
    }

    public void setGlaze(int glaze) {
        this.glaze = glaze;
    }
    public connect getC() {
        return c;
    }

    public void setC(connect c) {
        this.c = c;
    }
connect c=new connect();
     public int getDetailId() throws SQLException{
        String cekId="select isnull(max(finish_id)+0,0) as id from finish";
        ResultSet rs=c.GetData(cekId);
        rs.next();
        return rs.getInt("id")+1;
    }
     public String getBrandCode(int motif) throws SQLException{
        String query="select SUBSTRING(b.name,1,1) as  col from rmotif m join brand b on m.brand_id=b.brand_id where m.rmotif_id='"+motif+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getString("col");
     }
     public String getSizeCode(int size)throws SQLException{
         String query="select SUBSTRING(size,1,2)as col from size where size_id='"+size+"'";
         ResultSet rs=c.GetData(query);
         rs.next();
         return rs.getString("col");
     }
     public String getMotivCode(int motif)throws SQLException{
        String query="select code as col from rmotif m where m.rmotif_id='"+motif+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getString("col");
     }
     public String getColorCode(int color)throws SQLException{
        String query="select name as col from color m where color_id='"+color+"'";
        ResultSet rs=c.GetData(query);
        rs.next();
        return rs.getString("col");
     }
}
