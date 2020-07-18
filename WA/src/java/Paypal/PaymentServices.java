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

    public String authorizePayment(Receipt receipt,List<Receiptcomponent> listReceiptcomponents,Qrcode qrcode)
            throws PayPalRESTException {

        Payer payer = getPayerInformation(qrcode);
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(receipt,listReceiptcomponents,qrcode);

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

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/WA/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/WA/ReviewPaymentServlet");

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(Receipt receipt,List<Receiptcomponent> listReceiptcomponents,Qrcode qrcode) {
        Details details = new Details();
        details.setSubtotal(String.valueOf(receipt.getSubtotal()-qrcode.getDeposits()));
        details.setTax(String.valueOf(receipt.getTax()));

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(String.valueOf(receipt.getTotal()));
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        for (Receiptcomponent receiptcomponent : listReceiptcomponents) {
            if (listReceiptcomponents.indexOf(receiptcomponent) == 0) {
                Item item = new Item();
                item.setCurrency("USD");
                item.setName(receiptcomponent.getComponentName());
                item.setPrice(String.valueOf(receiptcomponent.getPrice()-qrcode.getDeposits()));
                item.setTax(String.valueOf(receiptcomponent.getPrice()*10/100));
                item.setQuantity(String.valueOf(receiptcomponent.getQuantity()));
                items.add(item);
            }else{
                Item item = new Item();
                item.setCurrency("USD");
                item.setName(receiptcomponent.getComponentName());
                item.setPrice(String.valueOf(receiptcomponent.getPrice()));
                item.setTax(String.valueOf(receiptcomponent.getPrice()*10/100));
                item.setQuantity(String.valueOf(receiptcomponent.getQuantity()));
                items.add(item);
            }
            
        }
        itemList.setItems(items);
        transaction.setItemList(itemList);
        transaction.setDescription("Deposits:$ "+qrcode.getDeposits());

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

        return payment.execute(apiContext, paymentExecution);
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
}
