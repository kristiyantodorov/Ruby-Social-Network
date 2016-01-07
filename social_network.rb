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

  def to_s
    puts "#{@name}, #{@email}, #{@gender}"
  end
end
