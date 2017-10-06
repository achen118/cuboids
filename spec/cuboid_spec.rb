require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.  
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  
  describe "move_to" do
    subject { Cuboid.new({x: 1, y: 2, z: 3}, 5, 3, 4) }
    it "changes the origin in the simple happy case" do
      expect(subject.move_to!(1,2,3)).to eq({x: 1, y: 2, z: 3})
    end
  end    
  
  subject(:cuboid1) { Cuboid.new({x: 1, y: 2, z: 3}, 5, 3, 4) }
  subject(:cuboid2) { Cuboid.new({x: 5, y: 4, z: 5}, 3, 6, 4) }
  subject(:cuboid3) { Cuboid.new({x: 1, y: 2, z: 3}, 5, 3, 4) }
  subject(:cuboid4) { Cuboid.new({x: 2, y: 3, z: 4}, 1, 1, 1) }
  subject(:cuboid5) { Cuboid.new({x: 6, y: 2, z: 3}, 5, 3, 4) }
  subject(:cuboid6) { Cuboid.new({x: 20, y: 30, z: 20}, 5, 3, 4) }

  describe "intersects?" do
    it "returns true if the two cuboids intersect each other" do
      expect(cuboid1.intersects?(cuboid2)).to be true
    end
    it "returns true if two equal cuboids are directly on top of each other" do
      expect(cuboid1.intersects?(cuboid3)).to be true
    end
    it "returns true if one cuboid is inside the other" do
      expect(cuboid1.intersects?(cuboid4)).to be true
    end
    it "returns true if the two cuboids share an axis" do
      expect(cuboid1.intersects?(cuboid5)).to be true
    end
    it "returns false if the two cuboids do not intersect each other" do
      expect(cuboid1.intersects?(cuboid6)).to be false
    end
  end

  describe "vertices" do
    it "returns the 8 vertices of a cuboid" do
      expect(cuboid1.vertices).to eq([
        [1, 2, 3],
        [6, 2, 3],
        [1, 5, 3],
        [1, 2, 7],
        [1, 5, 7],
        [6, 5, 3],
        [6, 2, 7],
        [6, 5, 7]
      ])
    end
  end
end
