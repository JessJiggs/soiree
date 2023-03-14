# For this seed we will be using:
# - open-uri to download images from the internet
# - active storage to attach the images to the records
require "open-uri"
# use the following if you want to add img
# file = File.open(File.join(__dir__, 'seed_images/doc2.png'))
# doc_user_profile5.photo.attach(io: file, filename: 'dr pp.png', content_type: 'image/png')
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# user email: "first_name@test.com",
# password: '123456',

# ++++++++++++++++++++++++++++++++++++SEEDS+++++++++++++++++++++++++++++++++++++++++++++++
# # 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
#SEEDS
# user01 = User.create!(
#   first_name: " ",
#   last_name: " ",
#   email: " @test.com",
#   password: '123456',
# )
# puts "User01 = #{user1.first_name}, user id: #{user1.id}, user email: #{user1.email}"

# collab02 = Collaboration.create!(
#   user_id: user01.id
#   event_id: event03.id
#   role: "Planner"
# )

# event03 = Event.create!(
#   name: "evnt nm",
#   description: "Safari themed wedding for the Zepelinni's", "short descript - limit chars on form input - validates length"
#   start_at: "Dont know how to add a date properly fri 17 March 2023 at 19:00" #format?
#   end_at: "same: date and time" #format ?
#   venue_name: "Vineyard Hotel" #can be madeup
#   venue_address: "Claremont, Cape Town", #use a real address
#   est_guests: int
#   total_budget: decimal
# )
# puts "Event03 =This is #{user01.first_name}'s #{event03.name} (event_id#{event03.id}), taking place on #{event03.start_at}, at #{event03.venue_name}"

# task04 = Task.create!(
#   event_id: event03.id
#   name:
#   description:
#   due_date:
#   status:
# )

# assign05 = Assignment.create!(
#   collaboration_id: collab02.id
#   task_id: task04.id
# )

# exp06 = Expense.create!(
#   event_id: event03.id
#   name: exp_cat_array.sample + "welcome drinks"
#   amount_spent: 58.99
# )

# guest07 = Guest.create!(
# event_id: event03.id
# first_name: "mmmmmm"
# last_name: "nnnnnn"
# email_address: "mmmmmm@test.com"
# phone_number: 123 456 7890
# invite_status: false
# rsvp_status: false
# )
# ++++++++++++++++++++++++++++++++++++SEEDS+++++++++++++++++++++++++++++++++++++++++++++++

venue_array = ["Rooftop Buiten", "Rusticana", "Welgemeend", "Mountain Manor Guest House", "LukKron", "The Argyle", "The Lookout", "Vineyard Hotel"]
address_array = ["Gardens, Cape Town", "Rondebosch, Cape Town", "Constantia, Cape Town", "Greenpoint, Cape Town", "Salt River, Cape Town", "Vredehoek, Cape Town", "Meadowridge, Cape Town"]
exp_cat_array = ["Food", "Drink", "Entertainment", "Decor", "Venue", "Services"]
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
puts "-" * 20
puts "Cleaning database..."
puts "-" * 20
User.destroy_all
Event.destroy_all
Task.destroy_all
Collaboration.destroy_all
Assignment.destroy_all
Expenses.destroy_all
Guests.destroy_all
puts "*" * 20
puts "CREATING Planners, Collaborations, Events, Tasks, Assignments, Expenses, Guests"
puts "*" * 20
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ADAM - 1 user - organising 1 small event anually (for starters).
# An Event (that belongs to Adam)
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
user01 = User.create!(
  first_name: "Adam",
  last_name: "Wells",
  email: "adam@test.com",
  password: '123456',
)
puts "User1 = #{user1.first_name}, user id: #{user1.id}, user email: #{user1.email}"

collab02 = Collaboration.create!(
  user_id: user01.id,
  event_id: event03.id,
  role: "Myself?",
)

