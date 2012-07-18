package org.algl.pomodoro

import grails.plugins.springsecurity.Secured

@Secured(["ROLE_ADMIN"])
class TagController {

	static scaffold = Tag
}
