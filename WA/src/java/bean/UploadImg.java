/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import Generator.QrcodeGen;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author longly
 */
public class UploadImg extends HttpServlet {

    private final String UPLOAD_DIRECTORY = "http://localhost:8080/WA/images/";

    public List<String> Upload(HttpServletRequest request, String url) {
        List<String> listImg = new ArrayList<>();
        ClassLoader loader = QrcodeGen.class.getClassLoader();
        String urll =loader.getResource("Generator/").getFile();
        System.out.println(urll);
        System.out.println(urll.lastIndexOf("WA"));
        String outputFile =urll.replaceAll("%20", " ").substring(1,urll.lastIndexOf("WA")+2)+"/web/images/";
        System.out.println(outputFile);
        try {
            List<FileItem> multiparts = new ServletFileUpload(
                    new DiskFileItemFactory()).parseRequest(request);

            for (FileItem item : multiparts) {
              
                if (!item.isFormField()) {
                    String name = new File(item.getName()).getName();

                    listImg.add(name);
                    //item.write(new File(UPLOAD_DIRECTORY+url + File.separator + name));
                    item.write(new File(outputFile+url+"/"+name));
                    System.out.println("Write file:"+outputFile+url+"/"+name);
                }
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            request.setAttribute("message", "File Upload Failed due to " + ex);
        }
        return listImg;

    }

}
