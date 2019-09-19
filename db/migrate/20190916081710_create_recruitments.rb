class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.string :title
      t.integer :recruitment_numbers
      t.string :hardware
      t.string :game_id
      t.string :communication_tool
      t.string :comment

      t.timestamps
    end
  end
end
