package org.algl.pomodoro

import grails.plugins.springsecurity.Secured

class TaskController {
	static scaffold = Task
	
	def springSecurityService  
	
	@Secured(["ROLE_USER"])
	def index = {
		def tasks = Task.findAllByStatus("Open", [sort: "deadline", order: "asc"])
		def tags = Tag.list(sort: "name", order: "asc")
		
		return [tasks: tasks, tags: tags]
	}
	
	private currentUser() {
		User.get(springSecurityService.principal.id)
	}
}
