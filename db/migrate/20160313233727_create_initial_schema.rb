class CreateInitialSchema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.timestamps null: false
    end

    create_table :labels do |t|
      t.string :name
      t.integer :user_id
      t.timestamps null: false
    end

    create_table :goals do |t|
      t.string :name
      t.integer :label_id
      t.integer :amount
      t.integer :user_id
      t.timestamps null: false
    end

    create_table :accomplishments do |t|
      t.string :time_frame
      t.integer :goal_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
