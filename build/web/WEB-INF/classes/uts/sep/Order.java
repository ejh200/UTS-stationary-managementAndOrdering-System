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
 * @author gunny
 */
//@XmlRootElement(name="order")
@XmlAccessorType(XmlAccessType.FIELD) //by default will use the same field name as element name
public class Order implements Serializable{
    //Match order attributes with reservatoins.xml
    @XmlElement(name = "id") 
    private int id;
    @XmlElement(name = "productID") 
    private int productID;
    @XmlElement(name = "productName") 
    private String productName;
    @XmlElement(name = "user") 
    private String user;
    @XmlElement(name = "email") 
    private String email;
    @XmlElement(name = "managerusername") 
    private String managerusername;

    public Order() {
        super();
    }

    public Order(int id, int productID, String productName, String user, String email, String managerusername) {
        this.id = id;
        this.productID = productID;
        this.productName = productName;
        this.user = user;
        this.email = email;
        this.managerusername = managerusername;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getManagerusername() {
        return managerusername;
    }

    public void setManagerusername(String managerusername) {
        this.managerusername = managerusername;
    }
    
    
   
    
}
