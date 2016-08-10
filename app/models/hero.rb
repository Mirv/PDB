class Hero < ActiveRecord::Base
  validate :sums_of_attributes
  STATS_SUM = 20

  def sums_of_attributes
    if STATS_SUM <= strenght + dexterity + vitality + intelligence + charisma
      errors.add(:strenght, "Sums of attributes must not be higher than #{STATS_SUM}")
    end
  end
end
