import org.algl.pomodoro.Tag
import org.algl.pomodoro.Task

class BootStrap {

    def init = { servletContext ->
			def workTag = new Tag(name: "Work").save(failOnError: true)
			def homeTag = new Tag(name: "Home").save(failOnError: true)
			
			def task = new Task(
					summary: "Working with Grails",
					details: "Learning with the screencast from SpringSource")

			task.addToTags(workTag);
			task.addToTags(homeTag);
			task.save(failOnError: true)
    }
    def destroy = {
    }
}
