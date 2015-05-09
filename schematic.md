# Allxie

## MVP

  - Authentication/Authorization
  - Users can enter words they don't want to say
  - App can track when user says words they have input in a particular speech
  - App can time how long the particular speech takes
  - App makes a sound at you each time you say a word you don't want to say
  - Compare a block of text to something you say

## Wishlist

  - Build graphs
  - Words that users overuse, suggestions for words to filter


## Modeling

### No-no Features

#### User Model: users
id
email
password_digest

#### words
id
word

#### speech_attempts
*Within the MVP, this will essentially be attempts. So even if I practice a particular passage from Shakespeare many times, each attempt (pushing play) is considered a totally separate speech.*
id
user_id
speech_name
time

#### users_words — N:M
*Any word a user adds to their account is added to the words table (if it doesn't already exist), and is then associated with that user via this table.*
id <- PK
user_id <- FK
word_id <- FK

#### users_words_speech_attempts — N:M
*Join table between your speeches and the words you are trying to track*
users_words_id <- FK
speech_id <- FK
count

---

### Text Feature (Wish List for Now)
For the feature: input a block of text and compare to your speech

#### input_text 1:M
id <- PK
text
user_id <- FK

#### spoken_text 1:M
id <- PK
text
input_text_id <- FK
