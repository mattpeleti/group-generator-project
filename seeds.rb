require_relative 'config/environment.rb'



students = ["Amanda Steckler", "Benjamin Henriquez", "Caleb Cox", "Charlie Spencer", "Chris Peleti", "Colby Pines", "Craig Iturbe", "Drew Nickerson", "Eoghan Leddy", "Jake Zappin", "James Segarra", "Jason Arnold", "Jason Gluck", "Jess Harrelson", "Jonathan Peterkin", "Kevin Evans", "Krissa Santos", "Laura Shapiro", "Marc Immediato", "Matt Peleti", "Nick Scaglione", "Niky Morgan", "Niti Patel", "Perry Garet", "Rebecca Yi", "Robert Lin", "Salomé Braganza", "Scott Lindquist", "Thomas Marren", "Wesley Friedman", "Zack Adams"]

web0916 = Course.new("Web Development Immersive")
students.each do |student|
  Student.new(student, web0916)
end

jeff = Teacher.new("Jeff")
jeff.add_course(web0916)
leigh = Teacher.new("Leigh")
leigh.add_course(web0916)
sam = Teacher.new("Sam")
sam.add_course(web0916)

# group1 = Group.new("group1", jeff, students)
# sliced_into_4_students = groups.students
#
# sliced_into_4_students.each do |group_of_4|
#   puts group_of_4
# end