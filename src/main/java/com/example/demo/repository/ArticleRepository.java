package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Article;

@Mapper
public interface ArticleRepository {

	@Insert("""
			INSERT INTO
			article SET
			regDate = NOW(),
			updateDate = NOW(),
			memberId = #{memberId},
			title = #{title}, `body` = #{body}
			""")
	public void writeArticle(int memberId, String title, String body);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT *
			FROM article
			WHERE id = #{id}
			""")
	public Article getArticle(int id);

	@Select("""
			SELECT A.*, M.nickname AS extra__writer
			FROM article AS A
			INNER JOIN `member` AS M
			ON A.memberId = M.id
			WHERE A.id = #{id}
				""")
	public Article getForPrintArticle(int id);

	@Delete("DELETE FROM article WHERE id = #{id}")
	public void deleteArticle(int id);

	@Update("""
			UPDATE article
				<set>
					<if test="title != null and title != ''">title = #{title},</if>
					<if test="body != null and body != ''">`body` = #{body},</if>
					updateDate = NOW()
				</set>
			WHERE id = #{id}
				""")
	public void modifyArticle(int id, String title, String body);

	@Select("""
			SELECT A.*, M.nickname AS extra__writer
			FROM article AS A
			INNER JOIN `member` AS M
			ON A.memberId = M.id
			ORDER BY A.id DESC
			""")
	public List<Article> getArticles();

//	@Select("""
//			<script>
//			SELECT A.*, M.nickname AS extra__writer
//			FROM article AS A
//			INNER JOIN `member` AS M
//			ON A.memberId = M.id
//			WHERE 1
//			<if test="boardId != 0">
//				AND A.boardId = #{boardId}
//			</if>
//			ORDER BY A.id DESC
//			</script>
//			""")
//	public List<Article> getForPrintArticles(int boardId);

	@Select("""
			<script>
			SELECT COUNT(1) AS cnt
			FROM article A
			INNER JOIN `member` AS M
			ON A.memberId = M.id
			WHERE 1
			<if test="boardId != 0">
				AND boardId = #{boardId}
			</if>
			<if test="search!=null and !search.equals('')">
			    <choose>
				    <when test="searchType==1">
					    AND title like CONCAT('%', #{search}, '%')
					</when>
				    <when test="searchType==2">
					    AND `body` like CONCAT('%', #{search}, '%')
					</when>
				    <when test="searchType==3">
					    AND M.nickname like CONCAT('%', #{search}, '%')
					</when>
					<otherwise>
					    AND title like CONCAT('%', #{search}, '%')
					    OR `body` like CONCAT('%', #{search}, '%')
					</otherwise>
				</choose>
			</if>
			</script>
			""")
	public int getArticlesCount(int boardId, String search, int searchType);

	@Select("""
			<script>
			SELECT A.*, M.nickname AS extra__write, COUNT(L.id) AS likeCount
			FROM article AS A
			INNER JOIN `member` AS M
			ON A.memberId = M.id
			LEFT OUTER JOIN LIKES L
			ON A.id = L.articleId
			WHERE 1
			<if test="boardId != 0">
				AND A.boardId = #{boardId}
			</if>
			<if test="search!=null and !search.equals('')">
			    <choose>
				    <when test="searchType==1">
					    AND title like CONCAT('%', #{search}, '%')
					</when>
				    <when test="searchType==2">
					    AND `body` like CONCAT('%', #{search}, '%')
					</when>
				    <when test="searchType==3">
					    AND M.nickname like CONCAT('%', #{search}, '%')
					</when>
					<otherwise>
					    AND title like CONCAT('%', #{search}, '%')
					    OR `body` like CONCAT('%', #{search}, '%')
					</otherwise>
				</choose>
			</if>
			GROUP BY A.id
			ORDER BY A.id DESC
			<if test="limitFrom >= 0 ">
				LIMIT #{limitFrom}, #{limitTake}
			</if>
			</script>
			""")
	public List<Article> getForPrintArticles(int boardId, int limitFrom, int limitTake, String search , int searchType);

	@Update("""
			UPDATE ARTICLE SET  viewCount=(IFNULL(viewCount,0) +1) WHERE id = #{id};
			""")
	public void updateViewCount(int id);

}
