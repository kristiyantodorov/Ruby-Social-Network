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
      current_level = []
      queue[count].each { |v| current_level << v }
      queue.shift
      p current_level

      current_level.each do |v|
        return count if v == panda2
        visited << v
        queue[count + 1] = @network[v]
      end

      count += 1
    end
    count
  end

  def are_friends(panda1, panda2)
    return false unless has_panda(panda1)
    @network[panda1].include? panda2
  end

  def friends_of(panda)
    return false unless has_panda(panda)
    result = []
    @network[panda].each { |friend| result << friend }
    result
  end

  def how_many_gender_in_network(level, panda, gender)
    return 0 unless has_panda(panda)
    count = 0
    queue = []
    queue << [panda, 0]
    visited = [panda]
    while !queue.empty? and queue.first.last < level
      current_panda = queue.shift
      friends_of(current_panda.first).each do |friend|
        if !(visited.include? friend)
        queue << [friend, current_panda.last + 1]
        visited << friend
        end
      end
    end
    result = 0
    visited.each { |elem| result += 1 if elem.gender == gender}
    result
  end
end
