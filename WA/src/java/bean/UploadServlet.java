/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import Generator.QrcodeGen;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class UploadServlet extends HttpServlet {

    public Map<String, Object> Upload(HttpServletRequest request, String url) {
        Map<String, Object> listrequest = new LinkedHashMap<>();
        ClassLoader loader = QrcodeGen.class.getClassLoader();
        String urll = loader.getResource("Generator/").getFile();
//        System.out.println(urll);
//        System.out.println(urll.lastIndexOf("WA"));
        String outputFile = urll.replaceAll("%20", " ").substring(1, urll.lastIndexOf("WA") + 2) + "/web/images/";
//        System.out.println(outputFile);
        try {
            List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (FileItem item : items) {
                int count = 0;
                if (item.isFormField()) {
                    // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();
//                    System.out.println(fieldName);
//                    System.out.println(fieldValue);
                    listrequest.put(fieldName, fieldValue);

                    // ... (do your job here)
                } else {

                    // Process form file field (input type="file").
                    String fieldName = item.getFieldName();
                    String fileName = FilenameUtils.getName(item.getName());
//                    System.out.println(fieldName);
//                    System.out.println(fileName);
                    InputStream fileContent = item.getInputStream();
                    File file = new File(("/" + outputFile + url + "/" + fileName).trim());
                    if (file.exists() && file.isFile()) {
                        listrequest.put("existedFile" + count, file.getName());
                        System.out.println("file exists rồi");
                        fileContent.close();
                    } else {
                        fileContent.close();
                        Thread.sleep(10000);
                        item.write(file);
                    }

//                    System.out.println(outputFile+url+"/"+fileName);
                    listrequest.put(fieldName, fileName);
                    count++;
                    // ... (do your job here)
                }

            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listrequest;
    }

}
