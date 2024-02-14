package com.example.demo.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Getter
public class Comment {
    private int id;
    private int memberId;
    private String body;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
    private int articleId;
    private int parentId;
    private int originalParentId;
}
