package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Entity.Operator;
import until.SearchInfo;

@Repository
public interface Operator_dao {
	@Select("select * from operator ${where} ${limit}")
	public List<Operator> select(SearchInfo searchInfo);
	
	@Delete("delete from operator where id = #{id}")
	public void delete(int id);
	
	@Update("update operator set nike = #{nike} , password=#{password},name=#{name},sex=#{sex},tel=#{tel},power=#{power},status=#{status},comments=#{comments} where id= #{id}")
	public void update(Operator operator);
	
	@Insert("insert into operator(nike,password,name,sex,tel,power,status,comments) value (#{nike},#{password},#{name},#{sex},#{tel},#{power},#{status},#{comments})")
	public void insert(Operator operator);
}
