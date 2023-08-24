package com.spring.alleating.cart.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component("cartVO")
public class CartVO {
	private int cartId;
	private int productId;
	private String id;
	private int cart_product_qty;
	private Date creDate;
	
	
	private String deliveryType;
	private int deliveryPrice;
	private String cateCode;
	private String productName;
	private int productPrice;
	private int productDiscount;
	private int productSalesPrice;
	private String productPackType;
	private String productStatus;
	private String productBrand;
	private String fileName;
	
	private int oneProductPrice;
	
	
	public int getOneProductPrice() {
		return oneProductPrice;
	}
	public void setOneProductPrice(int oneProductPrice) {
		this.oneProductPrice = oneProductPrice;
	}
	public String getDeliveryType() {
		return deliveryType;
	}
	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductDiscount() {
		return productDiscount;
	}
	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}
	public int getProductSalesPrice() {
		return productSalesPrice;
	}
	public void setProductSalesPrice(int productSalesPrice) {
		this.productSalesPrice = productSalesPrice;
	}

	public String getProductPackType() {
		return productPackType;
	}
	public void setProductPackType(String productPackType) {
		this.productPackType = productPackType;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCart_product_qty() {
		return cart_product_qty;
	}
	public void setCart_product_qty(int cart_product_qty) {
		this.cart_product_qty = cart_product_qty;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	
	
}
