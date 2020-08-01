/**
 * PaymentServices class - encapsulates PayPal payment integration functions.
 *
 * @author Nam Ha Minh
 * @copyright https://codeJava.net
 */
package Paypal;

import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Order;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import entities.Qrcode;
import entities.Receipt;
import entities.Receiptcomponent;

public class PaymentServices {

    private static final String CLIENT_ID = "AcgHsNLgHRoKZch7GRczbXNX6WY4SRcvq7g4KFoa5LPJchmOI5ZMsl0u6mg-Fr-4NDVrlqg5e338TW7q";
    private static final String CLIENT_SECRET = "EFEOIrjGDlFNuPnT9ZpiswxoFPhqq9LB9wWC5i3MXeQOPQlHT8R5zws8CKMeau2ImU-C7xKyQs3xtb98";
    private static final String MODE = "sandbox";

    public String authorizePayment(List<Receiptcomponent> listReceiptcomponents, Qrcode qrcode)
            throws PayPalRESTException {

        Payer payer = getPayerInformation(qrcode);
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(listReceiptcomponents);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = requestPayment.create(apiContext);

        System.out.println("=== CREATED PAYMENT: ====");
        System.out.println(approvedPayment);

        return getApprovalLink(approvedPayment);

    }

    public String authorizePayment(String deposit, String nameRoom, String name, String email, String url)
            throws PayPalRESTException {

        Payer payer = getPayerInformation(name, email);
        RedirectUrls redirectUrls = getRedirectURLsBooking(url);
        List<Transaction> listTransaction = getTransactionInformation(deposit, nameRoom);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment approvedPayment = requestPayment.create(apiContext);

        System.out.println("=== CREATED PAYMENT: ====");
        System.out.println(approvedPayment);

        return getApprovalLink(approvedPayment);

    }

    private Payer getPayerInformation(Qrcode qrcode) {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setLastName(qrcode.getCustomerName())
                .setEmail(qrcode.getEmailSendedTo());

        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private Payer getPayerInformation(String name, String email) {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setLastName(name)
                .setEmail(email);

        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/WA/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/WA/ReviewPaymentServlet");

        return redirectUrls;
    }

    private RedirectUrls getRedirectURLsBooking(String url) {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/WA/Haven");
        redirectUrls.setReturnUrl(url);

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(List<Receiptcomponent> listReceiptcomponents) {
        float roomdeposits = 0;
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        for (Receiptcomponent receiptcomponent : listReceiptcomponents) {
            if (receiptcomponent.getServiceTypeId().getServiceTypeId() > 3) {
                Item item = new Item();
                item.setCurrency("USD");
                item.setName(receiptcomponent.getComponentName());
                item.setPrice(String.valueOf(receiptcomponent.getPrice() - (receiptcomponent.getPrice() * 10 / 100)));
                item.setTax(String.valueOf(receiptcomponent.getPrice() * 10 / 100));
                item.setQuantity(String.valueOf(receiptcomponent.getQuantity()));
                items.add(item);
                roomdeposits += receiptcomponent.getPrice() * 10 / 100;
            } else {
                Item item = new Item();
                item.setCurrency("USD");
                item.setName(receiptcomponent.getComponentName());
                item.setPrice(String.valueOf(receiptcomponent.getPrice()));
                item.setTax(String.valueOf(receiptcomponent.getPrice() * 10 / 100));
                item.setQuantity(String.valueOf(receiptcomponent.getQuantity()));
                items.add(item);
            }
        }
        itemList.setItems(items);
        Details details = new Details();
        float subtotal = 0;
        float tax = 0;
        for (Receiptcomponent receiptcomponent : listReceiptcomponents) {
            if (receiptcomponent.getServiceTypeId().getServiceTypeId() > 3) {
                subtotal += receiptcomponent.getSubtotal();
                tax = subtotal * 10 / 100;
            } else {
                subtotal += receiptcomponent.getSubtotal();
                tax = subtotal * 10 / 100;
            }
        }
        details.setSubtotal(String.valueOf(subtotal-roomdeposits));
        details.setTax(String.valueOf(subtotal * 10 / 100));

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(String.valueOf(subtotal + tax - roomdeposits));
        amount.setDetails(details);
        System.out.println("DetailsSubTotal: " + details.getSubtotal());
        System.out.println("Details Tax: " + details.getTax());
        System.out.println("Amount Total: " + amount.getTotal());
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);

        transaction.setItemList(itemList);
        transaction.setDescription("Room Deposits: " + roomdeposits + "$");

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    private List<Transaction> getTransactionInformation(String deposit, String nameRoom) {

        Details details = new Details();
        details.setSubtotal(deposit);
        details.setTax("0");

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(deposit);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item item = new Item();
        item.setCurrency("USD");
        item.setName(nameRoom + "10%");
        item.setPrice(deposit);
        item.setQuantity("1");
        items.add(item);

        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }

        return approvalLink;
    }

    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        try {
            Payment createdPayment = payment.execute(apiContext, paymentExecution);
            System.out.println("---Start print createdpayment-----");
            System.out.println(createdPayment);
            return createdPayment;

        } catch (PayPalRESTException e) {
            System.out.println("---start print exception---");
            System.err.println(e.getDetails());
        }
        return payment.execute(apiContext, paymentExecution);
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
}
