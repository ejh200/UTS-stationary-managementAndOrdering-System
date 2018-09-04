/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.sep;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author valentina
 */
@XmlRootElement(name = "orders")
@XmlAccessorType(XmlAccessType.FIELD)
public class Orders implements Serializable {

    @XmlElement(name = "order")
    private ArrayList<Order> list;

    public Orders() {
        this.list = new ArrayList<Order>();
    }

    public ArrayList<Order> getList() {
        return list;
    }

    //Add order to orders list
    public void addOrder(Order order) {
        list.add(order);
    }

    //Add order from order list
    public void removeOrder(Order order) {
        list.remove(order);
    }

    //Generate new order ID
    public int getNextOrderID() {
        return list.size() + 1;
    }

}
