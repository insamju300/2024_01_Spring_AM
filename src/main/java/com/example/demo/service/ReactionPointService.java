package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ReactionPointRepository;
import com.example.demo.vo.ReactionPoint;

@Service
public class ReactionPointService {
	
	@Autowired
	ReactionPointRepository reactionPointRepository;

	public ReactionPoint getReactionPointByMemberIdAndRelId(int memberId, int relId, String relTypeCode) {
		// TODO Auto-generated method stub
		return reactionPointRepository.getReactionPointByMemberIdAndRelId(memberId, relId, relTypeCode);
	}

	public void insertReactionPoint(ReactionPoint reactionPoint) {
		// TODO Auto-generated method stub
		reactionPointRepository.insertReactionPoint(reactionPoint);
	}

	public void updateReactionPoint(int point, int id) {
		// TODO Auto-generated method stub
		reactionPointRepository.updateReactionPoint(point, id);
	}

}
