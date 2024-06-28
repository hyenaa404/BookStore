/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import context.BookDAO;
//import context.ImgDAO;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.Img;
import util.FormatString;

/**
 *
 * @author LENOVO
 */
public class Main {

    public static void main(String[] args) {
//        List<Book> bookList = new ArrayList<>();
//        List<Img> imgList = new ArrayList<>();
//        BookDAO bookDao = new BookDAO();
////        ImgDAO imgDao = new ImgDAO();
//        int i = 0;
//
//        File file = new File("output4.txt");
//        FileReader fileReader = null;
//        BufferedReader bufferedReader = null;
//        try {
//            fileReader = new FileReader(file);
//            bufferedReader = new BufferedReader(fileReader);
//            String line = bufferedReader.readLine();
//            while (line != null) {
////                    line = line.replace("\"", "");
//                i++;
////                    if (i==50){
////                        break;
////                    }                        
//                try {
//                    String[] parts = line.split(";");
//                    String title = parts[0];
//                    String author = parts[1];
//                    String imgURL = parts[2];
//                    double price;
//                    try {
//                        price = Integer.parseInt(parts[3].replaceAll("[^0-9]", "").trim());
//                    } catch (NumberFormatException e) {
//                        price = 0;
//                        throw new ArrayIndexOutOfBoundsException();
//                    }
//                    String cate = parts[4].trim();
//                    String descrip = parts[5];
//                    int cateid;
//                    if (cate.equalsIgnoreCase("fiction")) {
//                        cateid = 1;
//                    } else if (cate.equalsIgnoreCase("poetry")) {
//                        cateid = 3;
//                    } else {
//                        cateid = 2;
//                    }
//                    int quantity = 2000;
////------
////                    int bookID = bookDao.getBookID(title);
////                    if (bookID != 0) {
////
////                        Img img = new Img(bookID, imgURL);
////                        imgList.add(img);
////                    }
//
//                    if (descrip.contains("Mua s")) {
//                        throw new ArrayIndexOutOfBoundsException();
//                    }
//                    Book b = new Book(title, author, descrip, quantity, price, cateid, imgURL);
//                    bookList.add(b);
//                    line = bufferedReader.readLine();
//                } catch (ArrayIndexOutOfBoundsException e2) {
//
//                    line = bufferedReader.readLine();
//                }
//
//            }
//            bufferedReader.close();
//            fileReader.close();
//        } catch (FileNotFoundException ex) {
//            System.out.println("File not found.");
//
//        } catch (IOException e) {
//            System.err.println("Failed when reading file.");
//        }
////Book ba = new Book("aa", "author", "descrip", 2, 3, 2);
////bookList.add(ba);
//        int k = 0;
//        for (Book b : bookList) {
//            if (bookDao.insertBook(b)) {
//                k++;
//            }
////System.out.println(b.getImgURL());
////            -----------------------------
////        for (Img img : imgList) {
////            if (imgDao.insertImg(img)) {
////                k++;
////            }
////            System.out.println(img.getBookID() + img.getImgURL());
//        }
//        System.out.println(k);

        System.out.println(FormatString.formatCurrency(290000.0));
    }

}
