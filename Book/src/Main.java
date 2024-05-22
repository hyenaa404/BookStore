
import java.io.*;
import java.util.ArrayList;
import java.util.List;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {

    public static void main(String[] args) {
        List<Book> bookList = new ArrayList<>();
        try {
            File file = new File("input.txt");
            FileReader fileReader = null;
            BufferedReader bufferedReader = null;
            try {
                fileReader = new FileReader(file);
                bufferedReader = new BufferedReader(fileReader);
                String line = bufferedReader.readLine();
                while (line != null) {
//                    line = line.replace("\"", "");
                    String[] parts = line.split(";");
                    String title = parts[0];
                    String author = parts[1];
                    String imgURL = parts[2];
                    double price;
                    try {
                        price = Integer.parseInt(parts[3].replaceAll("[^0-9]", "").trim());
                    } catch (NumberFormatException e) {
                        price = 0;
                    }
                    String cate = parts[4];
                    String descrip = parts[5];
                    Book book = new Book(title, price, author, imgURL, descrip, cate);
                    bookList.add(book);
                    line = bufferedReader.readLine();

                }
                bufferedReader.close();
                fileReader.close();
            } catch (FileNotFoundException ex) {
                System.out.println("File not found.");
            }
        } catch (IOException e) {
            System.err.println("Failed when reading file.");
        }
        for(Book b : bookList){
            System.out.println(b.toString());
        }

    }



}