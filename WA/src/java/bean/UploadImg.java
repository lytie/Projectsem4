/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author longly
 */
public class UploadImg  extends HttpServlet{
    private final String UPLOAD_DIRECTORY = "/Users/longly/Desktop/demoProject/project4/web/img";

    public List<String> Upload(HttpServletRequest request) {
        List<String> listImg=new ArrayList<>();
        
        try {
            List<FileItem> multiparts = new ServletFileUpload(
                    new DiskFileItemFactory()).parseRequest(request);
          
            for (FileItem item : multiparts) {
                if (!item.isFormField()) {
                    String name = new File(item.getName()).getName();
                    
                        listImg.add(name);
                    item.write(new File(UPLOAD_DIRECTORY + File.separator + name));

                }
            }
  
            
        } catch (Exception ex) {
            request.setAttribute("message", "File Upload Failed due to ");
        }
        return listImg;

    }
    
}
