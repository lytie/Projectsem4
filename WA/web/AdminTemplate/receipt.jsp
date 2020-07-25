<%-- 
    Document   : receipt
    Created on : Jul 13, 2020, 4:12:23 PM
    Author     : ADMIN
--%>

<%@page import="entities.Receipt"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 3 | Receipt</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
        <%@include file="css.jsp" %>
    </head>

    <body class="hold-transition sidebar-mini">
        <div class="wrapper">

            <%@include file="navbar.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->


                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card">
                                        <div class="card-header">
                                            <h3 class="card-title">Receipt List</h3>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body">
                                            <table id="example1" class="table table-bordered table-striped">
                                                <thead>

                                                    <tr>
                                                        <th>Receipt Id :</th>
                                                        <th>Pay Date :</th>
                                                        <th>Subtotal :</th>
                                                        <th>Tax :</th>
                                                        <th>Total :</th>
                                                        <th>Pay Status :</th>
                                                        <th>Action</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                                                        List<Receipt> listrc = (List<Receipt>) request.getAttribute("listrc");
                                                        String paydate,paystatus;
                                                        for (Receipt receipt : listrc) {
                                                            if(receipt.getPayDate()==null){
                                                                paydate = "--------";
                                                                paystatus ="UnPaid";
                                                        
                                                    %>
                                                    <tr>
                                                        <td ><%=receipt.getReceiptId()%></td>
                                                        <td ><%=paydate%></td>
                                                        <td ><%=receipt.getSubtotal()%></td>
                                                        <td ><%=receipt.getTax()%></td>
                                                        <td ><%=receipt.getTotal()%></td>
                                                        <td ><%=paystatus%></td>
                                                        <td>
                                                            <a class="btn btn-info btn-sm" href="Admin_UpdateReceipt">
                                                                <i class="fas fa-info">
                                                                </i> See Details
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                            }else{
                                                                paystatus ="Paid";
                                                    %>
                                                    <tr>
                                                        <td ><%=receipt.getReceiptId()%></td>
                                                        <td ><%=receipt.getPayDate()%></td>
                                                        <td ><%=receipt.getSubtotal()%></td>
                                                        <td ><%=receipt.getTax()%></td>
                                                        <td ><%=receipt.getTotal()%></td>
                                                        <td ><%=paystatus%></td>
                                                        <td>
                                                            <a class="btn btn-info btn-sm" href="Admin_UpdateReceipt">
                                                                <i class="fas fa-info">
                                                                </i> See Details
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <%
                                                        }
                                                    }
                                                    %>

                                                </tbody>

                                            </table>
                                        </div>
                                        <!-- /.card-body -->
                                    </div>
                                    <!-- /.card -->
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> 3.0.5
                </div>
                <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <%@include file="jslink.jsp" %>
    </body>

</html>
