class ChangePrefectureToAllowNull < ActiveRecord::Migration[7.0]
  def up
    change_column_null :books, :prefecture_id, true
  end

  def down
    change_column_null :books, :prefecture_id, false
  end
end
