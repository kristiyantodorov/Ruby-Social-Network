class Panda
  attr_reader :name, :email, :gender

  def initialize(name, email, gender)
    @name = name
    @email = email
    @gender = gender
  end

  def male?
    @gender == 'male'
  end

  def female?
    @gender == 'female'
  end

  def ==(other_panda)
    @name == other_panda.name and
    @email == other_panda.email and
    @gender == other_panda.gender
  end

  alias eql? ==

  def hash
    to_s.hash
  end

  def to_s
    "#{@name}, #{@email}, #{@gender}"
  end
end

class PandaSocialNetwork
  def initialize
    @network = {}
  end

  def has_panda(panda)
    @network.has_key?(panda)
  end

  def add_panda(panda)
    raise "Invalid parameters passed." if @network.has_key?(panda)
    @network[panda] = []
  end

  def make_friends(panda1, panda2)
    add_panda(panda1) unless has_panda(panda1)
    add_panda(panda2) unless has_panda(panda2)
    raise 'Pandas already frieds!' if @network[panda1].include? panda2
    @network[panda1] << panda2
    @network[panda2] << panda1
  end

  def connection_level(panda1, panda2)
    count = 0
    queue = {}
    queue[0] = [panda1]
    visited = []
    until queue.empty?
      current_level = queue[count]
      current_level -= visited
      p current_level
      current_level.each do |v|
        return count if v == panda2
        queue[count + 1] = []
        queue[count + 1] += @network[v]
        visited += current_level
      end
      count += 1
    end
    count
  end
end

panda1 = Panda.new '1', '1', '1'
panda2 = Panda.new '2', '2', '2'
panda3 = Panda.new '3', '3', '3'
panda4 = Panda.new '4', '4', '4'
panda5 = Panda.new '5', '5', '5'
panda6 = Panda.new '6', '6', '6'
panda7 = Panda.new '7', '7', '7'

net = PandaSocialNetwork.new


net.make_friends(panda1, panda2)
net.make_friends(panda1, panda3)
net.make_friends(panda2, panda4)
net.make_friends(panda2, panda5)
net.make_friends(panda3, panda6)
net.make_friends(panda3, panda7)
net.make_friends(panda5, panda7)

puts net.connection_level(panda1, panda5)
