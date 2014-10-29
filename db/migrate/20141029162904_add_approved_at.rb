class AddApprovedAt < ActiveRecord::Migration
  def change
    add_column :servers, :approved_at, :datetime
  end
end
