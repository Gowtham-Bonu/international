class RemoveLanguageToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :language, :string
  end
end
