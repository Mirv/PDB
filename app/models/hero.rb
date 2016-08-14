class Hero < ActiveRecord::Base
  validate :sums_of_attributes_more_than_start, :sums_of_attributes_less_than_start
  before_save :set_rest_of_attributes
  STARTING_STATS = 25

  def sums_of_attributes_more_than_start
    if STARTING_STATS < strenght + dexterity + vitality + intelligence + charisma
      errors.add(:strenght, "Sums of attributes must not be higher than #{STATS_SUM}")
    end
  end

  def sums_of_attributes_less_than_start
    if STARTING_STATS > strenght + dexterity + vitality + intelligence + charisma
      errors.add(:strenght, "Sums of attributes must not be less than #{STATS_SUM}")
    end
  end

  def set_rest_of_attributes
    self.reputation = 0
    self.experience = 0
    self.hp = (self.vitality * 3) + (self.strenght * 2)
    self.energy = (self.intelligence * 4)
  end
end
