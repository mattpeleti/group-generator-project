class Student
	attr_accessor :course, :name

	def initialize(name, course)
		@name = name
		@course = course
		course.students << self
	end



end