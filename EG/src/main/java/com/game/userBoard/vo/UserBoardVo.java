package com.game.userBoard.vo;

import com.game.utill.pageinfo.PageMaker;

public class UserBoardVo extends PageMaker{
	
	private Integer board_num;
	private String title;
	private String contents;
	private String user_id;
	private String file;
	private String cotegory;
	private Integer cnt;
	private String created;
	private String search_text;
	private String searchCategory;
	private String searchSort;
	private String searchOption;
	
	
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public String getSearchSort() {
		return searchSort;
	}
	public void setSearchSort(String searchSort) {
		this.searchSort = searchSort;
	}
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public Integer getBoard_num() {
		return board_num;
	}
	public void setBoard_num(Integer board_num) {
		this.board_num = board_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getCotegory() {
		return cotegory;
	}
	public void setCotegory(String cotegory) {
		this.cotegory = cotegory;
	}
	public Integer getCnt() {
		return cnt;
	}
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getSearch_text() {
		return search_text;
	}
	public void setSearch_text(String search_text) {
		this.search_text = search_text;
	}
	

}
