/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.sep;

import java.io.Serializable;
import java.util.Objects;
import javax.xml.bind.annotation.*;

/**
 *
 * @stock gunny
 */
@XmlRootElement(name = "product", namespace = "http://www.uts.edu.au/31284/sep-products")
@XmlAccessorType(XmlAccessType.FIELD) //by default will use the same field name as element name
public class Product implements Serializable {
    //Match product attributes with products.xml
    @XmlElement(name = "id")
    private int id;
    @XmlElement(name = "productName")
    private String productName;
    @XmlElement(name = "stock")
    private String stock;
    @XmlElement(name = "price")
    private String price;
    @XmlElement(name = "description")
    private String description;
    @XmlElement(name = "manager-username")
    private String manager;

    public Product(int id, String productName, String stock, String price, String description, String manager) {
        this.id = id;
        this.productName = productName;
        this.stock = stock;
        this.price = price;
        this.description = description;
        this.manager = manager;
    }

    public Product() {

    }

    public int getID() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getdescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    @Override //Check products with amatching description
    public boolean equals(Object other) {
        if (other == null) {
            return false;
        }
        if (other == this) {
            return true;
        }
        if (other instanceof Product) {
            Product product = (Product) other;
            return description == product.description;
        }
        return false;
    }

    @Override //Hashcode for description
    public int hashCode() {
        return Objects.hash(description);
    }

}
