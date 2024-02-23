class AddNullFalseToBookFields < ActiveRecord::Migration[7.1]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :opinion, false
  end
end
