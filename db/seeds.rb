# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



g1 = Game.create(home_team: "BOS", away_team: "NYK", spread: -8.5, over_under: 220.5, date: "something")

o1 = Odd.create(game_id: g1.id, line: "moneyline", home_under: -150, away_over: 200)
o2 = Odd.create(game_id: g1.id, line: "over-under", home_under: -110, away_over: 105)
o3 = Odd.create(game_id: g1.id, line: "spread", home_under: -115, away_over: 110)

t1 = Ticket.create(wager: 0, payout: 0)

b1 = Bet.create(game_id: g1.id, ticket_id: t1.id, multiplier: 0)
#
# if g1.odds.whatever is positive
#   multiplier = g1.odds.whatever + 100 / 100
# if g1.odds.whatever is negative
#   multiplier = g1.odds.whatever + 100 / g1.odds.whatever
