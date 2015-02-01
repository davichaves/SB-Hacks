class ChangeLastLoginDefaultAgain < ActiveRecord::Migration
  def change
  	change_column_default(:users, :last_login, nil)
  end
end
