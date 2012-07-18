<!doctype html>
<html>
<head>
	<meta name='layout' content='bootstrap'/>
	<title>Pomodoro Task Manager</title>
	<link href="${resource(dir: 'css', file: 'app.css')}" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="row-fluid">
		<div class="span9">

			<div class="hero-unit">
				<center>
					<h1>Pomodoro Task Manager</h1>
					<h3>Open Task for user <sec:ifLoggedIn><span class="label label-info"><sec:username/></span></sec:ifLoggedIn></h3>
				</center>
			</div>

			<sec:access controller='task' action='create'>
				<div class="row-fluid">
					<div class="pull-right">
						<ul class="actions"><li><g:link controller="task" action="create"><i class="icon-plus"></i>New</g:link></li></ul>
					</div>
				</div>
			</sec:access>

			<div class="row-fluid">
				<g:render template="taskCard" collection="${ tasks }" var="task"/>
			</div>
		</div>
		<div class="span3">
			<dl class="well sidebar-nav">
				<dt>Show</dt>
				<dd>
					<ul>
						<g:each in="${ tasks }" var="task">
							<li>${ task.summary }</li>
						</g:each>
					</ul>
				</dd>
				<dt>Tags</dt>
				<dd>
					<ul>
					<g:each in="${ tags }" var="tag">
						<li>${ tag.name }</li>
					</g:each>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>