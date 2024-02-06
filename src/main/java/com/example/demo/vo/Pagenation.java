package com.example.demo.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Pagenation {
	int itemsPerPage;
	int pagesInBlock;
	int currentPage;
	int totalItem;
	int totalPage;
	int preBlockLastPage;
	int startPage;
	int endPage;
	int firstItemIndex;
    
	public Pagenation(int itemsPerPage, int pagesInBlock, int currentPage, int totalItem) {
		this.itemsPerPage=itemsPerPage;
		this.pagesInBlock=pagesInBlock;
		this.currentPage = currentPage;
		this.totalItem = totalItem;
        this.totalPage = (int) (Math.ceil(totalItem/(double)itemsPerPage));
        
        this.startPage = currentPage - (pagesInBlock/2);
        if(startPage<1) {
        	startPage = 1;
        }
        
        this.endPage = startPage + (pagesInBlock-1);
        
        if(endPage> totalPage) {
        	endPage = totalPage;
        	
        	if(!(endPage-(pagesInBlock-1) < 1 )) {
        		startPage=endPage - (pagesInBlock-1);
        	}
        }
        
        
//		this.preBlockLastPage= ((currentPage-1)/pagesInBlock)*pagesInBlock;
//		this.startPage = preBlockLastPage +1;
//		if(startPage<1) {
//			startPage=1;
//		}
//		this.endPage = startPage+pagesInBlock-1;
//		if(this.endPage>this.totalPage) {
//			this.endPage = this.totalPage;
//		}
		this.firstItemIndex = (currentPage-1)*itemsPerPage;
	}
	
}