event03 = Event.create!(
  name: "My Sick 30th Bash",
  description: "Rave Birthday Party for myself because I'm awesome!! Hooray 30!",
  start_at: "Dont know how to add a date properly fri 17 March 2023 at 19:00",
  end_at: "same: date and time",
  venue_name: "Riks Diner",
  venue_address: "Salt River, Cape Town",
  est_guests: 21 #int
  total_budget: 2000 #currency/decimal
)
puts "Event03 =This is #{user01.first_name}'s #{event03.name} (event_id#{event03.id}), taking place on #{event03.start_at}, at #{event03.venue_name}"

task04 = Task.create!(
  event_id: event03.id
  name: "call mom"
  description: "cause mom's are awesome - call your mother"
  due_date: "aim for a time when you're not busy and can listen to her"
  status: "false" #default status - marked as done = false.
)
assign05 = Assignment.create!(
  collaboration_id: collab02.id
  task_id: task04.id
)
puts "Task '#{task04.name}' is assigned to #{user01.first_name} for doing on #{event03.name} by #{task04.due_date}"

task05 = Task.create!(
  event_id: event03.id
  name: "pay dj "
  description: "billingsly is in for his bucks, pay the man"
  due_date: "" #
  status: "false" #default status - marked as done = false.
)
assign06 = Assignment.create!(
  collaboration_id: collab02.id
  task_id: task05.id
)
task06 = Task.create!(
  event_id: event03.id
  name: "order pizza"
  description: "Riks said to order in advance to avoid long waits and too many drunk people ... lol "
  due_date: ""
  status: "false" #default status - marked as done = false.
)
assign07 = Assignment.create!(
  collaboration_id: collab02.id
  task_id: task06.id
)
task07 = Task.create!(
  event_id: event03.id
  name: "buy a new lumo shirt boet"
  description: "cause UV parties is zeff bru"
  due_date: ""
  status: "false" #default status - marked as done = false.
)
assign08 = Assignment.create!(
  collaboration_id: collab02.id
  task_id: task07.id
)

exp06 = Expense.create!(
  event_id: event03.id
  name: exp_cat_array.sample + "drink - welcome drinks" #use tagable not concat/interpolation
  amount_spent: 58.99 #decimal ? double precision? currency class?
)
exp07 = Expense.create!(
  event_id: event03.id
  name: exp_cat_array.sample + "venue - deposit" #use tagable not concat/interpolation
  amount_spent: 58.99 #decimal ? double precision? currency class?
)
exp08 = Expense.create!(
  event_id: event03.id
  name: exp_cat_array.sample + "entertainment,dj, - billingsly" #use tagable not concat/interpolation
  amount_spent: 58.99 #decimal ? double precision? currency class?
)

guest07 = Guest.create!(
event_id: event03.id
first_name: "Sandy"
last_name: "Hamburg"
email_address: "sandy@test.com"
phone_number: 123 456 7890
invite_status: false #default
rsvp_status: false #default => default false if invite status is also !=true
)
guest08 = Guest.create!(
  event_id: event03.id
  first_name: "Marcus"
  last_name: "Flutoni"
  email_address: "marcus@test.com"
  phone_number: 123 654 0890
  invite_status: false #default
  rsvp_status: false #default => default false if invite status is also !=true
)
guest09 = Guest.create!(
  event_id: event03.id
  first_name: "Eric"
  last_name: "Clayptone"
  email_address: "eric@test.com"
  phone_number: 123 456 7098
  invite_status: false #default
  rsvp_status: false #default => default false if invite status is also !=true
)
# metrics08 = sum events (if collabs event && user id ) # you know its getting late when: ""  how in the heck would you sum the events ? sum (collabs@events)?
# puts "COMBO A for users event dash 'home' show page: Current events planning: #{metrics08.total}
puts "-" * 20


# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# EVE - An event planner who plans multiple events at once.
# An Event (that belongs to Eve)
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
user11 = User.create!(
  first_name: "Eve",
  last_name: "Lorde",
  email: " eve@test.com",
  password: '123456',
)
puts "User11 = #{user11.first_name}, user id: #{user11.id}, user email: #{user11.email}"

