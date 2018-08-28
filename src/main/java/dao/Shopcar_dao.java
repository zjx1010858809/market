package dao;

import java.util.List;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import Entity.Shopcar;
import until.SearchInfo;

@Repository
public interface Shopcar_dao {
	@Select("select c.*,u.email,p.fullname from  shopcar c inner join user u on c.user_id = u.id  inner join product p on c.product_id = p.id  ${where} ${limit}")
	public List<Shopcar> select(SearchInfo searchInfo);
}
