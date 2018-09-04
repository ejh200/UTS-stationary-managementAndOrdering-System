/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.sep;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import javax.xml.bind.annotation.*;

/**
 *
 * @author gunny
 */

@XmlRootElement(name="products", namespace="http://www.uts.edu.au/31284/sep-products")
@XmlAccessorType(XmlAccessType.FIELD)
public class Products implements Serializable {
    
    @XmlElement(name="product")
    private List<Product> list = new ArrayList<>();
    
    public Products(){}
    
    
    public List<Product> getList() {
        return list;
    }
    //Add product to list
    public void addProduct(Product product) {
        list.add(product);
    }
    //Remove product from list
    public void removeProduct(Product product) {
        list.remove(product);
    }
    //Retrieve product by its ID
    public Product getProductByID(int id) {
        // For each product in the list...
        for (Product product : list) {
            //Return product if ID matches requested ID
            if (product.getID() == id)
                return product; 
        }
        return null; 
    }
    //Retrieve products by their manager
    public Product getProductByManager(String manager) {
        // For each product in the list...
        for (Product product : list) {
            //Return product if manager matches requested manager
            if (product.getManager().equals(manager))
                return product; 
        }
        return null; 
    }
    
    
    
    public Product lookup(Predicate<Product> condition) {
        for (Product product : list) {
            if (condition.test(product)) {
                return product;
            }
        }
        return null;
    }
    
    public List<Product> filter(Predicate<Product> condition) {
        List<Product> products = new ArrayList<>();
        for (Product product : list) {
            if (condition.test(product)) {
                products.add(product);
            }
        }
        return products;
    }
    
    //Generate new product ID for each added product
    public int getNextProductID() {
        return list.size() + 1;
    }
          
}
