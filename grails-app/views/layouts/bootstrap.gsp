<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
		<meta name="description" content="">
		<meta name="author" content="">

		<meta name="viewport" content="initial-scale = 1.0">

		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<r:require modules="scaffolding"/>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}">

		<g:layoutHead/>
		<r:layoutResources/>
	</head>

	<body>

		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					
					<a class="brand" href="${createLink(uri: '/')}">Pomodoro Task Manager</a>
					<sec:ifLoggedIn>
					<div class="nav-collapse">
						<ul class="nav">
							<sec:access controller='task' action='index'>
								<li <%= ((controllerName == "task") && (actionName == "index")) ? ' class="active"' : '' %>><g:link controller="task"><i class="icon-home icon-white"></i></g:link></li>
							</sec:access>
							<sec:access controller='task' action='list'>
								<li <%= ((controllerName == "task") && (actionName in ["list", "create", "show", "edit"])) ? ' class="active"' : '' %>><g:link controller="task" action="list">All Tasks</g:link></li>
							</sec:access>
							<sec:access controller='tag' action='index'>
								<li <%= controllerName == "tag" ? ' class="active"' : '' %>><g:link controller="tag">Tags</g:link></li>
							</sec:access>
							<sec:access controller='user' action='index'>
								<li <%= controllerName == "user" ? ' class="active"' : '' %>><g:link controller="user">Users</g:link></li>
							</sec:access>
							<sec:access controller='role' action='index'>
								<li <%= controllerName == "role" ? ' class="active"' : '' %>><g:link controller="role">Roles</g:link></li>
							</sec:access>
						</ul>
						<ul class="nav pull-right">
							<li><g:link controller="user" action="show" id="${sec.loggedInUserInfo(field: "id")}" ><i class="icon-user icon-white"></i> <sec:username/></g:link></li>
							<li class="divider-vertical"></li>
							<li><g:link controller="logout"><i class="icon-remove icon-white"></i> logout</g:link></li>
						</ul>
					</div>
					</sec:ifLoggedIn>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<g:layoutBody/>

			<hr>

			<footer>
				<p>&copy; Company 2011</p>
			</footer>
		</div>

		<r:layoutResources/>

	</body>
</html>