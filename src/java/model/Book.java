package model;

/**
 *
 * @author LENOVO
 */
public class Book {
    int id;
    String title;
    String author;
    String descrip;
    int quantity;
    double price;
    int cateId;

    public Book() {
    }

    public Book(int id, String title, String author, String descrip, int quantity, double price, int cateId) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.descrip = descrip;
        this.quantity = quantity;
        this.price = price;
        this.cateId = cateId;
    }
    public Book( String title, String author, String descrip, int quantity, double price, int cateId) {
        this.title = title;
        this.author = author;
        this.descrip = descrip;
        this.quantity = quantity;
        this.price = price;
        this.cateId = cateId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescrip() {
        return descrip;
    }

    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    @Override
    public String toString() {
        return  "TITLE:  " + title + "; AUTHOR:  " + author  + ";\n PRICE:  " + price + ";\n CATE:  " + cateId + " ;\n DES:  " + descrip +"\n" ;

    }

    
}
