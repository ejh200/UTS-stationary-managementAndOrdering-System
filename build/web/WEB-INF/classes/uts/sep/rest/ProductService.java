/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.sep.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import uts.sep.Product;
import uts.sep.ProductApplication;
import uts.sep.Products;
import uts.sep.Manager;
import uts.sep.Managers;

/**
 *
 * @author gunny
 */
@Path("/productApp")
public class ProductService {
    @Context
    private ServletContext application;
    
    private ProductApplication getProductApp() throws JAXBException, IOException, Exception {
  // The web server can handle requests from different clients in parallel.
  // These are called "threads".
  // We do NOT want other threads to manipulate the application object at the same
  // time that we are manipulating it, otherwise bad things could happen.
  // The "synchronized" keyword is used to lock the application object while
  // we're manpulating it.
        synchronized (application) {
            ProductApplication productApp = (ProductApplication)application.getAttribute("productApp");
            if (productApp == null) {
                productApp = new ProductApplication(application.getRealPath("WEB-INF"));
                application.setAttribute("productApp", productApp);
            }
            return productApp;
        }
    }
    
    //REST Path Filters:
    //Path (show all products including duplicates): http://localhost:8080/assignment/rest/productApp/products
    //Path default (shows only unique): http://localhost:8080/assignment/rest/productApp/products?unique=true
    //Path Query by Name: http://localhost:8080/assignment/rest/productApp/products?productName=White+Paper
    //Path Query by Username: http://localhost:8080/assignment/rest/productApp/products?username=james
    
    //Filter products using Query Parameters:
    @GET
    @Path("products")
    @Produces(MediaType.APPLICATION_XML)
    public List<Product> getProducts(@QueryParam("productName") String productName, @QueryParam("username") String username, @QueryParam("unique") String unique) throws Exception {
        ProductApplication app = getProductApp();
        List<Product> products = new ArrayList<>(app.getProducts().getList());
        //Filter products by productName:
        if (productName != null && !productName.isEmpty()) {
            
            products = products.stream().filter(product -> product.getProductName().equals(productName)).collect(Collectors.toList());
            
        }
        
        
        //Filter products by manager username:
        if (username != null && !username.isEmpty()) {
            
            products = products.stream().filter(product -> product.getManager().equals(username)).collect(Collectors.toList());
            
        }
        //Remove duplicate products from list:
        if (unique != null) {
            //Filters to show unique product productNames only
            Set<Product> uniqueProducts = new HashSet<>();
            //Add unique products to list
            uniqueProducts.addAll(products);
            
            products = new ArrayList<>();
  
            products.addAll(uniqueProducts);
        }
        
        return products;
    }
    
    //Old PathParam filters:
    
    @GET
    @Path("products/manager/{manager}")
    @Produces(MediaType.APPLICATION_XML)
    public List<Product> getProductByManager(@PathParam("manager") String manager) throws IOException, Exception{
       //return getProductApp().getProducts().getProductByManager(manager);
       Predicate<Product> predicate = new Predicate<Product>() {
           @Override
           public boolean test(Product product) {
               return product.getManager().equals(manager);
           }
       };
       return getProductApp().getProducts().filter(predicate);
    }

}
