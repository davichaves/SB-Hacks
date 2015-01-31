class FixColumnNameSigns < ActiveRecord::Migration
  def change
  	rename_column :signs, :letter, :symbol
  end
end
