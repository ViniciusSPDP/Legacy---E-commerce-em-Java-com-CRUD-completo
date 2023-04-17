/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projetolegacy.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Conversoes {

    //Método para converter String em Data
    public static Date ConverterData(String data) {
        try {
            DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

            if ((data != null) || (!data.trim().equals(""))) {
                return fmt.parse(data);
            }else{
                return null;
            }
        }catch(Exception ex){
            System.out.println("Erro ao converter data: "+ ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }
}
