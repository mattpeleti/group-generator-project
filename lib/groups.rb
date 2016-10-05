class Group
  attr_accessor :name, :teachers, :students, :groups

  def initialize(name, teachers, students)
    @name = name
    @teachers = teachers
    @students = students
    @groups = []
  end



end