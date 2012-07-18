
<%@ page import="org.algl.pomodoro.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="summary" title="${message(code: 'task.summary.label', default: 'Summary')}" />
						
							<g:sortableColumn property="details" title="${message(code: 'task.details.label', default: 'Details')}" />
						
							<g:sortableColumn property="deadline" title="${message(code: 'task.deadline.label', default: 'Deadline')}" />
						
							<g:sortableColumn property="timeSpent" title="${message(code: 'task.timeSpent.label', default: 'Time Spent')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'task.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'task.dateCreated.label', default: 'Date Created')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${taskInstanceList}" var="taskInstance">
						<tr>
						
							<td>${fieldValue(bean: taskInstance, field: "summary")}</td>
						
							<td>${fieldValue(bean: taskInstance, field: "details")}</td>
						
							<td><g:formatDate date="${taskInstance.deadline}" /></td>
						
							<td>${fieldValue(bean: taskInstance, field: "timeSpent")}</td>
						
							<td>${fieldValue(bean: taskInstance, field: "status")}</td>
						
							<td><g:formatDate date="${taskInstance.dateCreated}" /></td>
						
							<td class="link">
								<g:link action="show" id="${taskInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${taskInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
