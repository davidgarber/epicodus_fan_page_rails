class EpicodusDb < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
