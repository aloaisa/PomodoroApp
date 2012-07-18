
<%@ page import="org.algl.pomodoro.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
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
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${taskInstance?.summary}">
						<dt><g:message code="task.summary.label" default="Summary" /></dt>
						
							<dd><g:fieldValue bean="${taskInstance}" field="summary"/></dd>
						
					</g:if>
				
					<g:if test="${taskInstance?.details}">
						<dt><g:message code="task.details.label" default="Details" /></dt>
						
							<dd><g:fieldValue bean="${taskInstance}" field="details"/></dd>
						
					</g:if>
				
					<g:if test="${taskInstance?.deadline}">
						<dt><g:message code="task.deadline.label" default="Deadline" /></dt>
						
							<dd><g:formatDate date="${taskInstance?.deadline}" /></dd>
						
					</g:if>
				
					<g:if test="${taskInstance?.timeSpent}">
						<dt><g:message code="task.timeSpent.label" default="Time Spent" /></dt>
						
							<dd><g:fieldValue bean="${taskInstance}" field="timeSpent"/></dd>
						
					</g:if>
				
					<g:if test="${taskInstance?.status}">
						<dt><g:message code="task.status.label" default="Status" /></dt>
						
							<dd><g:fieldValue bean="${taskInstance}" field="status"/></dd>
						
					</g:if>
				
					<g:if test="${taskInstance?.dateCreated}">
						<dt><g:message code="task.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${taskInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${taskInstance?.tags}">
						<dt><g:message code="task.tags.label" default="Tags" /></dt>
						
							<g:each in="${taskInstance.tags}" var="t">
							<dd><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${taskInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${taskInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
