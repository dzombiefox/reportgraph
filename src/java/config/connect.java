/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package config;

/**
 *
 * @author pc user
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class connect {    
   private Connection con;
   private  Statement st;
   public connect(){
   try{
String username="sa";
//String password="7proxy7";
String password="5u1k0d3n2";
String driver="net.sourceforge.jtds.jdbc.Driver";
String url="jdbc:jtds:sqlserver://192.168.10.2:1433/cost";
try
{
Class.forName(driver);
    System.out.println("Berhasil terhubung driver");
con=DriverManager.getConnection(url,username,password);
   
}catch(Exception  e){}
}
    catch(Exception e){
            System.out.println("gagal ");
}
    
    }
        
public ResultSet GetData(String query){
        try{
            st = con.createStatement();
            return st.executeQuery(query);
        }catch(SQLException ex){
            return null;
        }
    }

    public int ManipulasiData(String query){
        try{
            st = con.createStatement();
            return st.executeUpdate(query);
        }catch(SQLException ex){
            return 0;
        }
    }
public ResultSet TampilSemua(String Tabel){
       String sql="select * from "+Tabel+"";
       try{
st = con.createStatement();
return st.executeQuery(sql);
}catch(Exception e){}
             return null;

}
  public Connection getKoneksi(){
  return con;
  }
 }
