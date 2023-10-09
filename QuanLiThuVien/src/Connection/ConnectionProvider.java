package Connection;

import java.sql.*;

public class ConnectionProvider {

    private static Connection conn;

    private static String DB_USERNAME = "sa";
    private static String DB_PASSWORD = "12345678";
    private static String DB_SERVER = "localhost";
    private static String DB_SERVERNAME = "quanLiThuVien";
    
    public static Connection getConnection() {
        if (conn!=null) {
            return conn;
        } else {
            String urlConn = String.format("jdbc:sqlserver://%s;databaseName=%s;trustServerCertificate=true;",DB_SERVER,DB_SERVERNAME);
            try {
                 conn = DriverManager.getConnection(urlConn,DB_USERNAME,DB_PASSWORD);
                 return conn;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
    }

}
