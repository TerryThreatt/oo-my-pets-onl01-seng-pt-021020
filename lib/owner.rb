class Owner
  @@all = []
  @@pets = {:dogs => [], :cats => []}
  @@count = 0 
  attr_reader :name, :species
  attr_accessor :pets, :cats, :dogs 
  def initialize(name, species = "human")
    @name = name 
    @species = species
    @@all << self 
    @@count +=1 
  end 
  def say_species
    "I am a #{@species}."
  end 
  def self.all
    @@all 
  end 
  def self.count 
    @@all.size 
  end 
  def self.reset_all  
    @@all.clear
  end 
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end 
  def dogs 
    Dog.all.select {|dog| dog.owner == self} 
  end 
   def buy_cat(the_cats_name) 
    Cat.new(the_cats_name, self)
  end
  def buy_dog(the_dogs_name)
    Dog.new(the_dogs_name, self)
  end
  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end 
  end 
  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end 
  end 
  def sell_pets
    Cat.all.each do |cat, owner|
      cat.mood = "nervous"
      cat.owner = nil 
    end 
    Dog.all.each do |dog, owner|
      dog.mood = "nervous" 
      dog.owner = nil
    end 
  end 
  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 
end