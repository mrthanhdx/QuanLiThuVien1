package Service;

import Model.TheLoai;
import java.util.List;

/**
 *
 * @author trant
 */
public interface TheLoaiService {
    
    public boolean add(TheLoai theLoai);
    
    public void delete(TheLoai theLoai);
    
    public void update(TheLoai theLoai);
    
    public List<TheLoai> getTheLoais ();
    
    public List<TheLoai> getListPage(int PageNo,int step);
    
}
