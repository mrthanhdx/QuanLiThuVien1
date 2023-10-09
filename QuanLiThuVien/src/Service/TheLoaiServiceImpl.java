package Service;

import Model.TheLoai;
import java.util.List;
import java.sql.*;
import Connection.ConnectionProvider;
import java.util.ArrayList;

/**
 *
 * @author trant
 */
public class TheLoaiServiceImpl implements TheLoaiService {

    Connection conn = ConnectionProvider.getConnection();

    @Override
    public boolean add(TheLoai theLoai) {
        String sql = "INSERT INTO THELOAI(MATHELOAI,TENTHELOAI) VALUES(?,?)";
        try {

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, theLoai.getMaTheLoai());
            stmt.setString(2, theLoai.getTenTheLoai());
            stmt.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void delete(TheLoai theLoai) {
        String sql = "delete from THELOAI where id = ?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, theLoai.getID());
            stmt.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(TheLoai theLoai) {
        String sql = "update THELOAI SET MATHELOAI=?,TENTHELOAI=? WHERE ID =?";
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, theLoai.getMaTheLoai());
            stmt.setString(2, theLoai.getTenTheLoai());
            stmt.setInt(3, theLoai.getID());
            stmt.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

  
    @Override
    public List<TheLoai> getTheLoais() {
        List<TheLoai> list = new ArrayList<>();
        String sql = "select ID,MATHELOAI, TENTHELOAI from THELOAI";
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                TheLoai theLoai = new TheLoai();
                theLoai.setID(rs.getInt("ID"));
                theLoai.setMaTheLoai(rs.getString("MATHELOAI"));
                theLoai.setTenTheLoai(rs.getString("TENTHELOAI"));
                list.add(theLoai);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<TheLoai> getListPage(int PageNo, int step) {
        String sql = "select * from THELOAI order by ID offset ? ROWS  FETCH  NEXT ? ROWS ONLY";
        try {
            List<TheLoai> list = new ArrayList<>();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, (PageNo - 1) * step);
            stmt.setInt(2, step);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                TheLoai theLoai = new TheLoai();
                theLoai.setID(rs.getInt("ID"));
                theLoai.setMaTheLoai(rs.getString("MATHELOAI"));
                theLoai.setTenTheLoai(rs.getString("TENTHELOAI"));
                list.add(theLoai);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
