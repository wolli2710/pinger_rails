class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.integer :domain_id

      t.timestamps
    end
  end
end
