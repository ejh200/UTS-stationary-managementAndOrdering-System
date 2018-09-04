/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.sep;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import javax.xml.bind.*;

/**
 *
 * @author gunny
 */
public final class ProductApplication implements Serializable {

    //directory (i.e. WEB-INF) and filepaths for managers and products
    private String directory, managersFilepath, productsFilepath, ordersFilepath;

    private Managers managers;
    private Products products;
    private Orders orders;

    public ProductApplication() {

    }

    public ProductApplication(String directory) throws Exception {
        this(directory, "/managers.xml", "/products.xml", "/orders.xml");
    }

    public ProductApplication(String directory, String managersFilepath, String productsFilepath, String ordersFilepath) throws Exception {
        setDirectory(directory);
        setManagersFilepath(managersFilepath);
        setProductsFilepath(productsFilepath);
        setOrdersFilepath(ordersFilepath);
    }

    //Unmarshalls/loads from XML filepath (either products or managers) from directory
    private <T> T loadFromXml(Class<T> clazz, String filepath) throws Exception {
        JAXBContext jc = JAXBContext.newInstance(clazz);
        Unmarshaller u = jc.createUnmarshaller();

        // Now unmarshal the object from the files
        try (FileInputStream fin = new FileInputStream(directory + filepath)) {
            return (T) u.unmarshal(fin);
        }
    }

    //Marshalls/saves to XML filepath (either products or managers) to..
    private <T> void saveToXml(Class<T> clazz, T object, String filepath) throws Exception {
        JAXBContext jc = JAXBContext.newInstance(clazz);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

        try (FileOutputStream fout = new FileOutputStream(directory + filepath)) {
            m.marshal(object, fout);
        }
    }

    //Update XML from saveToXML
    public void updateXML() throws Exception {
        saveToXml(Products.class, products, productsFilepath);
        saveToXml(Managers.class, managers, managersFilepath);
        saveToXml(Orders.class, orders, ordersFilepath);
    }

    //method to check matching login
    public boolean loginMatches(String email, String password) {
        return managers.login(email, password) != null;
    }

    public Managers getManagers() {
        return managers;
    }

    public void setManagers(Managers managers) {
        this.managers = managers;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public String getDirectory() {
        return directory;
    }

    public void setDirectory(String directory) {
        this.directory = directory;
    }

    public String getManagersFilepath() {
        return managersFilepath;
    }

    public void setManagersFilepath(String managersFilepath) throws Exception {
        this.managersFilepath = managersFilepath;
        this.managers = loadFromXml(Managers.class, managersFilepath);
    }

    public String getProductsFilepath() {
        return productsFilepath;
    }

    public void setProductsFilepath(String productsFilepath) throws Exception {
        this.productsFilepath = productsFilepath;
        this.products = loadFromXml(Products.class, productsFilepath);
    }

    public String getOrdersFilepath() {
        return ordersFilepath;
    }

    public void setOrdersFilepath(String ordersFilepath) throws Exception {
        this.ordersFilepath = ordersFilepath;
        this.orders = loadFromXml(Orders.class, ordersFilepath);
    }

}
