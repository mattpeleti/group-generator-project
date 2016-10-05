class Course
  attr_accessor :name, :teachers, :students, :groups

  @@all = []


  def initialize(name)
    @name = name
    @students = []
    @teachers = []
    @groups = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|teacher| teacher.name == name}
  end

  def create_groups(size)
    @teacher_name_array = self.teachers.map { |teacher| teacher.name } * (self.students.size / self.teachers.size)

    @groups = self.students.shuffle.each_slice(size).map.with_index(0) do |student_group, index|
      Group.new("Group #{index+1}: #{student_group.map {|student| student.name}.join(", ")} -- #{@teacher_name_array[index]}", @teachers, student_group)
      # self.teachers.each do |teacher|
      #   teacher.groups << "Group #{index+1}: #{student_group.map {|student| student.name}}"
      #   binding.pry
      # end
    end
  end



end



# self.groups.each_with_index { |group, index| group << @teacher_names_array[index]}

# teachers.cycle(students.size/teachers.size+1) { |teacher| puts teacher }

# def assign_teachers
#   @teacher_names_array = self.teachers.map { |teacher| teacher.name }
#   i = 0
#   j = 0
#   @groups.each_with_index do |group, index|
#     "#{index} #{group}"
#     @teacher_names_array.each_


# #   until i == @groups.length
#     "#{@groups[i]} - #{@teacher_names_array[j]}"
#     i += 1
#     j += 1
#     if j > @teacher_names_array.length - 1
#       j = 0
#     end
#   end
# end