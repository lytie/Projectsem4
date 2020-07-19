/**
 * PaymentServices class - encapsulates PayPal payment integration functions.
 *
 * @author Nam Ha Minh
 * @copyright https://codeJava.net
 */
package newpackage;

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

public class PaymentServices {

    private static final String CLIENT_ID = "AcgHsNLgHRoKZch7GRczbXNX6WY4SRcvq7g4KFoa5LPJchmOI5ZMsl0u6mg-Fr-4NDVrlqg5e338TW7q";
    private static final String CLIENT_SECRET = "EFEOIrjGDlFNuPnT9ZpiswxoFPhqq9LB9wWC5i3MXeQOPQlHT8R5zws8CKMeau2ImU-C7xKyQs3xtb98";
    private static final String MODE = "sandbox";

    public String authorizePayment(OrderDetail orderDetail)
            throws PayPalRESTException {

        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);

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

    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("William")
                .setLastName("Peterson")
                .setEmail("william.peterson@company.com");

        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/Paypal/cancel.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/Paypal/review_payment");

        return redirectUrls;
    }

    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
        Details details = new Details();
        details.setShipping(String.valueOf(orderDetail.getShipping()));
        details.setSubtotal(String.valueOf(orderDetail.getSubtotal()*3));
        details.setTax(String.valueOf(orderDetail.getTax()*3));

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(String.valueOf(orderDetail.getShipping()+orderDetail.getSubtotal()*3+orderDetail.getTax()*3));
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getProductName());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item item = new Item();
        item.setCurrency("USD");
        item.setName(orderDetail.getProductName());
        item.setPrice(String.valueOf(orderDetail.getSubtotal()));
        item.setTax(String.valueOf(orderDetail.getTax()));
        item.setQuantity("1");

        Item item2 = new Item();
        item2.setCurrency("USD");
        item2.setName(orderDetail.getProductName());
        item2.setPrice(String.valueOf(orderDetail.getSubtotal()+orderDetail.getSubtotal()));
        item2.setTax(String.valueOf(orderDetail.getTax()+orderDetail.getTax()));
        item2.setQuantity("1");
        
        items.add(item);
        items.add(item2);
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

        return payment.execute(apiContext, paymentExecution);
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
}
