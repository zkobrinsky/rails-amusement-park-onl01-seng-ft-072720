class ChangeUsersMoodDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :mood, :"happy")
  end
end
