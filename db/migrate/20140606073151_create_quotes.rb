class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.date :date
      t.string :quote
      t.string :author

      t.timestamps
    end

    add_index :quotes, :date
  end
end
