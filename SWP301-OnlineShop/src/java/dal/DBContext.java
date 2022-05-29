/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
<<<<<<< HEAD
 * @author Admin
 */
public class DBContext {
    
    Connection connection;

//    public DBContext() {
//        try {
////            String username = "swp391-g1";
////            String password = "passmon123!";
//            String username = "sa";
//            String password = "sa";
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP391-OnlineShop";
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            connection = DriverManager.getConnection(url, username, password);
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    


    public DBContext() {
        try {
            String user = "vailon";
            String pass = "daucatmoi123!";
            String url = "jdbc:sqlserver://vpn.ripaimcsgo.xyz:1433;databaseName=OnlineShop2";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

