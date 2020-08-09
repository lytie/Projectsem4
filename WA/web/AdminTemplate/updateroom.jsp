<%-- 
    Document   : addroom
    Created on : Jul 13, 2020, 4:07:41 PM
    Author     : ADMIN
--%>

<%@page import="entities.Roomimage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Admin Haven</title>
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
                                <h4>
                                    <a class="btn btn-info btn-sm" href="Admin_ListRoom">
                                        <i class=" fa fa-plus">
                                        </i> Back to list
                                    </a>   
                                </h4>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <!-- left column -->
                            <div class="col-md-12">
                                <!-- jquery validation -->
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Edit Room</small></h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form role="form" id="quickForm" action="Admin_UpdateRoom" method="post" enctype="multipart/form-data">
                                        <input type="hidden" value="${room.getRoomId()}" name="roomid"/>
                                        <input id="demo" name="demo" type="hidden" value="${listRoomimage.size()}"/>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="inputState">Location ID</label>
                                                    <div id="btnLocation" class="btn btn-info" style="margin-left: 10px;margin-bottom: 10px">Edit</div>
                                                    <div id="rLocation">
                                                        <input type="text" readonly value="${room.getLocationId().getLocationName()}" class="form-control"/>
                                                        <input type="hidden" name="locationid" readonly value="${room.getLocationId().getLocationId()}" class="form-control"/>
                                                    </div>

                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="inputState">Room Type ID</label>
                                                    <div id="btnRoomType" class="btn btn-info" style="margin-left: 10px;margin-bottom: 10px">Edit</div>
                                                    <div id="rRoomType">
                                                        <input type="text" readonly value="${room.getRoomTypeId().getRoomTypeName()}" class="form-control"/>
                                                        <input type="hidden" name="roomtypeid"value="${room.getRoomTypeId().getRoomTypeId()}" class="form-control"/>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="exampleInputPassword1">Price :</label>
                                                    <div id="btnPrice" class="btn btn-info" style="margin-left: 10px;margin-bottom: 10px">Edit</div>
                                                    <div id="rPrice">
                                                        <input type="number" name="price" readonly class="form-control" value="${room.getPrice()}">
                                                    </div>
                                                </div>  

                                                <div class="form-group col-md-6">
                                                    <label for="exampleInputPassword1">Room Capacity</label>
                                                    <div id="btnCapacity" class="btn btn-info" style="margin-left: 10px;margin-bottom: 10px">Edit</div>
                                                    <div id="rCapacity">
                                                        <input type="number" name="capacity" readonly class="form-control" value="${room.getCapacity()}" placeholder="Enter Room Capacity">
                                                    </div>
                                                </div> 

                                                <div class="form-group col-md-12">
                                                    <label for="exampleInputPassword1">Description</label>
                                                    <div id="btnDescription" class="btn btn-info" style="margin-left: 10px;margin-bottom: 10px">Edit</div>
                                                    <div id="rDescription">
                                                        <textarea cols="120" readonly rows="4" name="description" class="form-control" required="">${room.getDescription()}</textarea>
                                                    </div>
                                                </div> 

                                                <div class="form-group col-md-6">
                                                    <label for="exampleInputPassword1">Bed Option</label>
                                                    <div id="btnBedOption" class="btn btn-info" style="margin-left: 10px;margin-bottom: 10px">Edit</div>
                                                    <div id="rBedOption">
                                                        <input type="text" readonly name="bedoption" class="form-control" value="${room.getBedOption()}" placeholder="Enter Room Capacity">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="exampleInputPassword1">Room Size</label>
                                                    <div id="btnSize" class="btn btn-info" style="margin-left: 10px;margin-bottom: 10px">Edit</div>
                                                    <div id="rSize">
                                                        <input type="number" readonly name="size" class="form-control" value="${room.getSize()}" placeholder="Enter Room Capacity">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="exampleInputPassword1">Room View</label>
                                                    <div id="btnView" class="btn btn-info" style="margin-left: 10px;margin-bottom: 10px">Edit</div>
                                                    <div id="rView">
                                                        <input type="text" readonly name="view" class="form-control" value="${room.getView()}" placeholder="Enter Room Capacity">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="exampleInputPassword1">Room Convenient</label>
                                                    <div id="rRoomCovenient" class="row">
                                                        <input type="hidden" name="totalconvenients" value="${listConvenients.size()}"/>
                                                        <c:forEach items="${listConvenients}" var="s">
                                                            <div class="col-md-1" style="padding: 10px">
                                                                <label class="checkbox-inline">
                                                                    <input type="checkbox" value="${s.getConvenientId()}" name="convenients${listConvenients.indexOf(s)+1}"
                                                                           <c:forEach items="${listRoomconvenients}" var="l">
                                                                               <c:if test="${l.getConvenientId().getConvenientId()==s.getConvenientId()}">checked</c:if>
                                                                               <c:if test="${l.getConvenientId().getConvenientId()!=s.getConvenientId()}"></c:if>
                                                                           </c:forEach> 
                                                                    />
                                                                    <img src="images/icon/${s.getUrl()}" style="width: 100%;height: 100%" />
                                                                </label>
                                                            </div> 
                                                        </c:forEach>

                                                    </div>
                                                </div>
                                                <div class="form-group col-md-12">
                                                    <label for="exampleInputPassword1">Room Image</label>
                                                    <div id="btnRoomImage" class="btn btn-info" style="margin-left: 10px;margin-bottom: 10px">Edit</div>
                                                    <div id="rRoomImage" class="row">

                                                        <c:forEach items="${listRoomimage}" var="s">
                                                            <div class="col-md-3" style="padding: 10px;height: 150px">
                                                                <img src="images/images/${s.getUrl()}" style="width: 100%;height: 100%"/>
                                                                <input type="hidden" name="currentfile${listRoomimage.indexOf(s)}" value="${s.getUrl()}"/>

                                                            </div>
                                                        </c:forEach>
                                                    </div>

                                                </div>    
                                            </div>
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer">
                                            <button type="submit" class="btn btn-primary">Update</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.card -->
                            </div>
                            <!--/.col (left) -->
                            <!-- right column -->
                            <div class="col-md-6">

                            </div>
                            <!--/.col (right) -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
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
        <script>
            $(document).ready(function() {
                $("#btnLocation").click(function() {
                    $(this).html("Return old data");
                    $("#rLocation").html("<select class='select form-control' data-placeholder='Select a State' id='locationid' name='locationid'>\n\
            <c:forEach items="${listLocation}" var="l">\n\
                <c:if test="${l==room.getLocationId()}"><option selected value='${l.getLocationId()}'>${l.getLocationName()}</option></c:if>\n\
                <c:if test="${l!=room.getLocationId()}"><option value='${l.getLocationId()}'>${l.getLocationName()}</option></c:if>\n\
            </c:forEach>\n\
                        </select>");
                });
                $("#btnRoomType").click(function() {
                    $(this).html("Return old data");
                    $("#rRoomType").html("<select class='select form-control' data-placeholder='Select a State' id='locationid' name='roomtypeid'>\n\
            <c:forEach items="${listRoomType}" var="l">\n\
                <c:if test="${l==room.getRoomTypeId()}"><option selected value='${l.getRoomTypeId()}'>${l.getRoomTypeName()}</option></c:if>\n\
                <c:if test="${l!=room.getRoomTypeId()}"><option value='${l.getRoomTypeId()}'>${l.getRoomTypeName()}</option></c:if>\n\
            </c:forEach>\n\
                        </select>");
                });
                $("#btnPrice").click(function() {
                    $(this).html("Return old data");
                    $("#rPrice").html("<input type='number' name='price' class='form-control' value='${room.getPrice()}'>");
                });
                $("#btnCapacity").click(function() {
                    $(this).html("Return old data");
                    $("#rCapacity").html("<input type='number' name='capacity' class='form-control' value='${room.getCapacity()}' placeholder='Enter Room Capacity'>");
                });
                $("#btnDescription").click(function() {
                    $(this).html("Return old data");
                    $("#rDescription").html("<textarea cols='120' rows='4' name='description' class='form-control' required=''>${room.getDescription()}</textarea>");
                });
                $("#btnBedOption").click(function() {
                    $(this).html("Return old data");
                    $("#rBedOption").html("<input type='text' name='bedoption' class='form-control' value='${room.getBedOption()}' placeholder='Enter Room Capacity'>");
                });
                $("#btnSize").click(function() {
                    $(this).html("Return old data");
                    $("#rSize").html("<input type='number' name='size' class='form-control' value='${room.getSize()}' placeholder='Enter Room Capacity'>");
                });
                $("#btnView").click(function() {
                    $(this).html("Return old data");
                    $("#rView").html("<input type='text' name='view' class='form-control' value='${room.getView()}' placeholder='Enter Room Capacity'>");
                });
                $("#btnRoomImage").click(function() {
                    $(this).html("Return old data");
                    $("#rRoomImage").html("\n\
            <c:forEach items="${listRoomimage}" var="s">\n\
                    <div class='col-md-3' style='padding: 10px;height: 150px'>\n\
                        <img src='images/images/${s.getUrl()}' style='width: 100%;height: 100%'/>\n\
                        <input type='hidden' name='currentfile${listRoomimage.indexOf(s)}' value='${s.getUrl()}'/>\n\
                        <div id='currentremove${listRoomimage.indexOf(s)}' class='btn-danger text-center'>Delete</div>\n\
                     </div>\n\
            </c:forEach>");

                    $("#rRoomImage").append("<div class='col-md-3' style='padding: 10px;height: 150px;cursor: pointer'>\n\
                                                <div style='max-width:100%;height: 100%;background-color: #c79836;'>\n\
                                                    <div id='plus' class='btn-warning' style='padding: 20%;color: white;text-align: center;height: 100%'>\n\
                                                        Add image\n\
                                                    </div>\n\
                                                </div>\n\
                                            </div>\n\
                                            <div class='row col-md-12' style='margin-top: 20px' id='proper'></div>");
            <c:forEach items="${listRoomimage}" var="s">
                    $("#currentremove${listRoomimage.indexOf(s)}").click(function() {
                        $(this).parent().remove();
                    });
            </c:forEach>
                    var count = ${listRoomimage.size()};
                    $("#plus").click(function() {

                        $("#proper").append("<div id='pic" + count + "' class='col-md-3' style='padding: 10px;height: 400px;cursor: pointer'>\
                                            <div style='max-width:100%;max-height:100%;height: 100%;'>\n\
                                            <input type='file'accept='image/*' name='image" + count + "' id='file" + count + "'  onchange='loadFile" + count + "(event)' style='display:none;'>\n\
                                           <label for='file" + count + "'id='upload" + count + "' class='btn-warning' style='cursor:pointer;color: white;text-align: center;height: 25%;width:100%'>Upload image </label>   \n\
                                           <img id='output" + count + "' style='height:50%;max-width:100%' />\n\
                                           <div id='detele' class='btn-warning' style='cursor:pointer;color: white;text-align: center;height: 25%;width:100%'>Remove Image</div>\n\
                                                    <script>\n\
                                                         var loadFile" + count + " = function(event) {\n\
                                                                     var image = document.getElementById('output" + count + "');\n\
                                                                     image.src = URL.createObjectURL(event.target.files[0]);\n\
                                                         };\n\
                                                    <\/script>\n\
                                            </div>\n\
                                        </div> ")
                        count++;
                        console.log(count);
                        document.getElementById("demo").value = count;
                    });
                    $('#proper').on('click', '#detele', function(e) {
                        e.preventDefault();
                        $(this).parent().parent().remove();
                        console.log(count);
                        document.getElementById("demo").value = count;
                    });
                });
            });
        </script>
    </body>

</html>
