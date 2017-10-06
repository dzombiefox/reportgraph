/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grafik;

import config.connect;

/**
 *
 * @author surya
 */
public class coba {   
    connect c=new connect();
    public void saveData(String nama){
    String query="insert into tes(nama)values('"+nama+"')";
    c.ManipulasiData(query);
    }
    
    public void updateData(String id,String nama){
    String query="update tes set nama='"+nama+"' where id='"+id+"'";
    c.ManipulasiData(query);
    }
    public String delete(int id){
    String remove="delete from tes where id='"+id+"'";
    c.ManipulasiData(remove);
    return "sukses";
    }
}
