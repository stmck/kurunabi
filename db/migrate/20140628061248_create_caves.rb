class CreateCaves < ActiveRecord::Migration
  def change
    create_table :caves do |t|

      t.timestamps
    end
  end
end
