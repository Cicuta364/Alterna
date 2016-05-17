class AddClickToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :click, :integer
  end
end
