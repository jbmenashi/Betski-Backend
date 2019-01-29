# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bet.destroy_all
Ticket.destroy_all
User.destroy_all
Odd.destroy_all
Game.destroy_all


u1 = User.create(username: "user1", balance: 100)

g1 = Game.create(
  sport: "NHL",
  date: DateTime.new(2019, 01, 31, 19, 00),
  home_team: "Boston Bruins",
  home_logo: './logos/nhl/Boston_Bruins',
  away_team: "New York Islanders",
  away_logo: './logos/nhl/New_York_Islanders',
  spread: -0.5,
  over_under: 6.5,
  home_score: 0,
  away_score: 0
)

g2 = Game.create(
  sport: "NHL",
  date: DateTime.new(2019, 01, 31, 20, 30),
  home_team: "Calgary Flames",
  home_logo: './logos/nhl/Calgary_Flames',
  away_team: "Vancouver Canucks",
  away_logo: './logos/nhl/Vancouver_Canucks',
  spread: 1,
  over_under: 6,
  home_score: 0,
  away_score: 0
)

o1 = Odd.create(game_id: g1.id, line: "moneyline", home_under: -150, away_over: 215)
o2 = Odd.create(game_id: g1.id, line: "over-under", home_under: -110, away_over: 105)
o3 = Odd.create(game_id: g2.id, line: "spread", home_under: -115, away_over: 110)

t1 = Ticket.create(user_id: u1.id, wager: 0, payout: 0)
t2 = Ticket.create(user_id: u1.id, wager: 0, payout: 0)

b1 = Bet.create(game_id: g1.id, ticket_id: t1.id, multiplier: (g1.odds.first.away_over + 100).to_f / 100.to_f)
b2 = Bet.create(game_id: g1.id, ticket_id: t2.id, multiplier: (g1.odds.second.home_under.abs + 100).to_f / g1.odds.second.home_under.abs.to_f)
b3 = Bet.create(game_id: g2.id, ticket_id: t2.id, multiplier: (g2.odds.first.away_over + 100).to_f / 100.to_f)

puts b1.multiplier
puts b2.multiplier
puts b3.multiplier
puts b2.multiplier * b3.multiplier
# if g1.odds.whatever is positive
#   multiplier = g1.odds.whatever + 100 / 100
# if g1.odds.whatever is negative
#   multiplier = g1.odds.whatever + 100 / g1.odds.whatever
(Game.all.first.odds.second.home_under.abs + 100).to_f / Game.all.first.odds.second.home_under.abs.to_f
