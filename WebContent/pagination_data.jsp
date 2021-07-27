<!-- Pagination -->
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css"/>

<script type="text/javascript">
$(document).ready(function() {
    $('#content_table').DataTable({
    	 "pageLength": 5
    });
} );
</script>
<style>
.dataTables_filter {
   width: 50%;
   float: right;
   text-align: right;
   margin-right: 4px;
}
.panel-heading {
        margin-bottom: 10px;
}
.dataTables_length {
width: 50%;
   float: left;
   text-align: left;
    margin-left: 4px;
}
.dataTables_info{
 float: left;
   text-align: left;
    margin-left: 4px
    }
</style>