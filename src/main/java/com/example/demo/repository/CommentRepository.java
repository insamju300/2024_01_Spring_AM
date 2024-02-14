package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Comment;

@Mapper
public interface CommentRepository {

    // Create
    @Insert("INSERT INTO Comments (memberId, body, regDate, updateDate, articleId, parentId, originalParentId) " +
            "VALUES (#{memberId}, #{body}, NOW(), NOW(), #{articleId}, #{parentId}, #{originalParentId})")
    void insertComment(Comment comment);

    // Read
    @Select("SELECT * FROM Comments WHERE id = #{id}")
    Comment getCommentById(int id);

    @Select("SELECT * FROM Comments")
    List<Comment> getAllComments();

    @Select("SELECT * FROM Comments WHERE parentId IS NULL ORDER BY regDate DESC LIMIT #{limitFrom}, #{limitTo}")
    List<Comment> getRecentCommentsWithoutParentId(int limitFrom, int limitTo);

    @Select("SELECT c.* FROM Comments c JOIN Comments cp ON c.originalParentId = cp.id WHERE cp.id = #{id}")
    List<Comment> getCommentsWithOriginalParentId(int id);

    // Update
    @Update("UPDATE Comments SET body = #{body}, " +
            "updateDate = NOW(), " +
            "articleId = #{articleId}, parentId = #{parentId}, originalParentId = #{originalParentId} " +
            "WHERE id = #{id}")
    void updateComment(Comment comment);

    // Delete
    @Delete("DELETE FROM Comments WHERE id = #{id}")
    void deleteComment(long id);
}