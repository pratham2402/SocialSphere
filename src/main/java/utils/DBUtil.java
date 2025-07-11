package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static final Connection connection;

    public static Connection getConnection() {
        return connection;
    }

    static {
        try {
            Class.forName("org.h2.Driver");
            connection = DriverManager.getConnection(
                "jdbc:h2:file:/home/hypersonic-compiler/IdeaProjects/SocialSphere/db/SocialSphereDB",
                "sa", "");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to connect to the database", e);
        }
    }
}
