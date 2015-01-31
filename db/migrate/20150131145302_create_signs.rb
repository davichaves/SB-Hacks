class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.string :letter
      t.string :image

      t.timestamps null: false
    end
  end
end
