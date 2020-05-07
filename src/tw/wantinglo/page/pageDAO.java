//package tw.wantinglo.page;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.stereotype.Repository;
//
//@Repository
//public class pageDAO {
//
//	    @Autowired
//	    private JdbcTemplate jdbcTemplate;
//
//	    /* 
//	     * 获得总记录数
//	     */
//	    @SuppressWarnings("deprecation")
//	    public int getTotalRecord(String sql, Object... arrayParameters) {
//	        int totalRecord = jdbcTemplate.queryForInt(sql, arrayParameters);
//	        return totalRecord;
//	    }
//
//	    /* 
//	     * 获取当前页数据
//	     */
//	    @SuppressWarnings("unchecked")
//	    public Page getPage(int pageNum, Class clazz, String sql, int totalRecord, Object... parameters) {
//	        Page page = new Page(pageNum, totalRecord);
//	        sql = sql+" limit "+page.getStartIndex()+","+page.getPageSize();
//	        List list=jdbcTemplate.query(sql, parameters, ParameterizedBeanPropertyRowMapper.newInstance(clazz));    
//	        page.setList(list);
//	        return page;
//	    }
//	}
//}
