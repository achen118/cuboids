
class Cuboid
  
  #BEGIN public methods that should be your starting point

  def initialize(origin, length, height, width)
    @origin = origin
    @length = length
    @height = height
    @width = width
  end

  def move_to!(x, y, z)
    @origin[:x], @origin[:y], @origin[:z] = x, y, z
    return @origin
  end
  
  def vertices
    vert_arr = []
    vert_arr << [self.x1, self.y1, self.z1]
    vert_arr << [self.x2, self.y1, self.z1]
    vert_arr << [self.x1, self.y2, self.z1]
    vert_arr << [self.x1, self.y1, self.z2]
    vert_arr << [self.x1, self.y2, self.z2]
    vert_arr << [self.x2, self.y2, self.z1]
    vert_arr << [self.x2, self.y1, self.z2]
    vert_arr << [self.x2, self.y2, self.z2]
    return vert_arr
  end
  
  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
    if !(self.x2 < other.x1) &&
      !(other.x2 < self.x1) &&
      !(self.y2 < other.y1) &&
      !(other.y2 < self.y1) &&
      !(self.z2 < other.z1) &&
      !(other.z2 < self.z1)
      return true
    else
      return false
    end
  end

  #END public methods that should be your starting point 
  
  protected

  def x1
    @origin[:x]
  end

  def x2
    @origin[:x] + @length
  end

  def y1
    @origin[:y]
  end

  def y2
    @origin[:y] + @height
  end

  def z1
    @origin[:z]
  end

  def z2
    @origin[:z] + @width
  end
end