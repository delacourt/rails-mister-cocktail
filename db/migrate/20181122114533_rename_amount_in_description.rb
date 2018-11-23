class RenameAmountInDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :doses, :amount, :description
  end
end
