# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "liz@starin.com", password: "password", first_name: "Liz", last_name: "Starin")
User.create(email: "jason@reigal.com", password: "password", first_name: "Jason", last_name: "Reigal")
User.create(email: "tilly@reigal.com", password: "password", first_name: "Tilly", last_name: "Reigal")
User.create(email: "moogles@starin.com", password: "password", first_name: "Moogles", last_name: "Starin")
User.create(email: "noa@wheeler.com", password: "password", first_name: "Noa", last_name: "Wheeler")
User.create(email: "maurice@leutenegger.com", password: "password", first_name: "Maurice", last_name: "Leutenegger")

u = User.find(1).build_profile(:city => "Brooklyn", :state => "New York", :country => "United States", :bio => "Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, `and what is the use of a book,' thought Alice `without pictures or conversation?'")
u.save

u = User.find(2).build_profile(:city => "Brooklyn", :state => "New York", :country => "United States", :bio => "So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her.")
u.save

u = User.find(3).build_profile(:city => "Brooklyn", :state => "New York", :country => "United States", :bio => "In another moment down went Alice after it, never once considering how in the world she was to get out again.")
u.save

u = User.find(4).build_profile(:city => "Rockville", :state => "Maryland", :country => "United States", :bio => "The rabbit-hole went straight on like a tunnel for some way, and then dipped suddenly down, so suddenly that Alice had not a moment to think about stopping herself before she found herself falling down a very deep well.")
u.save

u = User.find(5).build_profile(:city => "Brooklyn", :state => "New York", :country => "United States")
u.save

u = User.find(6).build_profile(:city => "Washington", :state => "DC", :country => "United States")
u.save



Friendship.create(:user_id => 1, :friend_id => 2)
Friendship.create(:user_id => 1, :friend_id => 4)
Friendship.create(:user_id => 1, :friend_id => 5)
Friendship.create(:user_id => 2, :friend_id => 3)
Friendship.create(:user_id => 3, :friend_id => 4)
Friendship.create(:user_id => 3, :friend_id => 5)
Friendship.create(:user_id => 4, :friend_id => 5)

p = User.find(1).posts.build(:content => "I'm hungry. OM NOM NOM")
p.save
p = User.find(1).posts.build(:content => "Oh dear! Oh dear! I shall be late!")
p.save
p = User.find(2).posts.build(:content => "I wonder if I shall fall right through the earth! How funny it'll seem to come out among the people that walk with their heads downward! The Antipathies, I think--")
p.save
p = User.find(4).posts.build(:content => "There were doors all round the hall, but they were all locked; and when Alice had been all the way down one side and up the other, trying every door, she walked sadly down the middle, wondering how she was ever to get out again.")
p.save
p = User.find(3).posts.build(:content => "It was all very well to say `Drink me,' but the wise little Alice was not going to do that in a hurry.")
p.save
p = User.find(3).posts.build(:content => "`What a curious feeling!' said Alice; `I must be shutting up like a telescope.'")
p.save
p = User.find(3).posts.build(:content => "Curiouser and curiouser!")
p.save
p = User.find(4).posts.build(:content => "`Your hair wants cutting,' said the Hatter. He had been looking at Alice for some time with great curiosity, and this was his first speech.")
p.save
p = User.find(6).posts.build(:content => "`Once upon a time there were three little sisters,' the Dormouse began in a great hurry; `and their names were Elsie, Lacie, and Tillie; and they lived at the bottom of a well--'")
p.save
p = User.find(6).posts.build(:content => "it's very easy to take more than nothing")
p.save
p = User.find(1).posts.build(:content => "It was a treacle-well.")
p.save
p = User.find(1).posts.build(:content => "We beg your acceptance of this elegant thimble")
p.save






