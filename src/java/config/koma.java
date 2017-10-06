/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package config;

import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 *
 * @author pc user
 */
public class koma {
   
 NumberFormat nf = NumberFormat.getInstance();
    public Double getKoma(Double koma){
     DecimalFormat df = new DecimalFormat(".##");
        double a = koma;
        Double.valueOf(df.format(a));
        return a;
    }
     
    public String getBehind(Double value){
        String angka=""; 
        int x=nf.format(value).indexOf('.');
        if(x>0){
                String[] pecah = nf.format(value).split("\\.");
                String da=pecah[1];
                int leng=da.length();
                    if(leng==2){
                    angka=nf.format(value)+"0";
                    }
                    else if(leng==1){
                    angka=nf.format(value)+"00";
                    }
                    else{
                    angka=nf.format(value);
                    }
                    }
                else{
                    angka=nf.format(value)+"";
                    }
        
        return angka;
    
    }
    
    public String getPlus(Double value){
        String angka=""; 
        int x=nf.format(value).indexOf('.');
        if(x>0){
                String[] pecah = nf.format(value).split("\\.");
                String da=pecah[1];
                int leng=da.length();
                    if(leng==2){
                    angka=nf.format(value)+"0";
                    }
                    else if(leng==1){
                    angka=nf.format(value)+"00";
                    }
                    else{
                    angka=nf.format(value);
                    }
                    }
       
                else{
                    angka=String.format("%.3f",value);
                    }
        
        return angka;
    
    
    }
    public String getMinus(Double value){
        String replace="";
        replace=String.valueOf(value);
        //replace=value.replace("-", "");
     //  replace=nf.format(value);
     String[] pecah = replace.split("\\.");
                                                    String da=pecah[1];
                                                    int leng=da.length();
                                                    if(leng==2){
                                                    replace=replace+"0";
                                                    }
                                                    else if(leng==1){
                                                    replace=replace+"00";
                                                       }    
                                                    else{
                                                    replace=String.format("%.3f",value);
                                                    }
						    replace=replace.replace("-", "(");
                                                    replace=replace+")";
 
           return replace;
    
    }
    
    
  
}
