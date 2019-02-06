Bet.destroy_all
Ticket.delete_all
User.destroy_all
Odd.destroy_all
Game.destroy_all

def name_to_img(name)
  name.split(' ').join('_')
end

def find_correct_odds(array)
  foundOdds = array.find {|odd| odd['OddType'] == "Game"}
  foundOdds
end


nhl_request = RestClient.get 'https://jsonodds.com/api/odds/nhl', {'x-api-key': ENV['API_KEY']}
nhl_response = JSON.parse(nhl_request)
nhl_response.each do |game|
  created_game = Game.create(
    sport: 'NHL',
    date: game['MatchTime'],
    home_team: game['HomeTeam'],
    home_logo: "https://s3.us-east-2.amazonaws.com/betski-images/#{name_to_img(game['HomeTeam'])}.png",
    away_team: game['AwayTeam'],
    away_logo: "https://s3.us-east-2.amazonaws.com/betski-images/#{name_to_img(game['AwayTeam'])}.png",
    spread: find_correct_odds(game["Odds"])['PointSpreadHome'],
    over_under: find_correct_odds(game["Odds"])['TotalNumber'],
    home_score: 0,
    away_score: 0
  )
  Odd.create(
    game_id: created_game.id,
    line: "spread",
    home_under: find_correct_odds(game["Odds"])['PointSpreadHomeLine'],
    away_over: find_correct_odds(game["Odds"])['PointSpreadAwayLine']
  )
  Odd.create(
    game_id: created_game.id,
    line: "over_under",
    home_under: find_correct_odds(game["Odds"])['UnderLine'],
    away_over: find_correct_odds(game["Odds"])['OverLine']
  )
  Odd.create(
    game_id: created_game.id,
    line: "moneyline",
    home_under: find_correct_odds(game["Odds"])['MoneyLineHome'],
    away_over: find_correct_odds(game["Odds"])['MoneyLineAway']
  )
end

nba_request = RestClient.get 'https://jsonodds.com/api/odds/nba', {'x-api-key': ENV['API_KEY']}
nba_response = JSON.parse(nba_request)
nba_response.each do |game|
  created_game = Game.create(
    sport: 'NBA',
    date: game['MatchTime'],
    home_team: game['HomeTeam'],
    home_logo: "https://s3.us-east-2.amazonaws.com/betski-images/#{name_to_img(game['HomeTeam'])}.png",
    away_team: game['AwayTeam'],
    away_logo: "https://s3.us-east-2.amazonaws.com/betski-images/#{name_to_img(game['AwayTeam'])}.png",
    spread: find_correct_odds(game["Odds"])['PointSpreadHome'],
    over_under: find_correct_odds(game["Odds"])['TotalNumber'],
    home_score: 0,
    away_score: 0
  )
  Odd.create(
    game_id: created_game.id,
    line: "spread",
    home_under: find_correct_odds(game["Odds"])['PointSpreadHomeLine'],
    away_over: find_correct_odds(game["Odds"])['PointSpreadAwayLine']
  )
  Odd.create(
    game_id: created_game.id,
    line: "over_under",
    home_under: find_correct_odds(game["Odds"])['UnderLine'],
    away_over: find_correct_odds(game["Odds"])['OverLine']
  )
  Odd.create(
    game_id: created_game.id,
    line: "moneyline",
    home_under: find_correct_odds(game["Odds"])['MoneyLineHome'],
    away_over: find_correct_odds(game["Odds"])['MoneyLineAway']
  )
end

ncaab_request = RestClient.get 'https://jsonodds.com/api/odds/ncaab', {'x-api-key': ENV['API_KEY']}
ncaab_response = JSON.parse(ncaab_request)
ncaab_response.each do |game|
  created_game = Game.create(
    sport: 'NCAAB',
    date: game['MatchTime'],
    home_team: game['HomeTeam'],
    home_logo: "https://s3.us-east-2.amazonaws.com/betski-images/ncaa.png",
    away_team: game['AwayTeam'],
    away_logo: "https://s3.us-east-2.amazonaws.com/betski-images/ncaa.png",
    spread: find_correct_odds(game["Odds"])['PointSpreadHome'],
    over_under: find_correct_odds(game["Odds"])['TotalNumber'],
    home_score: 0,
    away_score: 0
  )
  Odd.create(
    game_id: created_game.id,
    line: "spread",
    home_under: find_correct_odds(game["Odds"])['PointSpreadHomeLine'],
    away_over: find_correct_odds(game["Odds"])['PointSpreadAwayLine']
  )
  Odd.create(
    game_id: created_game.id,
    line: "over_under",
    home_under: find_correct_odds(game["Odds"])['UnderLine'],
    away_over: find_correct_odds(game["Odds"])['OverLine']
  )
  Odd.create(
    game_id: created_game.id,
    line: "moneyline",
    home_under: find_correct_odds(game["Odds"])['MoneyLineHome'],
    away_over: find_correct_odds(game["Odds"])['MoneyLineAway']
  )
end
