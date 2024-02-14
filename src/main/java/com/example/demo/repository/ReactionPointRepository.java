package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.ReactionPoint;

@Mapper
public interface ReactionPointRepository {

    @Insert("INSERT INTO reactionPoint (regDate, updateDate, memberId, relTypeCode, relId, `point`) " +
            "VALUES (NOW(), NOW(), #{memberId}, #{relTypeCode}, #{relId}, #{point})")
    void insertReactionPoint(ReactionPoint reactionPoint);

    @Select("SELECT * FROM reactionPoint WHERE relId=#{relId}, relTypeCode=#{relTypeCode}, memberId = #{memberId}")
    ReactionPoint getReactionPointByMemberIdAndRelId(int memberId, int relId, String relTypeCode);

    @Select("SELECT * FROM reactionPoint WHERE relId=#{relId}, relTypeCode=#{relTypeCode}")
    List<ReactionPoint> getAllReactionPointsFromRel(int relId, String relTypeCode);

    @Update("UPDATE reactionPoint SET updateDate = Now(), `point` = #{point} WHERE id = #{id}")
    void updateReactionPoint(int point, int id);
    
//    @Delete("DELETE FROM reactionPoint WHERE id = #{id}")
//    void deleteReactionPoint(long id);

}