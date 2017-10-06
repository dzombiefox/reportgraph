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
public class roller {
    public roller(){}
    DecimalFormat df=new DecimalFormat(".##");
    connect c=new connect();
    public Double getCostPrint(int id) throws SQLException{
    String query="select priceCalc from mroller where mroller_id='"+id+"'";
    ResultSet rs=c.GetData(query);
    rs.next();
        return Double.valueOf(df.format(rs.getDouble("priceCalc")));
    }
    
    
}
