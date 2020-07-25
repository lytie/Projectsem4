<%-- 
    Document   : room
    Created on : Jul 13, 2020, 4:12:44 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Room"%>
<%@page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | Room</title>
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
           
            <h4> <a class="btn btn-info btn-sm" href="Admin_AddRoom">
            <i class="fa fa-plus"></i> Add Room </a></h4>
          </div>
          
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              
              <!-- /.card-header -->
              

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">List Room</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Bed Option</th>
                    <th>Size</th>
                    <th>View</th>
                    <th>Capacity</th>
                    <th>Status</th>
                    <th>Action</th>

                  </tr>
                  </thead>
                  <tbody>
                      <c:forEach items="${listroom}" var="r">
                  <tr>
                      <td width="25%"><c:out value="${r.getDescription()}"/></td>
                      <td><c:out value="${r.getPrice()}"/></td>
                       <td><c:out value="${r.getBedOption()}"/></td>
                    <td><c:out value="${r.getSize()}"/></td>
                    <td><c:out value="${r.getView()}"/></td>
                    <td><c:out value="${r.getCapacity()}"/></td>
                    <td><c:out value="${r.getStatus()}"/></td>
                    <td>
                         
                          <a class="btn btn-info btn-sm" href="Admin_UpdateRoom">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
                          </a>
                          <a class="btn btn-danger btn-sm" href="#">
                              <i class="fas fa-trash">
                              </i>
                              Delete
                          </a>
                      </td>
                  </tr>
                  </c:forEach>
                  
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
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
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

