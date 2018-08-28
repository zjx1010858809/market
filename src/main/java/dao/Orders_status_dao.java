package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Entity.Orders_status;
import until.SearchInfo;

@Repository
public interface Orders_status_dao {
	
	@Select("select os.* from orders_status os inner join orders o on os.orders_id = o.id  ${where}")
	public List<Orders_status> select(SearchInfo searchInfo);
	
	@Delete("delete from orders_status where id = #{id}")
	public void delete(int id);
	
	@Update("update orders_status set dest_status = #{dest_status} where id= #{id}")
	public void update (Orders_status orders_status);
	
	@Insert("insert into orders_status (orders_id,date,dest_status,info,num,amount,comments) value "
		                 + "( #{orders_id},#{date},#{dest_status},#{info},#{num},#{amount},#{comments})")
	public void insert (Orders_status orders_status);

}
