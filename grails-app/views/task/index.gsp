<!doctype html>
<html>
<head>
	<title>Pomodoro Task Manager</title>
	<blueprint:resources/>
	<link href="${resource(dir: 'css', file: 'app.css')}" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1 class="span-24 last">Pomodoro Task Manager</h1>
		<div class="span-24">
			<div class="span-16">
				<h2>Open Task for <sec:ifLoggedIn><sec:username/> (<g:link controller="logout">sign out</g:link>)</sec:ifLoggedIn></h2>
			</div>
			<div class="span-4">
				<ul class="actions"><li>New</li></ul>
			</div>
			<div class="span-4 last"></div>
		</div>
		<div>
			<div class="span-20">
				<g:render template="taskCard" collection="${ tasks }" var="task"/>
			</div>
		</div>
		<div class="span-4 last">
			<dl class="sidebar">
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