/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package newpackage;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

/**
 *
 * @author Admin
 */
public class QrcodeGen {
        //String data = "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=EC-9GX22361GM8363508";

    public void createQr(String data,String imgname,String filetype) throws WriterException, IOException{
        
    QRCodeWriter qrCodeWriter = new QRCodeWriter();
    BitMatrix matrix = qrCodeWriter.encode(data, BarcodeFormat.QR_CODE, 200, 200);

    // Write to file image
    String outputFile = "C:/Users/Admin/Desktop/"+imgname+"."+filetype;
    Path path = FileSystems.getDefault().getPath(outputFile);
    MatrixToImageWriter.writeToPath(matrix, "PNG", path);
    // Write to byte array
    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
    MatrixToImageWriter.writeToStream(matrix, "PNG", outputStream);
    byte[] pngByteArray = outputStream.toByteArray();
    }
}
