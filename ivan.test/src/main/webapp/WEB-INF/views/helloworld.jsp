<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring 4 MVC -HelloWorld</title>
</head>
<body>
	<center>
		<h2>Hello World</h2>
		<h2>
			${message} ${name}
		</h2>
		<input type="button" id="btnSend">
	</center>
</body>
</html>

<script type="text/javascript">
$("#btnSend").on('click', function() {
	var params = {
		      id: 1,
		      user: "Sydney",
			password : "asa"
		    };
		    var request = new XMLHttpRequest();
		    request.open('POST', '/ivan.test/excel', true);
			request.responseType = 'arraybuffer';
			 request.setRequestHeader("Content-Type", "application/json");
		request.setRequestHeader("Accept", "application/json");
			request.onload = function () {
		    if (this.status === 200) {
		        var filename = "testxls.xls";
		        var disposition = request.getResponseHeader('Content-Disposition');
		        if (disposition && disposition.indexOf('attachment') !== -1) {
		            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
		            var matches = filenameRegex.exec(disposition);
		            if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
		        }
		        var type = request.getResponseHeader('Content-Type');

		        var blob;
		        if (typeof File === 'function') {
		            try {
		                blob = new File([this.response], filename, { type: type });
		            } catch (e) { /* Edge */ }
		        }
		        if (typeof blob === 'undefined') {
		            blob = new Blob([this.response], { type: type });
		        }

		        if (typeof window.navigator.msSaveBlob !== 'undefined') {
		            // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
		            window.navigator.msSaveBlob(blob, filename);
		        } else {
		            var URL = window.URL || window.webkitURL;
		            var downloadUrl = URL.createObjectURL(blob);

		            if (filename) {
		                // use HTML5 a[download] attribute to specify filename
		                var a = document.createElement("a");
		                // safari doesn't support this yet
		                if (typeof a.download === 'undefined') {
		                    window.location = downloadUrl;
		                } else {
		                    a.href = downloadUrl;
		                    a.download = filename;
		                    document.body.appendChild(a);
		                    a.click();
		                }
		            } else {
		                window.location = downloadUrl;
		            }

		            setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
		        }
		    }
		};
		request.send(JSON.stringify(params));
	
});

</script>