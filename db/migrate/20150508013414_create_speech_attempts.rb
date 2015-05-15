class CreateSpeechAttempts < ActiveRecord::Migration
  def change
    create_table :speech_attempts do |t|
      t.string :speech_name
      t.integer :time

      t.references :user

      t.timestamps null: false
    end
  end
end
