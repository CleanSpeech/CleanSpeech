class CreateUsersWordsSpeechAttempts < ActiveRecord::Migration
  def change
    create_table :users_words_speech_attempts do |t|
      t.integer :count

      t.timestamps null: false

      t.references :word
      t.references :speech_attempt
    end
  end
end
