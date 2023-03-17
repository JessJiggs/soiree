# For this seed we will be using:
# - open-uri to download images from the internet
# - active storage to attach the images to the records
require "open-uri"
require "faker"
# use the following if you want to add img?
# file = File.open(File.join(__dir__, 'seed_images/doc2.png'))
# doc_user_profile5.photo.attach(io: file, filename: 'dr pp.png', content_type: 'image/png')
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# user email: "first_name@test.com",
# password: '123456',

# ++++++++++++++++++++++++++++++++++++SEEDS+++++++++++++++++++++++++++++++++++++++++++++++

venues = ["Rooftop Buiten", "Rusticana", "Welgemeend", "Mountain Manor Guest House", "LukKron", "The Argyle", "The Lookout", "Vineyard Hotel"]
addresses = ["Gardens, Cape Town", "Rondebosch, Cape Town", "Constantia, Cape Town", "Greenpoint, Cape Town", "Salt River, Cape Town", "Vredehoek, Cape Town", "Meadowridge, Cape Town"]
expense_categories = ["Food", "Drink", "Entertainment", "Decor", "Venue", "Services"]

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
puts "-" * 20
puts "Cleaning database..."
puts "-" * 20

Event.destroy_all
Task.destroy_all
Assignment.destroy_all
Collaboration.destroy_all
Expense.destroy_all
Guest.destroy_all
User.destroy_all
puts "*" * 20
puts "CREATING Planners, Collaborations, Events, Tasks, Assignments, Expenses, Guests"
puts "*" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ADAM - 1 user - organising 1 small event.
# An Event (that belongs to Adam)
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
user01 = User.create!(
  first_name: "Adam",
  last_name: "Wells",
  email: "adam@test.com",
  password: '123456'
)

event03 = Event.create!(
  name: "My Sick 30th Bash",
  description: "Rave Birthday Party for myself because I'm awesome!! Hooray 30!",
  start_date: DateTime.new(2023, 4, 3, 18, 0, 0),
  end_date: DateTime.new(2023, 4, 3, 23, 0, 0),
  venue_name: "Riks Diner",
  venue_address: "Salt River, Cape Town",
  est_guests: 21,
  total_budget: 4500
)

collab02 = Collaboration.create!(
  user_id: user01.id,
  event_id: event03.id,
  role: :owner
)

task04 = Task.create!(
  event_id: event03.id,
  name: "call mom",
  description: "cause mom's are awesome - call your mother",
  due_date: DateTime.new(2023, 4, 1),
  status: :to_do
)
assign05 = Assignment.create!(
  collaboration_id: collab02.id,
  task_id: task04.id
)


task05 = Task.create!(
  event_id: event03.id,
  name: "pay dj",
  description: "billingsly is in for his bucks, pay the man",
  due_date: DateTime.new(2023, 4, 2),
  status: :done
)
assign06 = Assignment.create!(
  collaboration_id: collab02.id,
  task_id: task05.id
)

task06 = Task.create!(
  event_id: event03.id,
  name: "order pizza",
  description: "Riks said to order in advance to avoid long waits and too many drunk people ... lol ",
  due_date: DateTime.new(2023, 4, 1),
  status: :to_do
)
assign07 = Assignment.create!(
  collaboration_id: collab02.id,
  task_id: task06.id
)

task07 = Task.create!(
  event_id: event03.id,
  name: "buy a new lumo shirt",
  description: "because UV party",
  due_date: DateTime.new(2023, 4, 1),
  status: :doing
)
assign08 = Assignment.create!(
  collaboration_id: collab02.id,
  task_id: task07.id
)

exp06 = Expense.create!(
  event_id: event03.id,
  name: "drink - welcome drinks",
  amount_spent: 58.99
)
exp07 = Expense.create!(
  event_id: event03.id,
  name: "venue - deposit",
  amount_spent: 58.99
)
exp08 = Expense.create!(
  event_id: event03.id,
  name: "entertainment,dj, - billingsly", #use tagable not concat/interpolation
  amount_spent: 58.99 #decimal ? double precision? currency class?
)

guest07 = Guest.create!(
  event_id: event03.id,
  first_name: "Sandy",
  last_name: "Hamburg",
  email_address: "sandy@test.com",
  phone_number: "1234567890",
  invitation_status: :accepted
)
guest08 = Guest.create!(
  event_id: event03.id,
  first_name: "Karl",
  last_name: "Hamburg",
  email_address: "karl@test.com",
  phone_number: "1234567890",
  invitation_status: :accepted
)
guest09 = Guest.create!(
  event_id: event03.id,
  first_name: "Marcus",
  last_name: "Flutoni",
  email_address: "marcus@test.com",
  phone_number: "1236540890",
  invitation_status: :declined
)
guest06 = Guest.create!(
  event_id: event03.id,
  first_name: "Eric",
  last_name: "Clayptone",
  email_address: "eric@test.com",
  phone_number: "1234567098",
  invitation_status: :invited
)
guest05 = Guest.create!(
  event_id: event03.id,
  first_name: "Sarah",
  last_name: "McGraw",
  email_address: "eric@test.com",
  phone_number: "1234567098",
  invitation_status: :invite_not_sent
)

