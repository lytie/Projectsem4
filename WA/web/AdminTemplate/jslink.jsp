<%-- 
    Document   : jslink
    Created on : Jul 19, 2020, 2:44:47 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<script src="AdminTemplate/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="AdminTemplate/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="AdminTemplate/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="AdminTemplate/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="AdminTemplate/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="AdminTemplate/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- AdminLTE App -->
<script src="AdminTemplate/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="AdminTemplate/dist/js/demo.js"></script>
<!-- page script -->
<script>
    $(function() {
        $("#example1").DataTable({
            "responsive": true,
            "autoWidth": false,
        });
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>

<!-- jquery-validation -->
<script src="AdminTemplate/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="AdminTemplate/plugins/jquery-validation/additional-methods.min.js"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="AdminTemplate/dist/js/pages/dashboard.js"></script>
<!-- ChartJS -->
<script src="AdminTemplate/plugins/chart.js/Chart.min.js"></script>

