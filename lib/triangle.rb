class Triangle
  
  attr_accessor :side1, :side2, :side3
  
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @all_sides = [@side1, @side2, @side3]
  end
  
  def is_equilateral?
    @all_sides.all? {|side| side == @side1 } ? true : false
  end
  
  def is_isosceles?
    if @all_sides.uniq.length == 2
      true
    else
      false
    end
  end
  
  def is_scalene?
    if @all_sides.uniq.length = 3
      true
    else
      false
    end
  end
  
  def is_invalid?
    @side1 + @side2 < @side3 || @all_sides.include?(0) ? true : false
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
    
  end
  
end
