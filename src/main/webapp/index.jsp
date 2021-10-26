<html>
<head>
<title>Hello World!</title>
</head>
<body>
	<h1>Hello World!</h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		Request From 
		<%= request.getRemoteAddr()  %></p>
	<p>
		App Hosted on 
		<%= request.getLocalAddr()  %></p>
</body>
