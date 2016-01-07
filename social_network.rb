class Panda
  attr_reader :name, :email, :gender
  
  def initialize(name, email, gender)
    @name = name
    @email = email
    @gender = gender
    @friends = []
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
    to_s
  end

  def to_s
    "#{@name}, #{@email}, #{@gender}"
  end
end
