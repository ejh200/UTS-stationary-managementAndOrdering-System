/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.sep;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.*;

/**
 *
 * @author gunny
 */
@XmlRootElement(name = "managers")
@XmlAccessorType(XmlAccessType.FIELD)
public class Managers implements Serializable {

    @XmlElement(name = "manager")
    private ArrayList<Manager> list;

    public Managers() {
        this.list = new ArrayList<Manager>();
    }

    public ArrayList<Manager> getList() {
        return list;
    }

    //Add manager to list
    public void addManager(Manager manager) {
        list.add(manager);
    }

    //Add remove manager from list
    public void removeManager(Manager manager) {
        list.remove(manager);
    }

    //Login for manager composed of email and password
    public Manager login(String email, String password) {
        // For each manager in the list...
        for (Manager manager : list) {
            if (manager.getEmail().equals(email) && manager.getPassword().equals(password)) {
                return manager; // Login correct. Return this user.
            }
        }
        return null; // Login incorrect. Return null.
    }

    //Retrieve manager by their email
    public Manager getManager(String email) {
        // For each manager in the list...
        for (Manager manager : list) {
            if (manager.getEmail().equals(email)) {
                return manager;
            }
        }
        return null;
    }

}