collab12 = Collaboration.create!(
  user_id: user11.id
  event_id: event13.id
  role: "Head Planner"
)

event13 = Event.create!(
  name: "Zepadelle",
  description: "Safari themed wedding for the Zepelinni's",
  start_at: "Dont know how to add a date properly fri 17 March 2023 at 19:00" # add date
  end_at: "same: date and time" #date format
  venue_name: "Vineyard Hotel"
  venue_address: "Claremont, Cape Town",
  est_guests: 300 #int
  total_budget: 200000 #decimal
)
puts "Event13 =This is #{user11.first_name}'s #{event13.name} (event_id#{event13.id}), taking place on #{event13.start_at}, at #{event13.venue_name}"

task14 = Task.create!(
  event_id: event13.id
  name: "Pay Floraelle for the Reception Hall Flowers"
  description: "Pay Floraelle for the Reception Hall Flowers, update the budget"
  due_date:
  status: false
)

assign15 = Assignment.create!(
  collaboration_id: collab12.id
  task_id: task14.id
)

exp16 = Expense.create!(
  event_id: event13.id
  name: exp_cat_array.sample + "welcome drinks"
  amount_spent: 5800.99
)

guest17 = Guest.create!(
event_id: event13.id
first_name: "Harold"
last_name: "Murakiasetti"
email_address: "harold@test.com"
phone_number: 123 456 7890
invite_status: false
rsvp_status: false
)
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#eve seed - add event tasks. add event expenses.
#eve seed - add events. + collabs and assignments.

# event 13
task15 = Task.create!(
  event_id: event13.id
  name: "Call Rob for plumbus spares"
  description: "he still owes you a favour back"
  due_date:
  status: false
)
assign16 = Assignment.create!(
  collaboration_id: collab12.id # change this ?
  task_id: task15.id
)

task16 = Task.create!(
  event_id: event13.id
  name: "'Pay' 'Floraelle' - 'decor_flwr'"
  description: "Pay Floraelle for the Reception Hall Flowers, update the budget"
  due_date:
  status: false
)
assign17 = Assignment.create!(
  collaboration_id: collab12.id
  task_id: task16.id
)

task17 = Task.create!(
  event_id: event13.id
  name: "Book DJ BoogeyWoogey"
  description: "Madmoiselle said she liked BGweegys set the most - lets book her asap so we don't miss out - shes a hoot"
  due_date:
  status: false
)
assign18 = Assignment.create!(
  collaboration_id: collab12.id # change ?
  task_id: task17.id
)

exp17 = Expense.create!(
  event_id: event13.id
  name: exp_cat_array.sample + "welcome drinks"
  amount_spent: 1500
)
exp18 = Expense.create!(
  event_id: event13.id
  name: exp_cat_array.sample + "@Floraelle - 'decor_flwr'" # category and or tagable ? @suppliers ?
  amount_spent: 5876.55
)
exp19 = Expense.create!(
  event_id: event13.id
  name: exp_cat_array.sample + "DJ BJWG"
  amount_spent: 12000
)

guest18 = Guest.create!(
  event_id: event13.id
  first_name: "Humpty"
  last_name: "Dumpty"
  email_address: "humpty@test.com"
  phone_number: 123 456 7890
  invite_status: false
  rsvp_status: false
)

guest19 = Guest.create!(
  event_id: event13.id
  first_name: "Micky"
  last_name: "Mouse"
  email_address: "micky@test.com"
  phone_number: 123 456 7890
  invite_status: false
  rsvp_status: false
)
guest16 = Guest.create!(
  event_id: event13.id
  first_name: "Minnie"
  last_name: "Mouse"
  email_address: "minnie@test.com"
  phone_number: 123 456 7890
  invite_status: false
  rsvp_status: false
)


###################################################################################
# EVE - second event
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
# therefore Eve user11, collab22, event23, task24, assign25, exp26, guest27

