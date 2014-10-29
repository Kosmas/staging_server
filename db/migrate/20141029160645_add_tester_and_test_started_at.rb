class AddTesterAndTestStartedAt < ActiveRecord::Migration
  def change
    add_column :servers, :tester, :string
    add_column :servers, :test_started_at, :datetime
  end
end
