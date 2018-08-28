package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Entity.Type;
import until.SearchInfo;

@Repository
public interface Type_dao {
	@Select("select * from type ${where}")
	public List<Type> select(SearchInfo searchInfo);
	
	@Delete("delete from type where id = #{id}")
	public void delete(int id);
	
	@Update("update type set name = #{name}, parentid =#{parentid} where id= #{id}")
	public void update(Type type);
	
	@Insert("insert into type(name,parentid) value (#{name},#{parentid})")
	public void insert(Type type);
}
