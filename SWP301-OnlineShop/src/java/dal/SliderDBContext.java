/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

    
    
}
