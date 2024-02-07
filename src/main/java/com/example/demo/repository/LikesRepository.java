package com.example.demo.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LikesRepository {
	
	//get
	@Select("""
			SELECT IF(COUNT(1)>0, 1, 0) FROM LIKES WHERE articleId=#{articleId} AND memberId=#{memberId}
			
			""")
	public boolean isLiked(int articleId, int memberId);
	
	
	//insert
	@Insert("""
			INSERT INTO LIKES(articleId, memberId)  VALUES(#{articleId}, #{memberId})
			""")
	public int insertLikes(int articleId, int memberId);
	
	//delete
	@Delete("""
			DELETE FROM LIKES WHERE articleId=#{articleId} AND memberId=#{memberId}
			""")
	public int deleteLikes(int articleId, int memberId);

}
