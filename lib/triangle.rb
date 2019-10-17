class Triangle
  
  attr_accessor :side1, :side2, :side3
  
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @all_sides = [@side1, @side2, @side3].sort
  end
  
  def is_equilateral?
    @all_sides.all? {|side| side == @side1 } ? true : false
  end
  
  def is_isosceles?
    @all_sides.uniq.length == 2 ? true : false
  end
  
  def is_scalene?
    @all_sides.uniq.length == 3
  end
  
  def is_invalid?
    @all_sides[0] + @all_sides[1] <= @all_sides[2] || @all_sides.any? { |side| side <= 0 }? true : false
  end
  
  def kind
    #returns either :equilateral, :isoceles, or :scalene
    if is_invalid?
      raise TriangleError
    elsif is_equilateral?
      :equilateral
    elsif is_isosceles?
      :isosceles
    elsif is_scalene?
      :scalene
    end
  end
  
  class TriangleError < StandardError
    def message
      "Triangle is invalid. Does not pass triangle inequality, or sides are 0 or less."
    end
  end
  
end