puts "user01 = #{user01.first_name}, user id: #{user01.id}, user email: #{user01.email}"
puts "Event03 =This is #{user01.first_name}'s '#{event03.name} ' (with event_id#{event03.id}), taking place on #{event03.start_date}, at #{event03.venue_name}"
puts "Task '#{task04.name}' is assigned to #{user01.first_name} for doing on #{event03.name} by #{task04.due_date}"
puts "-" * 20
puts "************************--------************************"

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# EVE - An event planner who plans multiple events at once.
# An Event (that belongs to Eve)
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
user011 = User.create!(
  first_name: "Eve",
  last_name: "Lorde",
  email: " eve@test.com",
  password: '123456'
)

event13 = Event.create!(
  name: "Zepadelle",
  description: "Safari themed wedding for the Zepelinni's",
  start_date: DateTime.new(2023, 5, 5, 15, 0, 0), # add date
  end_date: DateTime.new(2023, 5, 6, 0, 0, 0), #date format
  venue_name: "Vineyard Hotel",
  venue_address: "Claremont, Cape Town",
  est_guests: 300, #int
  total_budget: 200000
)

collab12 = Collaboration.create!(
  user_id: user011.id,
  event_id: event13.id,
  role: :owner
)

task14 = Task.create!(
  event_id: event13.id,
  name: "Pay Floraelle - church Flowers",
  description: "Pay Floraelle for the church Flowers, update the budget",
  due_date: DateTime.new(2023, 5, 3, 10, 0, 0),
  status: :to_do
)
assign15 = Assignment.create!(
  collaboration_id: collab12.id,
  task_id: task14.id
)

exp16 = Expense.create!(
  event_id: event13.id,
  name: "welcome drinks",
  amount_spent: 5800.99
)

guest17 = Guest.create!(
event_id: event13.id,
first_name: "Harold",
last_name: "Murakiasetti",
email_address: "harold@test.com",
phone_number: "1234567890",
invitation_status: :invited
)

task15 = Task.create!(
  event_id: event13.id,
  name: "Call Rob for plumbus",
  description: "he still owes you a favour back for the spares",
  due_date: DateTime.new(2023, 5, 1, 10, 30, 0),
  status: :to_do
)
assign16 = Assignment.create!(
  collaboration_id: collab12.id, # change this ?
  task_id: task15.id
)

task16 = Task.create!(
  event_id: event13.id,
  name: "book caterer",
  description: "make sure you book the caterer for the canapes. NO FISH! ***Allergy warning!",
  due_date: DateTime.new(2023, 5, 2),
  status: :doing
)
assign17 = Assignment.create!(
  collaboration_id: collab12.id,
  task_id: task16.id
)

task17 = Task.create!(
  event_id: event13.id,
  name: "Book DJ BoogeyWoogey",
  description: "Madmoiselle said she liked BGweegys set the most - lets book her asap so we don't miss out - shes a hoot",
  due_date: DateTime.new(2023, 5, 3),
  status: :done
)
assign18 = Assignment.create!(
  collaboration_id: collab12.id, # change ?
  task_id: task17.id
)

exp17 = Expense.create!(
  event_id: event13.id,
  name: "welcome drinks",
  amount_spent: 1500
)
exp18 = Expense.create!(
  event_id: event13.id,
  name: "@Floraelle - 'decor_flwr'",# category and or tagable ? @suppliers ?
  amount_spent: 5876.55
)
exp19 = Expense.create!(
  event_id: event13.id,
  name: "DJ BJWG",
  amount_spent: 7050
)

guest18 = Guest.create!(
  event_id: event13.id,
  first_name: "Humpty",
  last_name: "Dumpty",
  email_address: "humpty@test.com",
  phone_number: "1234567890",
  invitation_status: :accepted
)

guest19 = Guest.create!(
  event_id: event13.id,
  first_name: "Micky",
  last_name: "Mouse",
  email_address: "micky@test.com",
  phone_number: "1234567890",
  invitation_status: :invited
)
guest16 = Guest.create!(
  event_id: event13.id,
  first_name: "Minnie",
  last_name: "Mouse",
  email_address: "minnie@test.com",
  phone_number: "1234567890",
  invitation_status: :invited
)

