/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.sep;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

/**
 *
 * @author gunny
 */
@XmlAccessorType(XmlAccessType.FIELD) //by default will use the same field name as element name
@XmlRootElement
public class Manager implements Serializable {
    //Match manager attributes with managers.xml
    @XmlAttribute(name = "username") 
    private String username;
    @XmlElement(name = "name") 
    private String name;
    @XmlElement(name = "email") 
    private String email;
    @XmlElement(name = "password") 
    private String password;
    @XmlElement(name = "dob") 
    private String dob;
    
    public Manager() {
        super();
        
    }

    public Manager(String username, String name, String email, String password, String dob) {
        this.username = username;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
      
    public String getDOB() {
        return dob;
    }

    public void setDOB(String password) {
        this.dob = dob;
    }
    
}
