class Teacher
  attr_accessor :name, :courses, :groups

  @@all = []

  def initialize(name)
    @name = name
    @courses = []
    @groups = []
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

  # def add_group(group)
  #   @groups << group
  #   group.teachers << self
  # end


  # def see_groups
  #   @array = []
  #   if @name == groups.each {|group| group.name.split(" ").last}
  #     @array << groups.each {|group| group.name.split(" ")[1]}
  #   end

  #   @array
  # end

end