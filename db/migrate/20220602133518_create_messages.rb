class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :from_id
      t.integer :to_id
      t.text :body

      t.timestamps
    end
  end
end
