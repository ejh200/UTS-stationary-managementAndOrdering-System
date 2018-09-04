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
 * @author james
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement

public class User implements Serializable {
    @XmlElement(name="email")
    private String email;
    @XmlElement(name="name")
    private String name;
    @XmlElement(name="password")
    private String password;

    public User() {
        super();
    }

    public User(String email, String name, String password) {
        super();
        this.email = email;
        this.name = name;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }    
    
    
    
    
}
