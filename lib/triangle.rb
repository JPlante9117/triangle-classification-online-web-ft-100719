class Triangle
  
  attr_accessor :side1, :side2, :side3
  
  def self.initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end
  
  def is_equilateral?
    @side1 == @side2 && @side2 == @side3 ? true : false
  end
  
  def is_isoceles?
    if (@side1 == @side2 && @side2 != @side3) || (@side1 == @side3 && @side3 != @side2) || (@side2 == @side3 && @side3 != @side1)
      true
    else
      false
    end
  end
  
  def is_scalene?
    if @side1 != @side2 && @side2 != @side3 && @side1 != @side3
      true
    else
      false
    end
  end
  
  def is_invalid?
    @side1 + @side2 < @side3 ? true : false
  end
  
  def kind
    #returns either :equilateral, :isoceles, or :scalene
    if is_invalid?
      raise TriangleError
    elsif is_equilateral?
      :equilateral
    elsif is_isoceles?
      :isoceles
    elsif is_scalene?
      :scalene
    end
  end
  
  class TriangleError < StandardError
    
  end
  
end
