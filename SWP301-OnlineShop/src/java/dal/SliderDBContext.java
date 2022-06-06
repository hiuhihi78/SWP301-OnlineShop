/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Slider;
import model.User;

/**
 *
 * @author DELL
 */
public class SliderDBContext extends DBContext {

    public ArrayList<Slider> getSlidersActive() {
        ArrayList<Slider> listSlider = new ArrayList<>();
        try {
            String sql = "Select * from Slider\n"
                    + "Where status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()) {
                Slider slider = new Slider();
                slider.setId(rs.getInt(1));
                slider.setTitle(rs.getString(2));
                slider.setImage(rs.getString(3));
                slider.setBacklink(rs.getString(4));
                slider.setStatus(rs.getBoolean(5));
                User user = new User();
                user.setId(rs.getInt(6));
                slider.setUser(user);
                slider.setNote(rs.getString(7));
                listSlider.add(slider);
            }
        } catch (SQLException e) {
        }
        return listSlider;
    }
    
    public ArrayList<Slider> getAllSlider() {
        ArrayList<Slider> listSlider = new ArrayList<>();
        Slider slider = null;
        try {
            String sql = "Select * from Slider";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                slider = new Slider();
                slider.setId(rs.getInt(1));
                slider.setTitle(rs.getString(2));
                slider.setImage(rs.getString(3));
                slider.setBacklink(rs.getString(4));
                slider.setStatus(rs.getBoolean(5));
                User user = new User();
                user.setId(rs.getInt(6));
                slider.setUser(user);
                slider.setNote(rs.getString(7));
                listSlider.add(slider);
            }
        } catch (SQLException e) {
        }
        return listSlider;
    }
    
    public boolean changeStatus(int id, boolean status) {
        try {
            String sql = "UPDATE [Slider] set status = ? where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, status);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String[] args) {
        SliderDBContext db = new SliderDBContext();
//        ArrayList<Slider> listSlider = db.getAllSlider();
//        for (Slider slider : listSlider) {
//            System.out.println(slider.getTitle());
//        }
        boolean kq = false;
        kq = db.changeStatus(5, false);
        System.out.println(kq);
    }

    
    
}
