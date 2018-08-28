package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Entity.Orders;
import until.SearchInfo;

@Repository
public interface Order_dao {
	@Select("select o.*,u.email,a.addr from  orders o inner join user u on o.user_id = u.id  inner join address a on o.address_id = a.id  ${where} ${limit}")
	public List<Orders> select(SearchInfo searchInfo);
	
	@Delete("delete from orders where id = #{id}")
	public void delete(int id);
	
	@Update("update orders set status = #{status} where id= #{id}")
	public void update (Orders orders);
	
	@Insert("insert into orders (user_id,date,status,code,amount,nowamount,comments,assessstatus) value "
		                 + "( #{user_id},#{date},#{status},#{code},#{amount},#{nowamount},#{comments},#{assessstatus})")
	public void insert (Orders orders);
}
