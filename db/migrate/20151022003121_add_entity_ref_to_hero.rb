class AddEntityRefToHero < ActiveRecord::Migration
  def change
    add_reference :heros, :entity, index: true, foreign_key: true
  end
end
