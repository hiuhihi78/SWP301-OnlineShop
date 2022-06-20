/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import model.Image;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
public class FeedbackDBContext extends DBContext {

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

    public ArrayList<Feedback> getListFeedbackFilter(int categoryId, int subCategoryId, String status, int star, String search, String orderBy, String sort) {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        try {

            String sql = "DECLARE @Col_Name VARCHAR(128) = " + "'" + orderBy + "'" + "\n";
            sql += "SELECT [Feedback].id\n"
                    + "      ,[User].[fullname]\n"
                    + "      ,[Product].[name]\n"
                    + "      ,[start]\n"
                    + "      ,[comment]\n"
                    + "      ,[image]\n"
                    + "      ,[Feedback].[status]\n"
                    + "\n"
                    + "  FROM [dbo].[Feedback] join [User] on [User].id = Feedback.userId\n"
                    + "				join Product on Product.id = Feedback.productId\n"
                    + "				join SubCategory on Product.subCategoryId = SubCategory.id\n"
                    + "				join Category on Category.id =SubCategory.categoryId\n"
                    + "	WHERE (1=1) ";
            int paramIndex = 0;
            HashMap<Integer, Object[]> params = new HashMap<>();
            if (categoryId != 0) {
                sql += " and categoryId = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getName();
                param[1] = categoryId;
                params.put(paramIndex, param);
            }

            if (subCategoryId != 0) {
                sql += " and subCategoryId = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getName();
                param[1] = subCategoryId;
                params.put(paramIndex, param);
            }

            if (!status.equals("all")) {
                sql += " and [Feedback].[status] = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getName();
                param[1] = status.equals("active");
                params.put(paramIndex, param);
            }

            if (star != -1) {
                sql += " and [start] = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getName();
                param[1] = star;
                params.put(paramIndex, param);
            }
            if (!search.equals("")) {
                sql += "and ([User].[fullname] like ? or [comment] like ? or [Product].name like ?)\n";
                paramIndex++;
                Object[] paramUsername = new Object[2];
                paramUsername[0] = String.class.getName();
                paramUsername[1] = "%" + search + "%";
                params.put(paramIndex, paramUsername);

                paramIndex++;
                Object[] paramContent = new Object[2];
                paramContent[0] = String.class.getName();
                paramContent[1] = "%" + search + "%";
                params.put(paramIndex, paramContent);

                paramIndex++;
                Object[] paramProductName = new Object[2];
                paramProductName[0] = String.class.getName();
                paramProductName[1] = "%" + search + "%";
                params.put(paramIndex, paramProductName);
            }

            // sort
            if (orderBy.equals("id")) {
                sql += " order by id " + sort;
            }

            if (orderBy.equals("username")) {
                sql += " order by fullname " + sort;
            }

            if (orderBy.equals("productName")) {
                sql += " order by name " + sort;
            }
            if (orderBy.equals("star")) {
                sql += " order by start " + sort;
            }
            if (orderBy.equals("status")) {
                sql += " order by status " + sort;
            }

            PreparedStatement ps = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();
                if (type.equals(Integer.class.getName())) {
                    ps.setInt(index, (Integer) value[1]);
                }
                if (type.equals(Boolean.class.getName())) {
                    ps.setBoolean(index, (Boolean) value[1]);
                }
                if (type.equals(String.class.getName())) {
                    ps.setString(index, (String) value[1]);
                }
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt(1));

                User user = new User();
                user.setFullname(rs.getString(2));
                feedback.setUser(user);

                Product product = new Product();
                product.setName(rs.getString(3));
                feedback.setProduct(product);

                feedback.setStart(rs.getInt(4));

                feedback.setComment(rs.getString(5));
                feedback.setStatus(rs.getBoolean(7));

                feedbacks.add(feedback);
            }
        } catch (Exception e) {
        }
        return feedbacks;
    }

    public ArrayList<Feedback> getListFeedbackByPage(ArrayList<Feedback> list, int start, int end) {
        ArrayList<Feedback> arr = new ArrayList<>();
        int totalRecord = list.size();
        if (totalRecord < end) {
            arr.addAll(list);
            return arr;
        }
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void editStatusFeedback(int id, boolean status) {
        try {

            String sql = "UPDATE [dbo].[Feedback]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE  id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Image> getFeedbackImage(int feedbackId) {
        ArrayList<Image> images = new ArrayList<>();
        String sql = "select [Image].[image] from Feedback_Image join [Image] on Feedback_Image.imageId = [Image].id \n"
                + "Where feedbackId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, feedbackId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Image image = new Image();
                image.setImage(rs.getString(1));
                images.add(image);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return images;
    }
    
    public static void main(String[] args) {
        FeedbackDBContext db = new FeedbackDBContext();
        System.err.println(db.getFeedbackImage(5).size());
    }

}
