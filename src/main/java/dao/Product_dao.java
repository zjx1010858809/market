package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Entity.Product;
import until.SearchInfo;

@Repository
public interface Product_dao {
	@Select("select p.* , t.name type_name from product p inner join type t on p.type_id = t.id  ${where} ${limit}")
	public List<Product> select(SearchInfo searchInfo);
	
	@Delete("delete from product where id = #{id}")
	public void delete(int id);
	
	@Update("update product set fullname = #{fullname}, type_id=#{type_id},activity=#{activity},tip=#{tip},sale=#{sale},info=#{info},price=#{price},nowprice=#{nowprice},salecount=#{salecount},collectcount=#{collectcount},priority=#{priority},status=#{status},pics=#{pics},comments=#{comments} where id= #{id}")
	public void update (Product product);
	
	@Insert("insert into product (fullname,type_id,activity,tip,sale,info,price,nowprice,salecount,collectcount,priority,status,pics,comments) value "
		                 + "( #{fullname},#{type_id},#{activity},#{tip},#{sale},#{info},#{price},#{nowprice},#{salecount},#{collectcount},#{priority},#{status},#{pics},#{comments})")
	public void insert (Product product);

}
