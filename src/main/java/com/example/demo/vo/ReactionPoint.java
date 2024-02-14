package com.example.demo.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReactionPoint {

	private int id;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
    private int memberId;
    private String relTypeCode;
    private int relId;
    private int point;
    private int goodRequestPoint;
    private int badRequestPoint;
    private int sumRequestPoint;
    
    public ReactionPoint(int memberId, String relTypeCode, int relId, int point) {
		this.memberId = memberId;
		this.relTypeCode = relTypeCode;
		this.relId = relId;
		this.point = point;
	}
}
