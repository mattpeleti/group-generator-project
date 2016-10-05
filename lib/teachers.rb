class Teacher
  attr_accessor :name, :courses, :groups

  @@all = []

  def initialize(name)
    @name = name
    @courses = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|teacher| teacher.name == name}
  end

  def add_course(course)
    @courses << course
    course.teachers << self
  end

end