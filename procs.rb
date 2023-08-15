# P R O C S - Procedures
# blocks are not objects

cube = proc { |x| x**3 }

# works differently in older versions of Ruby < 1.9
square = proc { |x| x**2 }

p cube.call(3)

p square.call(2)

def method_with_proc(p1, arg)
  p1.call(arg)
end

method_with_proc(cube, 3)

def method_with_procs(p1, arg1, p2, arg2)
  p p1.call(arg1)
  p p2.call(arg2)
end

method_with_procs(cube, 12, square, 12)

# use a proc as a block
# use & to convert proc to block vice versa

p (1..10).map(&cube)
p (1..10).select(&:even?)

odd = :odd?.to_proc
(1..11).map(&odd)

def takes_a_block(&block)
  p block
  block.call
end

takes_a_block { |_x| puts 'Hello world' }
