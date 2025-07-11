package DAO;

import models.User;
import utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImpl implements UserDAO {
    @Override
    public int register(User user) {
        String checkUsernameSql = "SELECT 1 FROM users WHERE username = ?";
        String checkEmailSql = "SELECT 1 FROM users WHERE email = ?";
        String insertSql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
        try {
            Connection conn = DBUtil.getConnection();

            // Duplicate username checker
            PreparedStatement checkUsernamePs = conn.prepareStatement(checkUsernameSql);
            checkUsernamePs.setString(1, user.getUsername());
            ResultSet rsUsername = checkUsernamePs.executeQuery();
            if (rsUsername.next()) {
                return 1;
            }

            // Duplicate email checker
            PreparedStatement checkEmailPs = conn.prepareStatement(checkEmailSql);
            checkEmailPs.setString(1, user.getEmail());
            ResultSet rsEmail = checkEmailPs.executeQuery();
            if (rsEmail.next()) {
                return 2;
            }

            // Insert new user
            PreparedStatement insertPs = conn.prepareStatement(insertSql);
            insertPs.setString(1, user.getUsername());
            insertPs.setString(2, user.getEmail());
            insertPs.setString(3, user.getPassword());
            insertPs.executeUpdate();
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    @Override
    public boolean login(User user) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public int getUserIdByUsername(String username) {
        String sql = "SELECT USER_ID FROM USERS WHERE USERNAME = ?";
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("USER_ID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
