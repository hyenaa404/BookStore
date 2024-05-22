package com.carshowroom.model;

public class Contact{
    private int id;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String title;
    private String message;

    public Contact() {
    }

    public Contact(String fullName, String email, String phoneNumber, String title, String message) {
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.title = title;
        this.message = message;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
