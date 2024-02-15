package com.example.demo.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
	private int id;
    private int memberId;
    private String body;
    private String regDate;
    private String updateDate;
    private int articleId;
    private Integer parentId;
    private Integer originalParentId;
    
	public Comment(int memberId, String body, int articleId, Integer parentId, Integer originalParentId) {
		super();
		this.memberId = memberId;
		this.body = body;
		this.articleId = articleId;
		this.parentId = parentId;
		this.originalParentId = originalParentId;
	}
    
    
}
