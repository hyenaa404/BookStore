

public class Book {

    //    String ID;
    String title;
    double price;
    String author;
    String imageUrl;

    String description;
    String cate;

    public Book() {
    }

    public Book( String title, double price, String author, String imageUrl, String description, String cate) {
        this.cate = cate;
        this.title = title;
        this.price = price;
        this.author = author;
        this.imageUrl = imageUrl;
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
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


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return  "TITLE:  " + title + "; AUTHOR:  " + author + ";\n IMG:  " + imageUrl + ";\n PRICE:  " + price + ";\n CATE:  " + cate + " ;\n DES:  " + description +"\n" ;

    }
}
