<div class="task">
	<h4>${ task.summary }</h4>
	<div><pomo:textToParagraphs>${ task.details }</pomo:textToParagraphs></div>
	
	<sec:access controller='tag' action='edit'>
		<div class="tags">Tags:
			<g:each in="${ task.tags }" var="tag">
				 <g:link controller="tag" action="show" id="${ tag.id }"><code> ${ tag }</code></g:link>
			</g:each>
		</div>		
	</sec:access>
	<sec:noAccess controller='tag' action='edit'>
		<div class="tags">Tags:
			<g:each in="${ task.tags }" var="tag">
				<code> ${ tag }</code>
			</g:each>
		</div>
	</sec:noAccess>

	<div class="due">Due: <pomo:deadline date="${ task.deadline }"/></div>
	<div class="created">Created: <pomo:shortDate date="${ task.dateCreated }"/></div>
	<div>Deadline: <pomo:deadline date="${ new Date() }"></pomo:deadline></div>
</div>
