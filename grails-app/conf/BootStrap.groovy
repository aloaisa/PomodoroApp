import org.algl.pomodoro.Tag
import org.algl.pomodoro.Task

class BootStrap {

    def init = { servletContext ->
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
