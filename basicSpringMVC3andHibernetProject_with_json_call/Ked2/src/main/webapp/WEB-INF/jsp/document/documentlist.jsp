<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<head>
<title>document Details</title>

<style type="text/css" title="currentStyle">
		@import "<%=request.getContextPath()%>/media/css/default.css";
		@import "<%=request.getContextPath()%>/media/css/button.css";
		@import "<%=request.getContextPath()%>/media/css/validationEngine.jquery.css";
		@import "<%=request.getContextPath()%>/media/css/template.css";
</style>

<style type="text/css" title="currentStyle">
@import "<%=request.getContextPath()%>/media/css/demo_page.css";
@import "<%=request.getContextPath()%>/media/css/demo_table_jui.css";
@import "<%=request.getContextPath()%>/media/themes/smoothness/jquery-ui-1.8.4.custom.css";
</style>

<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/media/js/jquery.min.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/media/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		oTable = $('#example').dataTable({
			"bJQueryUI" : true,
			"sPaginationType" : "full_numbers"
		});
	});
</script>

</head>

<body>
<div id="outer">
  <div id="outer2">
    <div id="header">
      <h1>Ked2</h1>
    </div>
    <div id="menu">
      <ul>
        <li><a href="http://www.free-css.com/">Home</a></li>
        <li><a href="http://www.free-css.com/">Products</a></li>
        <li><a href="http://www.free-css.com/">Services</a></li>
        <li><a href="http://www.free-css.com/">About Us</a></li>
        <li><a href="http://www.free-css.com/">Contact Us</a></li>
      </ul>
    </div>
    <div id="content">
      <div id="column1">
      <form:form  id="documentfrm" class="formular">
      <h3>document</h3>
<a href="/Ked2/document/adddocument">Add document</a>

	<div id="container">

		<div class="demo_jui">
			<c:if test="${!empty documentlist}">
				<table cellpadding="0" cellspacing="0" border="0" class="display"
					id="example">
					<thead>
						<tr>
							<th>document Name</th>
							<!-- <th>document Address</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${documentlist}" var="document">
							<tr class="gradeX">
								<td><a href="/Ked2/document/viewdocument/${document.id}">${document.fileName}</a>
								</td>
								<%-- <td>${document.address}</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
		</form:form>
		</div>
	     <div id="footer">
      <p>Copyright &copy; 2012 Sitename.com. Design by <a href="#">Free CSS Templates</a>.</p>
    </div>
  </div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>
