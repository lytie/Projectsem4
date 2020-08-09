/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.client.fluent.*;

 

/**
 *
 * @author longly
 */
public class GoogleUtils {
    
    public static String getToken(final String code) throws IOException{
       
            String response=Request.Post(Constants.GOOGLE_LINK_GET_TOKEN).bodyForm(Form.form()
                    .add("client_id", Constants.GOOGLE_CLIENT_ID)
                    .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                    .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI)
                    .add("code", code)
                    .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build()).execute().returnContent().asString();
            
            JsonObject json=new Gson().fromJson(response, JsonObject.class);
            return json.get("access_token").toString().replaceAll("\"", "");
       
        
    }
    
    public static GooglePojo getUserInfo(final String accessToken) throws IOException{
        String link=Constants.GOOGLE_LINK_GET_USER_INFO+accessToken;
        String reponse=Request.Get(link).execute().returnContent().asString();
        GooglePojo pojo=new Gson().fromJson(reponse, GooglePojo.class);
        System.out.println(pojo);
        return pojo;
    }
}
