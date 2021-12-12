class AddMoreToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users , :Surname , :string
    add_column :users , :Country , :string
    add_column :users , :State_Region , :string
  end
end
