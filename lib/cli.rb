class CLI

	attr_accessor :current_user, :instructor_course


	def run
		system 'clear'
		puts "Hello instructor! Please enter your name: "
		@current_user = login
		help_menu
	end

	def login
		instructor_name = gets.chomp
		until Teacher.find_by_name(instructor_name) || instructor_name.downcase == "exit"
			break if instructor_name.downcase == "exit"
			puts "Sorry, we couldn't find you in our system. Please try again. "
			instructor_name = gets.chomp
		end
		puts "Welcome #{instructor_name}!"
		Teacher.find_by_name(instructor_name)
	end

	def get_instructor_course
		course_name = gets.chomp
		until Course.find_by_name(course_name) || course_name.downcase == "exit"
			break if course_name.downcase == "exit"
			puts "Sorry, that's not one of your courses. Try again. "
			course_name = gets.chomp
		end
		puts "You've selected #{course_name}!"
		Course.find_by_name(course_name)
	end

	def print_current_user_courses
		@current_user.courses.each_with_index do |course, index|
			puts "\t#{index + 1}. #{course.name}"
		end
	end

	def help_menu
		puts "Please select a course: "
		print_current_user_courses
		@instructor_course = get_instructor_course
		display_user_commands
	end

	def list_students
		@instructor_course.students.each_with_index do |student, index|
			puts "\t#{index + 1}. #{student.name}"
		end
	end

	def list_groups
		# @anotherarray = []
		@instructor_course.groups.each_with_index do |group, index|
			# binding.pry
			puts "\t#{index + 1}. #{group.name}"
			# @anotherarray << "\t#{index + 1}. #{group.name}"
		end

		# @annotherarray
		# # @instructor_course.groups.select {|instructor| instructor.split(" ").last}
	end

	def list_teachers
		@instructor_course.teachers.each_with_index do |teacher, index|
			puts "\t#{index + 1}. #{teacher.name}"
		end

		# @array = []
		# @instructor_course.teachers.each do |teacher|
		# 	@annotherarray.each do |indv_group|
		# 		if teacher.name == indv_group.split(" ").last
		# 			@array << indv_group.split(" ")[1]
		# 		end
		# 	end
		# end
		# @array
	end

	def sort_class
		puts "How big would you like the groups to be?"
		group_size = gets.chomp.to_i
		@instructor_course.create_groups(group_size)
		list_groups
	end

	def display_user_commands
		input = ""
		until input.downcase == "exit"
			puts "Please select a command by typing in the corresponding number."
			puts "\t1. Display list of students"
			puts "\t2. Display list of groups"
			puts "\t3. Display list of teachers"
			puts "\t4. Sort the class into groups"
			puts "\t   Type 'exit' to quit the program"
			input = gets.chomp
			case input
			when "1" then list_students
			when "2" then list_groups
			when "3" then list_teachers
			when "4" then sort_class
			end
		end
	end

end