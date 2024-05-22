package com.company;

//import com.google.gson.Gson;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Main {

    public static void main(String[] args) throws IOException {

        List<Book> bookList = new ArrayList<>();
        for (int i = 1; i <= 178; i++) {
            String linkBook = "https://gacxepbookstore.vn/all-books?q=collections:2113434&page=" + i + "&view=grid";

            Document doc = Jsoup.connect(linkBook).get();

            Elements elements = doc.getElementsByClass("product-loop-1 product-loop-2 product-loop-col product-base");

            for (Element e : elements) {


                String title = e.child(0) // div (product-thumbnail)
                        .child(0) // a
                        .attr("title");



                String link = "https://gacxepbookstore.vn" + e.child(0) // div (product-thumbnail)
                        .child(0) // a
                        .attr("href");



                String imgURL = e.child(0) // div (product-thumbnail)
                        .child(0) // a
                        .child(0) // img
                        .attr("data-lazyload");




//                String variantID = e.child(0) // div (product-thumbnail)
//                        .child(1) // div (product-action)
//                        .child(0) // form
//                        .select("input[name=variantId]") // select input by name
//                        .attr("value");

                Element priceElement = e.getElementsByClass("price product-price").first();
                // Lấy giá
                String price = priceElement.text();

                //
                Connection doc2 = Jsoup.connect(link);


                Elements detailsDiv = doc2.get().getElementsByClass("col-xs-12 col-sm-7 col-md-8 col-lg-9 details-pro");
                String author = null;
                String cate = null;
                String descrip = null;
                for (Element e2 : detailsDiv) {
//                System.out.println("HIIIIIIIIII");
                    try {

                        author = e2.child(0) // div (row)
                                .child(0) // div (col-xs-12 col-md-6)
                                .child(1) // div (fw w_100)
                                .child(0) // div (group-status)
                                .child(0) // p (author)
                                .child(1) // a
                                .attr("title");
                    } catch (IndexOutOfBoundsException e1){
                        author = "unknown";
                    }
                    try {

                        cate = e2.child(0) // div (row)
                                .child(0) // div (col-xs-12 col-md-6)
                                .child(1) // div (fw w_100)
                                .child(0) // div (group-status)
                                .child(1) // p (cate)
                                .child(1) // a
                                .attr("title");
                    } catch (IndexOutOfBoundsException e1){
                        cate = "unknown";
                    }


                }
                Elements detailDes = doc2.get().getElementsByClass("product-tab e-tabs");
                try{
                for (Element e3 : detailDes) {
                    descrip = e3.child(1).child(0).child(1).child(1).ownText(); //11
                    if (Objects.equals(descrip, "")) {
//                        System.out.println("null");
                        descrip = e3.child(1).child(0).child(1).child(1).child(0).ownText();
                    }

                    Book b = new Book(title, price, author, imgURL, link, descrip, cate);
                    bookList.add(b);

                }
                } catch (IndexOutOfBoundsException e2){
                    System.out.println("-1 here");
                }


//        Gson gson = new Gson();
//        String jsonData = gson.toJson(bookList);
//
//        System.out.println(jsonData);
                System.out.println(bookList.size());
                System.out.println("page "+i);
                try {
                    File file = new File("output4.txt");
                    FileWriter fileWriter = new FileWriter(file);
                    BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
                    for (Book book : bookList) {

                        String line = book.toString();
                        bufferedWriter.write(line);
                        bufferedWriter.newLine();
                    }

                    bufferedWriter.close();
                    fileWriter.close();

                } catch (IOException e4) {

                    System.out.println("Error when reading file!");
                }
//                System.out.println("Saved successfully!");
            }
        }
    }
}

