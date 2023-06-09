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
invitations = ["invite_not_sent", "invited", "accepted", "declined"]
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
file = File.open(File.join(__dir__, 'img/avatar_adam.png'))
user01.photo.attach(io: file, filename: 'avatar_adam.png', content_type: 'image/png')

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
  amount_spent: 58.99,
  category_list: "Bar",
  status: 0,
  due_date: DateTime.new(2023, 4, 1)
)
exp07 = Expense.create!(
  event_id: event03.id,
  name: "venue - deposit",
  amount_spent: 58.99,
  category_list: "Venue",
  status: 0,
  due_date: DateTime.new(2023, 4, 1)

)
exp08 = Expense.create!(
  event_id: event03.id,
  name: "entertainment,dj, - billingsly", #use tagable not concat/interpolation
  amount_spent: 58.99, #decimal ? double precision? currency class?
  category_list: "Entertainment",
  status: 0,
  due_date: DateTime.new(2023, 4, 1)
)

guest05 = Guest.create!(
  event_id: event03.id,
  first_name: "Sarah",
  last_name: "McGraw",
  email_address: "eric@test.com",
  phone_number: "1234567098",
  invitation_status: :invite_not_sent
)
guest06 = Guest.create!(
  event_id: event03.id,
  first_name: "Eric",
  last_name: "Clayptone",
  email_address: "eric@test.com",
  phone_number: "1234567098",
  invitation_status: :invited
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

puts "user01 = #{user01.first_name}, user id: #{user01.id}, user email: #{user01.email}"
puts "Event03 =This is #{user01.first_name}'s '#{event03.name} ' (with event_id#{event03.id}), taking place on #{event03.start_date}, at #{event03.venue_name}"
puts "Task '#{task04.name}' is assigned to #{user01.first_name} for doing on #{event03.name} by #{task04.due_date}"
puts "-" * 20
puts "************************--------************************"

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# EVE - An event planner who plans multiple events at once.
# An Event (that belongs to Eve)
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
user11 = User.create!(
  first_name: "Eve",
  last_name: "Lorde",
  email: " eve@test.com",
  password: '123456'
)

event13 = Event.create!(
  name: "Ops Strategy Workshop",
  description: "Workshop for Gooi Operationss Strategy 'Q3-2023 and beyond",
  start_date: DateTime.new(2023, 3, 27, 13, 0, 0),
  end_date: DateTime.new(2023, 3, 27, 18, 0, 0),
  venue_name: "Vineyard Hotel",
  venue_address: "Claremont, Cape Town",
  est_guests: 12, #int
  total_budget: 8500,
  pinterest_board: "https://za.pinterest.com/classbento/team-building-activities/"
)
file = File.open(File.join(__dir__, 'img/avatar_eve.png'))
user11.photo.attach(io: file, filename: 'avatar_eve.png', content_type: 'image/png')
collab12 = Collaboration.create!(
  user_id: user11.id,
  event_id: event13.id,
  role: :owner
)

task15 = Task.create!(
  event_id: event13.id,
  name: "Call Rik for plumbus",
  description: "he still owes you a favour back for the spares",
  due_date: DateTime.new(2023, 3, 27, 10, 30, 0),
  status: :to_do
)
assign16 = Assignment.create!(
  collaboration_id: collab12.id,
  task_id: task15.id
)

task16 = Task.create!(
  event_id: event13.id,
  name: "Book Chef Sara",
  description: "Alma for canapes is the bombD! Make sure its salty enough. NO FISH! ***Allergy warning!",
  due_date: DateTime.new(2023, 3, 24, 13, 0, 0),
  status: :doing
)
assign17 = Assignment.create!(
  collaboration_id: collab12.id,
  task_id: task16.id
)

task17 = Task.create!(
  event_id: event13.id,
  name: "Book DJ BoogeyWoogey",
  description: "BGweegys set and teaching style is the most fun. Perfect post workshop activity for this team",
  due_date: DateTime.new(2023, 3, 24, 15, 0, 0),
  status: :to_do
)
assign18 = Assignment.create!(
  collaboration_id: collab12.id,
  task_id: task17.id
)

exp16 = Expense.create!(
  event_id: event13.id,
  name: "Welcome drinks",
  amount_spent: 650,
  category_list: "Bar",
  status: 0,
  due_date: DateTime.new(2023, 3, 26, 8, 0, 0)
)
exp17 = Expense.create!(
  event_id: event13.id,
  name: "Alma - late lunch for team",
  amount_spent: 1750,
  category_list: "Catering",
  status: 0,
  due_date: DateTime.new(2023, 3, 24, 8, 0, 0)
)
exp19 = Expense.create!(
  event_id: event13.id,
  name: "DJ BJWG",
  amount_spent: 3000,
  category_list: "Entertainment",
  status: 1,
  due_date: DateTime.new(2023, 3, 22, 8, 0, 0)
)
exp199 = Expense.create!(
  event_id: event13.id,
  name: "Plumbus",
  amount_spent: 750,
  category_list: "Services",
  status: 1,
  due_date: DateTime.new(2023, 3, 20, 8, 0, 0)
)

# guest16 = Guest.create!(
#   event_id: event13.id,
#   first_name: "Minnie",
#   last_name: "Mouse",
#   email_address: "minnie@test.com",
#   phone_number: "1234567890",
#   invitation_status: :invited
# )
# guest18 = Guest.create!(
#   event_id: event13.id,
#   first_name: "Humpty",
#   last_name: "Dumpty",
#   email_address: "humpty@test.com",
#   phone_number: "1234567890",
#   invitation_status: :accepted
# )
# guest19 = Guest.create!(
#   event_id: event13.id,
#   first_name: "Micky",
#   last_name: "Mouse",
#   email_address: "micky@test.com",
#   phone_number: "1234567890",
#   invitation_status: :invited
# )


puts "************************--------************************"
puts "user11 = #{user11.first_name}, user id: #{user11.id}, user email: #{user11.email}"
puts "Event13 = This is #{user11.first_name}'s #{event13.name} (event_id#{event13.id}), taking place on #{event13.start_date}, at #{event13.venue_name}"
file = File.open(File.join(__dir__, 'img/workshop3.png'))
event13.photo.attach(io: file, filename: 'workshop3.png', content_type: 'image/png')
puts "************************--------************************"
puts "generating guestlist - Workshop"
12.times do
first_name = Faker::Name.first_name
last_name = Faker::Name.last_name
guest = Guest.create!(
  event_id: event13.id,
  first_name: first_name,
  last_name: last_name,
  email_address: Faker::Internet.email(name: first_name, domain: last_name),
  phone_number: Faker::PhoneNumber.cell_phone,
  # invitation_status: :invited,
  invitation_status: invitations.sample
)
puts "Event_id,#{event13.id}, Guest name: #{guest[:first_name]},#{guest[:last_name]}, guest id: #{guest.id}, email: #{guest.email_address}, phone: #{guest.phone_number}, invitation_status: #{guest[:invitation_status]}."
end
###################################################################################
# EVE - second event
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
# therefore Eve user11, collab22, event23, task24, assign25, exp26, guest27


event23 = Event.create!(
  name: "Fox Wedding",
  description: "Mr and Mrs Fox are re-newing their vows and celebrating 10 years together with their besties",
  start_date: DateTime.new(2023, 4, 10, 19, 0, 0),# add date
  end_date: DateTime.new(2023, 4, 10, 23, 0, 0), #date format
  venue_name: "Baylonstorenepia",
  venue_address: "Meadowridge, Cape Town",
  est_guests: 20, #int
  total_budget: 20000, #decimal
  pinterest_board: "https://za.pinterest.com/jennifergifforddesigns/small-backyard-wedding/"
)
collab22 = Collaboration.create!(
  user_id: user11.id,#eve is still the event owner
  event_id: event23.id,
  role: :owner
)


task25 = Task.create!(
  event_id: event23.id,
  name: "book cake lady",
  description: "she takes forever",
  due_date: DateTime.new(2023, 3, 29, 12, 0, 0),
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
  due_date: DateTime.new(2023, 3, 27, 14, 0, 0),
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
  due_date: DateTime.new(2023, 3, 20, 15, 30, 0),
  status: :to_do
)
assign28 = Assignment.create!(
  collaboration_id: collab22.id,
  task_id: task27.id
)

exp26 = Expense.create!(
  event_id: event23.id,
  name: "sunset drinks",
  amount_spent: 5800.99,
  category_list: "Bar",
  status: 0,
  due_date: DateTime.new(2023, 3, 28)
)

exp27 = Expense.create!(
  event_id: event23.id,
  name: "after-dinner apéritif",
  amount_spent: 1800,
  category_list: "Bar",
  status: 0,
  due_date: DateTime.new(2023, 3, 29)
)
exp28 = Expense.create!(
  event_id: event23.id,
  name: "Riettas Flowers",
  amount_spent: 5876.55,
  category_list: "Decor",
  status: 1,
  due_date: DateTime.new(2023, 3, 20)
)
exp29 = Expense.create!(
  event_id: event23.id,
  name: "band ChampaJeyn",
  amount_spent: 1200,
  category_list: "Entertainment",
  status: 0,
  due_date: DateTime.new(2023, 3, 30)
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


puts "user11 = #{user11.first_name}, user id: #{user11.id}, user email: #{user11.email}"
puts "This is #{user11.first_name}'s '#{event23.name}' (event_id#{event23.id}), taking place on #{event23.start_date}, at #{event23.venue_name}"
file = File.open(File.join(__dir__, 'img/fox-wedding.png'))
event23.photo.attach(io: file, filename: 'fox-wedding.png', content_type: 'image/png')
puts "************************--------************************"
##################################################################################
# EVE - third event
# 01 - user, 02 - collab, 03 - event, 04 - task, 05 - assignment, 06 - expense, 07 - guest.
# therefore Eve user031, collab32, event33, task34, assign35, exp36, guest37


event33 = Event.create!(
  name: "James Wedding",
  description: "Bonnie and Clyde are having a small COWBOY themed home wedding that oozes class",
  start_date: DateTime.new(2023, 4, 1, 14, 0, 0),# add date
  end_date: DateTime.new(2023, 4, 2, 0, 0, 0), #date format
  venue_name: "Constantia Estate",
  venue_address: "Constantia, Cape Town",
  est_guests: 50, #int
  total_budget: 90000, #decimal
  pinterest_board: "https://za.pinterest.com/kikickennedy/wedding-inspo/"
)
collab32 = Collaboration.create!(
  user_id: user11.id,#eve is still the event owner
  event_id: event33.id,
  role: :owner
)

task33 = Task.create!(
  event_id: event33.id,
  name: "Call Rik for Plumbus",
  description: "He still owes you a favour back for the spares",
  due_date: DateTime.new(2023, 3, 28, 10, 30, 0),
  status: :to_do
)
assign1 = Assignment.create!(
  collaboration_id: collab32.id,
  task_id: task33.id
)

task34 = Task.create!(
  event_id: event33.id,
  name: "Pay Violet - Flowers",
  description: "Pay violet for flowers and update budget",
  due_date: DateTime.new(2023, 3, 29, 16, 0, 0),
  status: :to_do
)
assign35 = Assignment.create!(
  collaboration_id: collab32.id,
  task_id: task34.id
)

task35 = Task.create!(
  event_id: event33.id,
  name: "book entertainment",
  description: "dj and fire dancers",
  due_date: DateTime.new(2023, 4, 6, 12, 0, 0),
  status: :to_do
)
assign36 = Assignment.create!(
  collaboration_id: collab32.id, # change this ?
  task_id: task35.id
)

task36 = Task.create!(
  event_id: event33.id,
  name: "bill for crockery",
  description: "we discussed a budget update and they approved - please incl in update",
  due_date: DateTime.new(2023, 3, 27, 14, 0, 0),
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
  due_date: DateTime.new(2023, 4, 5, 15, 30, 0),
  status: :to_do
)
assign38 = Assignment.create!(
  collaboration_id: collab32.id,
  task_id: task37.id
)

task38 = Task.create!(
  event_id: event33.id,
  name: "Find cowboy boots",
  description: "Mr James is going all out - he wants genuine leather cowboy boots for his boys",
  due_date: DateTime.new(2023, 3, 23, 15, 30, 0),
  status: :doing
)
assign389 = Assignment.create!(
  collaboration_id: collab32.id,
  task_id: task38.id
)


exp26 = Expense.create!(
  event_id: event33.id,
  name: "sunset drinks",
  amount_spent: 5800.99,
  category_list: "Bar",
  status: 0,
  due_date: DateTime.new(2023, 3, 28, 15, 30, 0)
)

exp27 = Expense.create!(
  event_id: event33.id,
  name: "after-dinner apéritif",
  amount_spent: 1800,
  category_list: "Bar",
  status: 0,
  due_date: DateTime.new(2023, 3, 29, 15, 30, 0)
)

exp28 = Expense.create!(
  event_id: event33.id,
  name: "Riettas Flowers",
  amount_spent: 5876.55,
  category_list: "Decor",
  status: 1,
  due_date: DateTime.new(2023, 3, 20, 8, 0, 0)
)

exp299 = Expense.create!(
  event_id: event33.id,
  name: "Jays Security",
  amount_spent: 5890,
  category_list: "Services",
  status: 0,
  due_date: DateTime.new(2023, 3, 30, 14, 30, 0)
)

exp288 = Expense.create!(
  event_id: event33.id,
  name: "Venue Deposit",
  amount_spent: 18000,
  category_list: "Venue",
  status: 0,
  due_date: DateTime.new(2023, 3, 31, 15, 30, 0)
)

exp366 = Expense.create!(
  event_id: event33.id,
  name: "Mobile bar drinks",
  amount_spent: 9800.50,
  category_list: "Bar",
  status: 0,
  due_date: DateTime.new(2023, 3, 29, 15, 30, 0)
)

exp376 = Expense.create!(
  event_id: event33.id,
  name: "Plumbus",
  amount_spent: 2700,
  category_list: "Services",
  status: 0,
  due_date: DateTime.new(2023, 3, 23, 12, 0, 0)
)

exp378 = Expense.create!(
  event_id: event33.id,
  name: "lemon basil sorbet",
  amount_spent: 2700,
  category_list: "Catering",
  status: 0,
  due_date: DateTime.new(2023, 3, 27, 12, 0, 0)
)



# guest37 = Guest.create!(
  #   event_id: event33.id,
  #   first_name: "Barry",
  #   last_name: "Kleon",
  #   email_address: "barry@test.com",
  #   phone_number: "1234567890",
  #   invitation_status: :invited
  # )
  # guest38 = Guest.create!(
#   event_id: event33.id,
#   first_name: "Deidre",
#   last_name: "Kleon",
#   email_address: "deidre@test.com",
#   phone_number: "1234567890",
#   invitation_status: :accepted
# )
# guest35 = Guest.create!(
  #   event_id: event33.id,
  #   first_name: "Leah",
  #   last_name: "Ndahm",
  #   email_address: "leah@test.com",
  #   phone_number: "1234567890",
  #   invitation_status: :accepted
  # )

  puts "************************--------************************"
  puts "user11 = #{user11.first_name}, user id: #{user11.id}, user email: #{user11.email}"
  puts "This is #{user11.first_name}'s '#{event33.name}' (event_id#{event33.id}), taking place on #{event33.start_date}, at #{event33.venue_name}"
  file = File.open(File.join(__dir__, 'img/James-wedding.png'))
  event33.photo.attach(io: file, filename: 'James-wedding.png', content_type: 'image/png')
  puts "************************--------************************"
  puts "generating guestlist - James wedding"
  50.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  guest = Guest.create!(
    event_id: event33.id,
    first_name: first_name,
    last_name: last_name,
    email_address: Faker::Internet.email(name: first_name, domain: last_name),
    phone_number: Faker::PhoneNumber.cell_phone,
    # invitation_status: :invited,
    invitation_status: invitations.sample
  )
  puts "Event_id,#{event33.id}, Guest name: #{guest[:first_name]},#{guest[:last_name]}, guest id: #{guest.id}, email: #{guest.email_address}, phone: #{guest.phone_number}, invitation_status: #{guest[:invitation_status]}."
  end

###########################################################################################################################
# more users:
user02 = User.create!(
  first_name: "Kate",
  last_name: "Alum",
  email: "kate@test.com",
  password: '123456'
)
file = File.open(File.join(__dir__, 'img/lady1.png'))
user02.photo.attach(io: file, filename: 'lady1.png', content_type: 'image/png')


# shell events
# venues = ["Rooftop Buiten", "Rusticana", "Welgemeend", "Mountain Manor Guest House", "LukKron", "The Argyle", "The Lookout", "Vineyard Hotel"]
# addresses = ["Gardens, Cape Town", "Rondebosch, Cape Town", "Constantia, Cape Town", "Greenpoint, Cape Town", "Salt River, Cape Town", "Vredehoek, Cape Town", "Meadowridge, Cape Town"]
# expense_categories = ["Food", "Drink", "Entertainment", "Decor", "Venue", "Services"]


event43 = Event.create!(
  name: "Escargot: Granny's Birthday",
  description: "A golden Birthday Party for our golden Granny",
  start_date: DateTime.new(2023, 4, 7, 16, 0, 0), # add date
  end_date: DateTime.new(2023, 4, 7, 20, 0, 0), #date format
  venue_name: "Welgemeend",
  venue_address: "Greenpoint, Cape Town",
  est_guests: 30, #int
  total_budget: 20000
)
file = File.open(File.join(__dir__, 'img/birthday1.png'))
event43.photo.attach(io: file, filename: 'birthday1.png', content_type: 'image/png')
collab42 = Collaboration.create!(
  user_id: user11.id,
  event_id: event43.id,
  role: :owner
)

task46 = Task.create!(
  event_id: event43.id,
  name: "Order Cake",
  description: "Please book cake lady before she runs out of chocolate",
  due_date: DateTime.new(2023, 3, 24, 14, 0, 0),
  status: :doing
)
assign47 = Assignment.create!(
  collaboration_id: collab42.id,
  task_id: task46.id
)

task47 = Task.create!(
  event_id: event43.id,
  name: "Chill Champagne",
  description: "....nobody likes warm bubbles",
  due_date: DateTime.new(2023, 4, 7, 8, 0, 0),
  status: :doing
)
assign48 = Assignment.create!(
  collaboration_id: collab42.id,
  task_id: task47.id
)

puts "************************--------************************"
puts "generating guestlist - birthday"
30.times do
first_name = Faker::Name.first_name
last_name = Faker::Name.last_name
guest = Guest.create!(
  event_id: event43.id,
  first_name: first_name,
  last_name: last_name,
  email_address: Faker::Internet.email(name: first_name, domain: last_name),
  phone_number: Faker::PhoneNumber.cell_phone,
  # invitation_status: :invited,
  invitation_status: invitations.sample
)
puts "Event_id,#{event43.id}, Guest name: #{guest[:first_name]},#{guest[:last_name]}, guest id: #{guest.id}, email: #{guest.email_address}, phone: #{guest.phone_number}, invitation_status: #{guest[:invitation_status]}."
end

####################

event53 = Event.create!(
  name: "Conroy Wedding",
  description: "Farm Wedding",
  start_date: DateTime.new(2023, 4, 15, 16, 0, 0), # add date
  end_date: DateTime.new(2023, 3, 16, 2, 0, 0), #date format
  venue_name: "Conroy Farm",
  venue_address: "Salt River, Cape Town",
  est_guests: 35, #int
  total_budget: 50000
)
file = File.open(File.join(__dir__, 'img/farm_wedding.png'))
event53.photo.attach(io: file, filename: 'farm_wedding.png', content_type: 'image/png')
collab52 = Collaboration.create!(
  user_id: user11.id,
  event_id: event53.id,
  role: :owner
)

#####################

event63 = Event.create!(
  name: "Fox Bachelor Party",
  description: "Includes dads, no paintball please",
  start_date: DateTime.new(2023, 4, 23, 13, 0, 0), # add date
  end_date: DateTime.new(2023, 4, 24, 19, 0, 0), #date format
  venue_name: "LukKron",
  venue_address: "Rondebosch, Cape Town",
  est_guests: 15, #int
  total_budget: 20000
)
file = File.open(File.join(__dir__, 'img/fox_bachelors.png'))
event63.photo.attach(io: file, filename: 'fox_bachelors.png', content_type: 'image/png')
collab62 = Collaboration.create!(
  user_id: user11.id,
  event_id: event63.id,
  role: :owner
)


event53 = Event.create!(
  name: "Graduation - Le Wagon #1177",
  description: "A celebration of the greatness that was this batch",
  start_date: DateTime.new(2023, 3, 24, 17, 0, 0), # add date
  end_date: DateTime.new(2023, 3, 24, 20, 0, 0), #date format
  venue_name: "R&Y Rooftop",
  venue_address: "Salt River, Cape Town",
  est_guests: 80, #int
  total_budget: 10000
)
file = File.open(File.join(__dir__, 'img/grad_lewag.png'))
event53.photo.attach(io: file, filename: 'grad_lewag.png', content_type: 'image/png')
collab53 = Collaboration.create!(
  user_id: user11.id,
  event_id: event53.id,
  role: :owner
)
