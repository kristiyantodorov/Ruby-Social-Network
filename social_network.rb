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

  def hash
    @name.hash + @email.hash + @gender.hash
  end

  def to_s
    "#{@name}, #{@email}, #{@gender}"
  end
end

class SocialNetwork
  def initialize
    @network = {}
  end

  def has_panda(panda)
    @network.has_key?(panda.hash)
  end
  
  def add_panda(panda)
    raise "Invalid parameters passed." if @network.has_key?(panda.hash)
    @network[panda.hash] = []
  end
end
