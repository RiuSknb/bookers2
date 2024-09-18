class CreateBook2s < ActiveRecord::Migration[6.1]
  def change
    create_table :book2s do |t|

      t.timestamps
    end
  end
end
