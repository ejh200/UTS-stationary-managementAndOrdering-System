/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.sep;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author james
 */
public class Validator {

//Schema validation for appropriate email, name and password fields
    private String emailPattern = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}";
    private String namePattern = "([A-Z][a-z]+[\\s])+[A-z][a-z]*";
    private String passwordPattern = "[a-z]{8,}[0-9]+";
    private HashMap<String, String> errors = new HashMap();

    public Validator() {
    }

    public void add(String key, String err) {
        errors.put(key, err);
    }
//Function to check if fields match schema

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }
//Check if login fields are empty

    public boolean checkEmpty(String email, String name, String password) {
        return password == null || name == email || name.isEmpty() || email.isEmpty() || password.isEmpty();
    }
//Check that email matches schema

    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }
//Check that name matches schema

    public boolean validateName(String name) {
        return validate(namePattern, name);
    }
//Check that password matches schema

    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }

    public boolean testOption(String type) {
        return type != null;
    }

}
