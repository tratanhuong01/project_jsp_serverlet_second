/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

/**
 *
 * @author trata
 */
public class testJava {
    private String c = "jdbc:sqlserver://localhost:";
    private String host = "1433";
    private String tenDB = "DiDongShop";
    private String user = "sa";
    private String pass = "sa";
    private Connection openConnection() {
        Connection conn = null;
        try {
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            Class.forName(driver).newInstance();
            String url = c + host;
            conn = DriverManager.getConnection(url, user, pass);
            String query = "USE DiDongShop";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return conn;
    }
    public Product getProductByID(String id) {
        Product product = null;
        try (Connection conn = openConnection()){
            String query = "SELECT * FROM Product WHERE IDProduct = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            return product;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
    
    public static void main(String args[]) {
        testJava java = new testJava();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-dd-MM"); 
        Date d = new Date();
        String s = formatter.format(d); 
        System.out.println(s);
    }
}
