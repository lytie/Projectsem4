/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;



/**
 *
 * @author longly
 */
public class encrypt {
    
    
    public String changed(String pass){
        byte[] digest=new byte[]{};
        try {
            MessageDigest md=MessageDigest.getInstance("SHA-256");
            md.update(pass.getBytes("UTF-8"));
           digest= md.digest();
            
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
            Logger.getLogger(encrypt.class.getName()).log(Level.SEVERE, null, ex);
        }
        return DatatypeConverter.printBase64Binary(digest);
    }
    
}
