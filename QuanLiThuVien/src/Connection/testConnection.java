package Connection;
import java.sql.*;
/**
 *
 * @author trant
 */
public class testConnection {
   private static Connection conn = ConnectionProvider.getConnection();
    public static void main(String[] args) {
        String sql = "SELECT TENTHELOAI FROM THELOAI";
        try {
            Statement stmt  = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {                
                System.out.println(rs.getString("TENTHELOAI"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
