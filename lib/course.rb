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
    @groups = self.students.shuffle.each_slice(size).map.with_index(1) do |student_group, index|
      Group.new("Group #{index}: #{student_group.map {|student| student.name}}", @teachers, student_group)
    end
  end

end
