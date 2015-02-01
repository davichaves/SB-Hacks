class ChangeLastLoginDefault < ActiveRecord::Migration
  def change
  	change_column_default(:users, :last_login, DateTime.now)
  end
end
