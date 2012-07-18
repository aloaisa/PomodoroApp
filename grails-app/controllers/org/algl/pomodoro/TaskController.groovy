package org.algl.pomodoro

import grails.plugins.springsecurity.Secured

@Secured(["ROLE_USER"])
class TaskController {
	static scaffold = Task
	
	def springSecurityService
	
	def index = {
		def tasks = Task.findAllByStatus("Open", [sort: "deadline", order: "asc"])
		def tags = Tag.list(sort: "name", order: "asc")
		
		return [tasks: tasks, tags: tags]
	}

	def list = {
		redirect action: 'index', params: params
	}

	private currentUser() {
		User.get(springSecurityService.principal.id)
	}
}
