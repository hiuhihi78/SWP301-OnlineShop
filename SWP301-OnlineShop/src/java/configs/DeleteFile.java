/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package configs;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author Admin
 */
public class DeleteFile {

    public static void handleDeleteFile(String fileName) {
        String absolutePath = DeleteFile.getAbsolutePathFile("web");
        String filePathDelete = absolutePath + fileName;
        
        File myObj = new File(filePathDelete);
        if (myObj.delete()) {
            System.out.println("Deleted the file: " + myObj.getName());
        } else {
            System.out.println("Failed to delete the file.");
        }
    }
    public static void main(String[] args) {
        DeleteFile.handleDeleteFile("/assets/img/con-cho.png");
    }
    
    private static String getAbsolutePathFile(String fileName){
        String absolute = "";
        // try catch block to handle exceptions
        try {
  
            // Create a file object
            File f = new File("web");
  
            // Get the absolute path of file f
            absolute = f.getAbsolutePath();
  
            // Display the file path of the file object
            // and also the file path of absolute file
            System.out.println("Original path: "
                               + f.getPath());
            System.out.println("Absolute path: "
                               + absolute);
        }
        catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return absolute;
    }
}
