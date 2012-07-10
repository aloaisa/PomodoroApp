package org.algl.pomodoro

class Tag {
	
	String name

	static hasMany = [tasks: Task]
	static belongsTo = Task
	
    static constraints = {
		name blank: false, unique: true
    }
	
	String toString() { return name }
}