puts "user011 = #{user011.first_name}, user id: #{user011.id}, user email: #{user011.email}"
puts "Event13 = This is #{user011.first_name}'s #{event13.name} (event_id#{event13.id}), taking place on #{event13.start_date}, at #{event13.venue_name}"
puts "************************--------************************"
###################################################################################
# EVE - second event
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
# therefore Eve user011, collab22, event23, task24, assign25, exp26, guest27



event23 = Event.create!(
  name: "Fox Wedding",
  description: "Mr and Mrs Fox are re-newing their vows and celebrating 10 years together with their besties",
  start_date: DateTime.new(2023, 4, 17, 19, 0, 0),# add date
  end_date: DateTime.new(2023, 4, 17, 23, 0, 0), #date format
  venue_name: "Babylonstorenepia",
  venue_address: "Meadowridge, Cape Town",
  est_guests: 20, #int
  total_budget: 20000 #decimal
)
collab22 = Collaboration.create!(
  user_id: user011.id,#eve is still the event owner
  event_id: event23.id,
  role: :owner
)


task24 = Task.create!(
  event_id: event23.id,
  name: "Pay Floraelle for the Reception Hall Flowers",
  description: "Pay Floraelle for the Reception Hall Flowers, update the budget",
  due_date: DateTime.new(2023, 4, 10, 16, 0, 0),
  status: :to_do
)

assign25 = Assignment.create!(
  collaboration_id: collab22.id,
  task_id: task14.id
)

exp26 = Expense.create!(
  event_id: event23.id,
  name: "welcome drinks",
  amount_spent: 5800.99
)

guest27 = Guest.create!(
  event_id: event23.id,
  first_name: "Hector",
  last_name: "Peters",
  email_address: "hector@test.com",
  phone_number: "1234567890",
  invitation_status: :invited
)

task25 = Task.create!(
  event_id: event23.id,
  name: "book cake lady",
  description: "she takes forever",
  due_date: DateTime.new(2023, 4, 8, 12, 0, 0),
  status: :to_do
)
assign26 = Assignment.create!(
  collaboration_id: collab22.id, # change this ?
  task_id: task25.id
)

task26 = Task.create!(
  event_id: event23.id,
  name: "'Pay' 'Rietta' - 'decor_flwr'",
  description: "Pay Rieatta for the church Flowers, update the budget",
  due_date: DateTime.new(2023, 4, 1, 14, 0, 0),
  status: :doing
)
assign27 = Assignment.create!(
  collaboration_id: collab22.id,
  task_id: task26.id
)

task27 = Task.create!(
  event_id: event23.id,
  name: "Book Band ChampanJey",
  description: "honourable guest said she liked the energy of the team, fits her mood",
  due_date: DateTime.new(2023, 4, 05, 15, 30, 0),
  status: :to_do
)
assign28 = Assignment.create!(
  collaboration_id: collab22.id,
  task_id: task27.id
)

exp27 = Expense.create!(
  event_id: event23.id,
  name: "welcome drinks",
  amount_spent: 1800
)
exp28 = Expense.create!(
  event_id: event23.id,
  name: "@Rietta - 'decor_flwr'",
  amount_spent: 5876.55
)
exp29 = Expense.create!(
  event_id: event23.id,
  name: "band ChampanJey",
  amount_spent: 1200
)

guest28 = Guest.create!(
  event_id: event23.id,
  first_name: "Hillary",
  last_name: "Clint",
  email_address: "hillary@test.com",
  phone_number: "1234567890",
  invitation_status: :invited
)

guest29 = Guest.create!(
  event_id: event23.id,
  first_name: "Daffy",
  last_name: "Ducket",
  email_address: "daffy@test.com",
  phone_number: "1234567890",
  invitation_status: :accepted
)
guest26 = Guest.create!(
  event_id: event23.id,
  first_name: "Auzo",
  last_name: "Floot",
  email_address: "Auzo@test.com",
  phone_number: "1234567890",
  invitation_status: :accepted
)
guest27 = Guest.create!(
  event_id: event23.id,
  first_name: "Ravi",
  last_name: "Raj",
  email_address: "Ravi@test.com",
  phone_number: "1234567890",
  invitation_status: :accepted
)
puts "user011 = #{user011.first_name}, user id: #{user011.id}, user email: #{user011.email}"
puts "This is #{user011.first_name}'s '#{event23.name}' (event_id#{event23.id}), taking place on #{event23.start_date}, at #{event23.venue_name}"
puts "************************--------************************"
##################################################################################
# EVE - third event
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
# therefore Eve user031, collab32, event33, task34, assign35, exp36, guest37


