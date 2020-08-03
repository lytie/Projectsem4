<%-- 
    Document   : readmail
    Created on : Jul 13, 2020, 4:11:51 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>AdminLTE 3 | Read Mail</title>
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
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Feedback</h1>
                            </div>
                            
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- /.col -->
                    <div class="col-md-12">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">Read Feedback</h3>

                                <div class="card-tools">
                                    <a href="#" class="btn btn-tool" data-toggle="tooltip" title="Previous"><i class="fas fa-chevron-left"></i></a>
                                    <a href="#" class="btn btn-tool" data-toggle="tooltip" title="Next"><i class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body p-0">
                                <div class="mailbox-read-info">
                                    <h5>Message Subject Is Placed Here</h5>
                                    <h6>From: support@adminlte.io
                                        <span class="mailbox-read-time float-right">15 Feb. 2015 11:03 PM</span></h6>
                                </div>
                                <!-- /.mailbox-read-info -->
                                <div class="mailbox-controls with-border text-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Delete">
                                            <i class="far fa-trash-alt"></i></button>
                                        <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Reply">
                                            <i class="fas fa-reply"></i></button>
                                        <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="Forward">
                                            <i class="fas fa-share"></i></button>
                                    </div>
                                    <!-- /.btn-group -->
                                    <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" title="Print">
                                        <i class="fas fa-print"></i></button>
                                </div>
                                <!-- /.mailbox-controls -->
                                <div class="mailbox-read-message">
                                    <p>Hello John,</p>

                                    <p>Keffiyeh blog actually fashion axe vegan, irony biodiesel. Cold-pressed hoodie chillwave put a bird on it aesthetic, bitters brunch meggings vegan iPhone. Dreamcatcher vegan scenester mlkshk. Ethical master cleanse Bushwick,
                                        occupy Thundercats banjo cliche ennui farm-to-table mlkshk fanny pack gluten-free. Marfa butcher vegan quinoa, bicycle rights disrupt tofu scenester chillwave 3 wolf moon asymmetrical taxidermy pour-over. Quinoa tote
                                        bag fashion axe, Godard disrupt migas church-key tofu blog locavore. Thundercats cronut polaroid Neutra tousled, meh food truck selfies narwhal American Apparel.
                                    </p>

                                    <p>Raw denim McSweeney's bicycle rights, iPhone trust fund quinoa Neutra VHS kale chips vegan PBR&amp;B literally Thundercats +1. Forage tilde four dollar toast, banjo health goth paleo butcher. Four dollar toast Brooklyn
                                        pour-over American Apparel sustainable, lumbersexual listicle gluten-free health goth umami hoodie. Synth Echo Park bicycle rights DIY farm-to-table, retro kogi sriracha dreamcatcher PBR&amp;B flannel hashtag irony
                                        Wes Anderson. Lumbersexual Williamsburg Helvetica next level. Cold-pressed slow-carb pop-up normcore Thundercats Portland, cardigan literally meditation lumbersexual crucifix. Wayfarers raw denim paleo Bushwick, keytar
                                        Helvetica scenester keffiyeh 8-bit irony mumblecore whatever viral Truffaut.</p>

                                    <p>Post-ironic shabby chic VHS, Marfa keytar flannel lomo try-hard keffiyeh cray. Actually fap fanny pack yr artisan trust fund. High Life dreamcatcher church-key gentrify. Tumblr stumptown four dollar toast vinyl, cold-pressed
                                        try-hard blog authentic keffiyeh Helvetica lo-fi tilde Intelligentsia. Lomo locavore salvia bespoke, twee fixie paleo cliche brunch Schlitz blog McSweeney's messenger bag swag slow-carb. Odd Future photo booth pork
                                        belly, you probably haven't heard of them actually tofu ennui keffiyeh lo-fi Truffaut health goth. Narwhal sustainable retro disrupt.</p>

                                    <p>Skateboard artisan letterpress before they sold out High Life messenger bag. Bitters chambray leggings listicle, drinking vinegar chillwave synth. Fanny pack hoodie American Apparel twee. American Apparel PBR listicle,
                                        salvia aesthetic occupy sustainable Neutra kogi. Organic synth Tumblr viral plaid, shabby chic single-origin coffee Etsy 3 wolf moon slow-carb Schlitz roof party tousled squid vinyl. Readymade next level literally trust
                                        fund. Distillery master cleanse migas, Vice sriracha flannel chambray chia cronut.</p>

                                    <p>Thanks,<br>Jane</p>
                                </div>
                                <!-- /.mailbox-read-message -->
                            </div>
                            <!-- /.card-body -->
                           
                            <!-- /.card-footer -->
                            <div class="card-footer">
                                <div class="float-right">
                                    <button type="button" class="btn btn-default"><i class="fas fa-reply"></i> Reply</button>
                                    <button type="button" class="btn btn-default"><i class="fas fa-share"></i> Forward</button>
                                </div>
                                <button type="button" class="btn btn-default"><i class="far fa-trash-alt"></i> Delete</button>
                                <button type="button" class="btn btn-default"><i class="fas fa-print"></i> Print</button>
                            </div>
                            <!-- /.card-footer -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <%@include file="footer.jsp" %>
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
