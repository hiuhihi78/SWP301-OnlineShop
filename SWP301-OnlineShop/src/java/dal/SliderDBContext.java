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

/**
 *
 * @author DELL
 */
public class SliderDBContext extends DBContext {

    public ArrayList<Slider> getSlidersActive() {
        ArrayList<Slider> listSlider = new ArrayList<>();
        try {
            String sql = "";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()) {
                Slider slider = new Slider();
                
                listSlider.add(slider);
            }
        } catch (SQLException e) {
        }
        return listSlider;
    }

    
    
}
