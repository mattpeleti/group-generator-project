class Group
  attr_accessor :name, :teachers, :students, :groups

  def initialize(name, teachers, students)
    @name = name
    @teachers = teachers
    @students = students
    @groups = []
  end

  # def list_students
  # 	self.students
  # end

end