# user11 = User.create!(
#   first_name: "Eve",
#   last_name: "Lorde",
#   email: " eve@test.com",
#   password: '123456',
# )
puts "User11 = #{user11.first_name}, user id: #{user11.id}, user email: #{user11.email}"
puts "#{user11.first_name}'s second event is: #{event.name} at #{event23.venue_name}"

collab22 = Collaboration.create!(
  user_id: user11.id #eve is still the event owner
  event_id: event23.id
  role: "Head Planner"
)

event23 = Event.create!(
  name: "Fox Wedding",
  description: "Mr and Mrs Fox are re-newing their vows and celebrating 10 years together with their besties",
  start_at: "Dont know how to add a date properly fri 17 March 2023 at 19:00" # add date
  end_at: "same: date and time" #date format
  venue_name: "Babylonstorenepia"
  venue_address: "Meadowridge, Cape Town",
  est_guests: 20 #int
  total_budget: 20000 #decimal
)
puts "Event24 =This is #{user11.first_name}'s #{event23.name} (event_id#{event23.id}), taking place on #{event23.start_at}, at #{event23.venue_name}"

task24 = Task.create!(
  event_id: event23.id
  name: "Pay Floraelle for the Reception Hall Flowers"
  description: "Pay Floraelle for the Reception Hall Flowers, update the budget"
  due_date:
  status: false
)

assign25 = Assignment.create!(
  collaboration_id: collab22.id
  task_id: task14.id
)

exp26 = Expense.create!(
  event_id: event23.id
  name: exp_cat_array.sample + "welcome drinks"
  amount_spent: 5800.99
)

guest27 = Guest.create!(
event_id: event23.id
first_name: "Harold"
last_name: "Murakiasetti"
email_address: "harold@test.com"
phone_number: 123 456 7890
invite_status: false
rsvp_status: false
)
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#eve seed - add event tasks. add event expenses.
#eve seed - add events. + collabs and assignments.


task25 = Task.create!(
  event_id: event23.id
  name: "book cake lady"
  description: "she takes forever"
  due_date:
  status: false
)
assign26 = Assignment.create!(
  collaboration_id: collab22.id # change this ?
  task_id: task25.id
)

task26 = Task.create!(
  event_id: event23.id
  name: "'Pay' 'Rietta' - 'decor_flwr'"
  description: "Pay Rieatta for the church Flowers, update the budget"
  due_date:
  status: false
)
assign27 = Assignment.create!(
  collaboration_id: collab22.id
  task_id: task26.id
)

task27 = Task.create!(
  event_id: event23.id
  name: "Book Band ChampanJey"
  description: "honourable guest said she liked the energy of the team, fits her mood"
  due_date:
  status: false
)
assign28 = Assignment.create!(
  collaboration_id: collab22.id # change ?
  task_id: task27.id
)

exp27 = Expense.create!(
  event_id: event23.id
  name: exp_cat_array.sample + "welcome drinks"
  amount_spent: 1500
)
exp28 = Expense.create!(
  event_id: event23.id
  name: exp_cat_array.sample + "@Rietta - 'decor_flwr'" # category and or tagable ? @suppliers ?
  amount_spent: 5876.55
)
exp29 = Expense.create!(
  event_id: event23.id
  name: exp_cat_array.sample + "band ChampanJey"
  amount_spent: 12000
)

guest28 = Guest.create!(
  event_id: event23.id
  first_name: "Hillary"
  last_name: "Clint"
  email_address: "hillary@test.com"
  phone_number: 123 456 7890
  invite_status: false
  rsvp_status: false
)

guest29 = Guest.create!(
  event_id: event23.id
  first_name: "Daffy"
  last_name: "Ducket"
  email_address: "daffy@test.com"
  phone_number: 123 456 7890
  invite_status: false
  rsvp_status: false
)
guest26 = Guest.create!(
  event_id: event23.id
  first_name: "Auzo"
  last_name: "Floot"
  email_address: "Auzo@test.com"
  phone_number: 123 456 7890
  invite_status: false
  rsvp_status: false
)
