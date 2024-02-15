package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Comment;

@Mapper
public interface CommentRepository {

    // Create
    @Insert("INSERT INTO Comment (memberId, body, regDate, updateDate, articleId, parentId, originalParentId) " +
            "VALUES (#{memberId}, #{body}, NOW(), NOW(), #{articleId}, #{parentId}, #{originalParentId})")
    @Options(useGeneratedKeys=true, keyProperty = "id")
    public int insertComment(Comment comment);

    // Read
    @Select("SELECT * FROM Comment WHERE id = #{id}")
    public Comment getCommentById(int id);

    @Select("""
    		<script>
    		   SELECT * FROM Comment 
    		       WHERE articleId = #{articleId}
    		             AND parentId IS NULL
    		       <if test="currentCommentId != null">
    		             AND id &lt; #{currentCommentId}
    		       </if>
    		       ORDER BY id DESC LIMIT #{limit}
    		</script>
    		""")
    public List<Comment> getRecentCommentsWithoutParentId(int articleId, int limit, Integer currentCommentId);

    @Select("""
    		<script>
    		SELECT c.* FROM Comment c JOIN Comments cp ON c.originalParentId = cp.id WHERE 
    		<foreach collection="ids" item="id" open="(" separator="," close=")">
              #{id}
            </foreach>
    		</script>
    		
    		""")
    public List<Comment> getCommentsWithOriginalParentId(List<Integer> ids);

    // Update
    @Update("UPDATE Comment SET body = #{body}, " +
            "updateDate = NOW(), " +
            "WHERE id = #{id}")
    public void updateComment(Comment comment);

    // Delete
    @Delete("DELETE FROM Comment WHERE id = #{id}")
    public void deleteComment(long id);
}