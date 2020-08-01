/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import Generator.QrcodeGen;
import Generator.SendMail;
import Generator.StringGenerator;
import Paypal.PaymentServices;
import com.google.zxing.WriterException;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import entities.Qrcode;
import entities.Receipt;
import entities.Receiptcomponent;
import entities.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.GenericType;
import wsc.QrcodeClient;
import wsc.ReceiptClient;
import wsc.ReceiptcomponentClient;
import wsc.RoomClient;

/**
 *
 * @author longly
 */
public class Booking_payment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String paymentId = request.getParameter("paymentId");
            String payerId = request.getParameter("PayerID");

            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String inDate = request.getParameter("inDate");
            String outDate = request.getParameter("outDate");
            String adult = request.getParameter("adult");
            String children = request.getParameter("children");
            String idRoom = request.getParameter("idRoom");
            String price = request.getParameter("price");

            Date datenow = new Date();
            QrcodeClient qrcodeClient = new QrcodeClient();
            GenericType<List<Qrcode>> qrcodeGen = new GenericType<List<Qrcode>>() {
            };
            List<Qrcode> listQr = qrcodeClient.findAll_JSON(qrcodeGen);

            ReceiptClient receiptClient = new ReceiptClient();

            Float priceSub = Float.valueOf(price);
            Receipt re = new Receipt();
            re.setPayStatus(Boolean.FALSE);
            re.setSubtotal(priceSub);
            re.setTax(priceSub / 10);
            re.setTotal(priceSub);
            receiptClient.create_JSON(re);

            //get receipt last
            GenericType<Receipt> reType = new GenericType<Receipt>() {
            };
            Receipt receipt = receiptClient.getLast_JSON(reType);

            ReceiptcomponentClient receiptcomponentClient = new ReceiptcomponentClient();

            RoomClient roomClient = new RoomClient();
            GenericType<Room> roomType = new GenericType<Room>() {
            };
            Room room = roomClient.find_JSON(roomType, idRoom);

            // Receiptcomponent
            Receiptcomponent receiptcomponent = new Receiptcomponent();
            receiptcomponent.setComponentName("Room -" + room.getRoomTypeId().getRoomTypeName() + "-" + room.getLocationId().getLocationName() + idRoom);
            receiptcomponent.setOrdererName(name);
            receiptcomponent.setPrice(priceSub);
            receiptcomponent.setQuantity(1);
            receiptcomponent.setReceiptId(receipt);
            receiptcomponent.setSubtotal(priceSub);
            receiptcomponent.setUrl(room.getRoomTypeId().getUrl());
            receiptcomponent.setOrderDate(datenow);
            receiptcomponentClient.create_JSON(receiptcomponent);

            //check trung
            StringGenerator generator = new StringGenerator();
            String qrcodeid = null;
            boolean check = false;
            do {
                qrcodeid = generator.generate(40);
                for (Qrcode qr : listQr) {
                    if (qr.getQrCodeId().equals(qrcodeid)) {
                        check = true;
                    }
                }
            } while (check);

            //format date
            DateFormat df = new SimpleDateFormat("YYYY-MM-dd");
            Date dateIn = df.parse(inDate);
            Date dateOut = df.parse(outDate);

            //get Img QR
            String qrcodeImg = null;
            boolean checked = false;
            do {
                qrcodeImg = generator.generate(10);
                for (Qrcode qr : listQr) {
                    if (qrcodeImg.equals(qr.getUrl())) {
                        checked = true;
                    }
                }
            } while (checked);
            QrcodeGen qrGen = new QrcodeGen();
            qrGen.createQr(qrcodeid, "qrcode", qrcodeImg, "png");

            //set object
            Qrcode qrcode = new Qrcode();
            qrcode.setAdultsNum(Integer.parseInt(adult));
            qrcode.setQrCodeId(qrcodeid);
            qrcode.setChildrenNum(Integer.parseInt(children));
            qrcode.setCustomerName(name);
            qrcode.setDeposits(Float.valueOf(price) / 10);
            qrcode.setEmailSendedTo(email);
            qrcode.setCheckInDate(dateIn);
            qrcode.setCheckOutDate(dateOut);
            qrcode.setReceiptId(receipt);
            qrcode.setUrl(qrcodeImg + ".png");
            qrcode.setRoomId(room);
            qrcode.setCreateDate(datenow);

            if (request.getParameter("idCus") != null) {
                String idCus = request.getParameter("idCus");
                qrcode.setAccountCustomerId(Integer.valueOf(idCus));
            }

            qrcodeClient.create_JSON(qrcode);

            SendMail sendMail = new SendMail();
            sendMail.sendQR(email, "QRcode And Service", "The link goes to our service page : http://localhost:8080/WA/CustomerPageIndexServlet?id=" + qrcodeid, "qrcode/" + qrcodeImg + ".png");

            request.setAttribute("success", "<div class='success'></div>"
                    + "<script type=\"text/javascript\">\n"
                    + "            $('.success').each(function () {\n"
                    + "                swal(\"Booking Room Success\", \"Please check your email for the QR code and the link to our service page\", \"success\");\n"
                    + "            });\n"
                    + "        </script>");
            
           
            request.getRequestDispatcher("Haven").include(request, response);

        } catch (PayPalRESTException | ParseException | WriterException ex) {
            Logger.getLogger(Booking_payment.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
