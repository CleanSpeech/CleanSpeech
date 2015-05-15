class CreateUsersWords < ActiveRecord::Migration
  def change
    create_table :users_words do |t|
    t.timestamps null: false
    	
      t.references :user
      t.references :word
      
    end
  end
end
