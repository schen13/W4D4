class MakeBandNamesUnique < ActiveRecord::Migration[5.2]
  def change
    change_column :bands, :name, :string, unique: true
  end
end
