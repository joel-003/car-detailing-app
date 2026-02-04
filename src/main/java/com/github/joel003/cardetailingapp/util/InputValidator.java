package com.github.joel003.cardetailingapp.util;

import com.github.joel003.cardetailingapp.exception.InvalidInputException;

public class InputValidator {

    public static String validateName(String name) throws InvalidInputException {

       if(name == null || name.trim().isEmpty()){
           throw new InvalidInputException("Name is empty");
       }
       else if(!(name.matches("^(?=.{3,}$)[A-Za-z]+(?: [A-Za-z]+)*$"))){
           throw new InvalidInputException("Name is invalid");
       }
       return name;
    }

    public static String validateEmail(String email) throws InvalidInputException {
        if(email == null || email.trim().isEmpty()){
            throw new InvalidInputException("Email is null or empty");
        }
        else if(!(email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"))){
            throw new InvalidInputException("Email is invalid");
        }
        return email;
    }


    public static String validatePassword(String password) throws InvalidInputException {
        if(password == null || password.trim().isEmpty()){
            throw new InvalidInputException("Password is null or empty");
        }
        else if (!(password.matches("^[A-Za-z0-9@#$%^&+=!]{6,}$"))){
            throw new InvalidInputException("Password is invalid");
        }
        return password;
    }


    public static String validatePhone(String phone) throws InvalidInputException {
        if(phone == null || phone.trim().isEmpty()){
            throw new InvalidInputException("Phone is null or empty");
        }else if(!(phone.matches("^[6-9]\\d{9}$"))){
            throw new InvalidInputException("Phone is invalid");
        }
        return phone;
    }

    public static String validateAddress(String address) throws InvalidInputException {
        if(address == null || address.trim().isEmpty()){
            throw new InvalidInputException("Address is null or empty");
        }
        else if(address.length()<10){
            throw new InvalidInputException("Address is invalid");
        }
        return address;
    }
}
