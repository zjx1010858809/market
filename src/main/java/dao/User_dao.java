package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Entity.User;
import until.SearchInfo;
@Repository
public interface User_dao {
	@Select("select * from user ${where} ${limit}")
	public List<User> select(SearchInfo searchInfo);
	
	@Delete("delete from user where id = #{id}")
	public void delete(int id);
	
	@Update("update user set email = #{email} , password=#{password},tel=#{tel},level=#{level},amount=#{amount},status=#{status},comments=#{comments} where id= #{id}")
	public void update(User user);
	
	@Insert("insert into user(email,password,tel,level,amount,status,comments) value (#{email},#{password},#{tel},#{level},#{amount},#{status},#{comments})")
	public void insert(User user);
}
