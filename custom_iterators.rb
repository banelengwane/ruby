class Array
  def custom_each
    i = 0
    while i < self.length do 
      yield self[i]
      i += 1
    end
    self
  end
end

[2, 3, 4].custom_each {|x| x**2}
1.upto(10).to_a.custom_each {|x| puts x if x.even? }

module Enumerable # included in classes with each
  #function that takes an array, use a criteria to group the data into to groups
  # then saves the 2 new arrays into a new array
  def group_by_criteria
    yes_group =[]
    no_group = []
    self.each do |x|
      if yield(x)
        yes_group << x
      else 
        no_group << x
      end
    end
    [yes_group, no_group]
  end
end

p 1.upto(10).to_a.group_by_criteria {|x| x.even? }

# try define select, find, any? map - defined on Enumerable
# map! (defined on Array)