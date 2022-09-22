package com.uni.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.uni.domain.trendVO;

public interface BoardMapper {

	

	//@Select("select * from (select * from Customers where userid='${vo.getUserid}' and userpw='${vo.getUserpw}' order by rownum desc) where rownum=1")
	//public customerVO login(@Param("vo") customerVO vo );
	
	//@Insert("insert into member values(mem_seq.nextval, '${userid}', '${userpw}')")
	//public void join(@Param("userid") String userid, @Param("userpw") String userpw);

	@Select("select * from trend_analysis where gender='f'")
	public List<trendVO> selectTrendFemale();
	
	@Select("select * from trend_analysis where gender='m'")
	public List<trendVO> selectTrendMale();
	
	@Select("select * from trend_analysis")
	public List<trendVO> selectTrendAll();
	
}
