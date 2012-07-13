import org.algl.pomodoro.Tag
import org.algl.pomodoro.Task
import org.algl.pomodoro.Role
import org.algl.pomodoro.User
import org.algl.pomodoro.UserRole

class BootStrap {
	
    def init = { servletContext ->
		
		// Create Users a Roles
		def userRole = Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save(failOnError: true)
		def adminRole = Role.findByAuthority("ROLE_ADMIN") ?: new Role(authority: "ROLE_ADMIN").save(failOnError: true)
		
		def userAdmin = User.findByUsername("admin") ?: new User(username: "admin",
																	password: "alvaro",
																	enabled: true,
																	accountExpired: false,
																	accountLocked: false,
																	passwordExpired: false).save(failOnError: true)

		if (!userAdmin.authorities.contains(userRole)) {
			UserRole.create userAdmin, userRole, true
		}
		if (!userAdmin.authorities.contains(adminRole)) {
			UserRole.create userAdmin, adminRole, true
		}
														
		def userNormal = User.findByUsername("alvaro") ?: new User(username: "alvaro", 
																	password: "alvaro", 
																	enabled: true, 
																	accountExpired: false, 
																	accountLocked: false, 
																	passwordExpired: false).save(failOnError: true)
		if (!userNormal.authorities.contains(userRole)) {
			UserRole.create userNormal, userRole, true
		}
																
		assert User.count() == 2
		assert Role.count() == 2
		assert UserRole.count() == 3
		
		
		// Create tasks and tags
		def workTag = new Tag(name: "Work").save(failOnError: true)
		def homeTag = new Tag(name: "Home").save(failOnError: true)
		def freeTag = new Tag(name: "Free").save(failOnError: true)
			
		def task1 = new Task(
				summary: "Working with Grails",
				details: "Learning with the screencast from SpringSource",
				status: "Open",
				deadline: new Date()
				)

		task1.addToTags(workTag);
		task1.addToTags(homeTag);
		task1.save(failOnError: true)
		
		def task2 = new Task(
			summary: "Reading",
			details: "Reading Programming Groovy Book",
			status: "Open",
			deadline: new Date() + 10
			)

		task2.addToTags(homeTag);
		task2.addToTags(freeTag);
		task2.save(failOnError: true)
			
		def task3 = new Task(
			summary: "Resolving a bug",
			details: "Simple bug Jira-902",
			status: "Open",
			deadline: new Date() + 3
			)

		task3.addToTags(homeTag);
		task3.save(failOnError: true)
    }
	
    def destroy = {
    }
}
