/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class FeedbackDBContext extends DBContext{
    
    public int getFeedbackNumber() {
        int feedbackNumber = 0;
        try {
            String sql = "select COUNT(*) num from Feedback";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                feedbackNumber = rs.getInt("num");
            }
        } catch (SQLException e) {
        }
        return feedbackNumber;
    }
    
    public static void main(String[] args) {
        FeedbackDBContext db =new FeedbackDBContext();
        System.out.println(db.getFeedbackNumber());
    }
}
