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