event33 = Event.create!(
  name: "James Wedding",
  description: "Bonnie and Clyde are having a small home wedding but oozes class",
  start_date: DateTime.new(2023, 4, 17, 19, 0, 0),# add date
  end_date: DateTime.new(2023, 4, 17, 23, 0, 0), #date format
  venue_name: "Constantia Estate",
  venue_address: "Constantia, Cape Town",
  est_guests: 80, #int
  total_budget: 50000 #decimal
)
collab32 = Collaboration.create!(
  user_id: user011.id,#eve is still the event owner
  event_id: event33.id,
  role: :owner
)

task34 = Task.create!(
  event_id: event33.id,
  name: "Pay Violet - Flowers",
  description: "Pay violet for flowers and update budget",
  due_date: DateTime.new(2023, 4, 10, 16, 0, 0),
  status: :to_do
)

assign35 = Assignment.create!(
  collaboration_id: collab32.id,
  task_id: task34.id
)

exp36 = Expense.create!(
  event_id: event33.id,
  name: "All bar drinks",
  amount_spent: 9800.50
)

guest37 = Guest.create!(
  event_id: event33.id,
  first_name: "Pascal",
  last_name: "Scala",
  email_address: "pascal@test.com",
  phone_number: "1234567890",
  invitation_status: :invited
)

task35 = Task.create!(
  event_id: event33.id,
  name: "book entertainment - dj and fire dancers",
  description: "none",
  due_date: DateTime.new(2023, 4, 8, 12, 0, 0),
  status: :to_do
)
assign36 = Assignment.create!(
  collaboration_id: collab32.id, # change this ?
  task_id: task35.id
)

task36 = Task.create!(
  event_id: event33.id,
  name: "bill client for the deposit on crockery",
  description: "we discussed a budget update and they approved - please incl in update",
  due_date: DateTime.new(2023, 4, 1, 14, 0, 0),
  status: :doing
)
assign37 = Assignment.create!(
  collaboration_id: collab32.id,
  task_id: task36.id
)

task37 = Task.create!(
  event_id: event33.id,
  name: "Call Jay for security ",
  description: "Check that they can accomodate us with the event spec - 3xstaff required outside",
  due_date: DateTime.new(2023, 4, 05, 15, 30, 0),
  status: :to_do
)
assign38 = Assignment.create!(
  collaboration_id: collab32.id,
  task_id: task37.id
)

exp37 = Expense.create!(
  event_id: event33.id,
  name: "Mobile bar service",
  amount_spent: 6700
)
exp38 = Expense.create!(
  event_id: event33.id,
  name: "@Rietta - 'decor_flwr'",
  amount_spent: 4005.67
)
exp39 = Expense.create!(
  event_id: event33.id,
  name: "buble machine",
  amount_spent: 1250
)

guest38 = Guest.create!(
  event_id: event33.id,
  first_name: "Deidre",
  last_name: "Kleon",
  email_address: "deidre@test.com",
  phone_number: "1234567890",
  invitation_status: :invited
)

guest39 = Guest.create!(
  event_id: event33.id,
  first_name: "Nala",
  last_name: "Lion",
  email_address: "nala@test.com",
  phone_number: "1234567890",
  invitation_status: :accepted
)
guest36 = Guest.create!(
  event_id: event33.id,
  first_name: "Simba",
  last_name: "Lion",
  email_address: "simba@test.com",
  phone_number: "1234567890",
  invitation_status: :accepted
)
guest37 = Guest.create!(
  event_id: event33.id,
  first_name: "Lesego",
  last_name: "Ndahm",
  email_address: "lesego@test.com",
  phone_number: "1234567890",
  invitation_status: :accepted
)

puts "user011 = #{user011.first_name}, user id: #{user011.id}, user email: #{user011.email}"
puts "This is #{user011.first_name}'s '#{event33.name}' (event_id#{event33.id}), taking place on #{event33.start_date}, at #{event33.venue_name}"
puts "************************--------************************"
###########################################################################################################################
# Faker data for guests

puts "************************--------************************"
puts "generating guestlist"
30.times do
 guest = Guest.create!(
  event_id: event33.id,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email_address: Faker::Internet.email,
  phone_number: Faker::PhoneNumber.phone_number,
  invitation_status: :invited
)
puts "Event_id,#{event33.id}, Guest name: #{guest[:first_name]},#{guest[:last_name]}, guest id: #{guest.id}, email: #{guest.email_address}, phone: #{guest.phone_number}, invitation_status: #{guest[:invitation_status]}."
end
