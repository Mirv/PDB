class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.integer :hp
      t.integer :energy
      t.integer :reputation
      t.integer :experience
      t.integer :strenght
      t.integer :dexterity
      t.integer :vitality
      t.integer :intelligence
      t.integer :charisma

      t.timestamps
    end
  end
end
