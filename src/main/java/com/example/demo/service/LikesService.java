package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.LikesRepository;

@Service
public class LikesService {
	@Autowired
	private LikesRepository likesRepository;
	

	public Boolean isLiked(int id, int loginedMemberId) {
		// TODO Auto-generated method stub
		return likesRepository.isLiked(id, loginedMemberId);
	}


	public void insertLikes(int id, int loginedMemberId) {
		// TODO Auto-generated method stub
		likesRepository.insertLikes(id, loginedMemberId);
	}

	
	public void deleteLikes(int id, int loginedMemberId) {
		// TODO Auto-generated method stub
		likesRepository.deleteLikes(id, loginedMemberId);
	}

}
