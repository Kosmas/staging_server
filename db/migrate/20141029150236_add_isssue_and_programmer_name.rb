class AddIsssueAndProgrammerName < ActiveRecord::Migration
  def change
    add_column :servers, :issue, :string
    add_column :servers, :programmer, :string
  end
end
