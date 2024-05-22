package com.company;

public class Book {

//    String ID;
    String title;
    String price;
    String author;
    String imageUrl;
    String detailUrl;

    String description;
    String cate;

    public Book() {
    }

    public Book( String title, String price, String author, String imageUrl, String detailUrl, String description, String cate) {
        this.cate = cate;
        this.title = title;
        this.price = price;
        this.author = author;
        this.imageUrl = imageUrl;
        this.detailUrl = detailUrl;
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDetailUrl() {
        return detailUrl;
    }

    public void setDetailUrl(String detailUrl) {
        this.detailUrl = detailUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return  title + "; " + author + "; " + imageUrl + "; " + price + "; " + cate + " ;" + description ;

    }
}
