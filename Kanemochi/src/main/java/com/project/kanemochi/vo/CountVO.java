package com.project.kanemochi.vo;

public class CountVO {
	private int count_num;
	private String user_id;
	/*private String date;*/
	private int cafe;
	private int beer;
	private int ramen;
	private int cvs;
	private int sushi;
	private int dessert;
	private int bank;
	private int bus;
	private int movie;
	private int hospital;
	private int book;
	private int hair;
	private int clothes;
	private int burger;
	
	public CountVO() {
		super();
	}
	public CountVO(int count_num, String user_id, int cafe, int beer, int ramen, int cvs, int sushi, int dessert,
			int bank, int bus, int movie, int hospital, int book, int hair, int clothes, int burger) {
		super();
		this.count_num = count_num;
		this.user_id = user_id;
		this.cafe = cafe;
		this.beer = beer;
		this.ramen = ramen;
		this.cvs = cvs;
		this.sushi = sushi;
		this.dessert = dessert;
		this.bank = bank;
		this.bus = bus;
		this.movie = movie;
		this.hospital = hospital;
		this.book = book;
		this.hair = hair;
		this.clothes = clothes;
		this.burger = burger;
	}
	
	public int getCount_num() {
		return count_num;
	}
	public void setCount_num(int count_num) {
		this.count_num = count_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCafe() {
		return cafe;
	}
	public void setCafe(int cafe) {
		this.cafe = cafe;
	}
	public int getBeer() {
		return beer;
	}
	public void setBeer(int beer) {
		this.beer = beer;
	}
	public int getRamen() {
		return ramen;
	}
	public void setRamen(int ramen) {
		this.ramen = ramen;
	}
	public int getCvs() {
		return cvs;
	}
	public void setCvs(int cvs) {
		this.cvs = cvs;
	}
	public int getSushi() {
		return sushi;
	}
	public void setSushi(int sushi) {
		this.sushi = sushi;
	}
	public int getDessert() {
		return dessert;
	}
	public void setDessert(int dessert) {
		this.dessert = dessert;
	}
	public int getBank() {
		return bank;
	}
	public void setBank(int bank) {
		this.bank = bank;
	}
	public int getBus() {
		return bus;
	}
	public void setBus(int bus) {
		this.bus = bus;
	}
	public int getMovie() {
		return movie;
	}
	public void setMovie(int movie) {
		this.movie = movie;
	}
	public int getHospital() {
		return hospital;
	}
	public void setHospital(int hospital) {
		this.hospital = hospital;
	}
	public int getBook() {
		return book;
	}
	public void setBook(int book) {
		this.book = book;
	}
	public int getHair() {
		return hair;
	}
	public void setHair(int hair) {
		this.hair = hair;
	}
	public int getClothes() {
		return clothes;
	}
	public void setClothes(int clothes) {
		this.clothes = clothes;
	}
	public int getBurger() {
		return burger;
	}
	public void setBurger(int burger) {
		this.burger = burger;
	}
	
	@Override
	public String toString() {
		return "CountVO [count_num=" + count_num + ", user_id=" + user_id + ", cafe=" + cafe + ", beer=" + beer
				+ ", ramen=" + ramen + ", cvs=" + cvs + ", sushi=" + sushi + ", dessert=" + dessert + ", bank=" + bank
				+ ", bus=" + bus + ", movie=" + movie + ", hospital=" + hospital + ", book=" + book + ", hair=" + hair
				+ ", clothes=" + clothes + ", burger=" + burger + "]";
	}
	
}
