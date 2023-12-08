class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :skill_name, null: false
      t.integer :skill_status_id, null: false
      t.integer :skill_level
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
