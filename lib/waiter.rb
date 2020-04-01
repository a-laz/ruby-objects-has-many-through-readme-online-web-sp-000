class Waiter

  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end

  def customers
    meals.map do |meal|
      meal.customer
    end
  end

  def most_freq_customer
    customers.max_by{|c| customers.count(c)}
  end

  def meal_of_worst_tipping_customer
    meals.min { |m_1, m_2| m_1.tip <=> m_2.tip }
  end

  def avg_tips
    all_tips

  end

  def all_tips
    sum = 0
    meals.each {|meal| sum+=meal.tip}
    sum
  end

  def meal_count
    count = 0
    meals.each {|meal| meal.count}
    count
  end

end
