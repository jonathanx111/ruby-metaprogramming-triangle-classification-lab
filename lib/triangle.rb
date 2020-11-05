# require 'pry'
# class Triangle
#   attr_accessor :length1, :length2, :length3
#   @@lengths = []

#   def initialize(length1, length2, length3)
#     @length1 = length1
#     @length2 = length2
#     @length3 = length3
#     @@lengths << self.length1
#     @@lengths << self.length2
#     @@lengths << self.length3

#   end

#   def kind
#     if @@lengths.count > 3
#       binding.pry
#       return "error"
#     end
#     if self.length1 == self.length2 && self.length2 == self.length3
#       return :equilateral
#     elsif  any_two_equal(@@lengths)
#       return :isosceles
#     elsif any_two_equal(@@lengths) == false
#       return :scalene
#     end
#   end
  
#   def any_two_equal(array)
#     array.combination(2).to_a.each do |l|
#       if l[0] == l[1]
#         return true
#       else 
#         return false
#       end
#     end
#   end
    
# end

class Triangle
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each do |side|
      real_triangle << false if side <= 0 
      if real_triangle.include?(false)
        begin
          raise TriangleError
        end
      end
    end
  end

  class TriangleError < StandardError
    def message
      "Please enter a valid triangle!!!"
    end
  end

end 
