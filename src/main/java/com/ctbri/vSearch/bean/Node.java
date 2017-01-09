package com.ctbri.vSearch.bean;

public class Node {
	private String name;
	private Integer category;
	private Double value;
	private String label;

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category){
		this.category=category;
	}	
	
	public void setCategory(String category) {
		if(category==null||category.equals("")){
			return;
		}
		if(category.equals("person")){
			this.category = 1;
		}else if(category.equals("location")){
			this.category = 2;
		}else if(category.equals("institution")){
			this.category = 3;
		}else if(category.equals("tech")){
			this.category = 4;
		}else {
			this.category = 5;
		}
		
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}
}
