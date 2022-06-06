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
import model.Category;
import model.SubCategory;

/**
 *
 * @author Admin
 */
public class CategoryDBContext extends DBContext{
    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> categorys = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Category]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt(1));
                category.setName(rs.getString(2));
                categorys.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorys;
    }

    public ArrayList<SubCategory> getSubCatgory(int category) {
        ArrayList<SubCategory> subCategorys = new ArrayList<>();

        try {
            String sql = "SELECT [SubCategory].[id]\n"
                    + "      ,[SubCategory].[name]\n"
                    + "      ,[categoryId]\n"
                    + "	  ,[Category].[name]\n"
                    + "  FROM [dbo].[SubCategory] join Category on Category.id = SubCategory.categoryId\n"
                    + "  WHERE Category.id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, category);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SubCategory subCategory = new SubCategory();
                subCategory.setId(rs.getInt(1));
                subCategory.setName(rs.getString(2));
                Category c = new Category();
                c.setId(category);
                c.setName(rs.getString(4));
                subCategory.setCategory(c);
                subCategorys.add(subCategory);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subCategorys;
    }
    
    public static void main(String[] args) {
        System.out.println(new CategoryDBContext().getSubCatgory(1).size());
    }
}
