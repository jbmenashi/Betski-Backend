# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_04_161744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "ticket_id"
    t.float "multiplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "team"
    t.float "line"
    t.integer "odds"
    t.string "variety"
    t.string "away"
    t.string "home"
    t.index ["game_id"], name: "index_bets_on_game_id"
    t.index ["ticket_id"], name: "index_bets_on_ticket_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "home_team"
    t.string "away_team"
    t.float "spread"
    t.float "over_under"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "home_score"
    t.integer "away_score"
    t.string "home_logo"
    t.string "away_logo"
    t.string "sport"
  end

  create_table "odds", force: :cascade do |t|
    t.bigint "game_id"
    t.string "line"
    t.integer "home_under"
    t.integer "away_over"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_odds_on_game_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "wager"
    t.float "payout"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "submitted"
    t.boolean "closed"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bets", "games"
  add_foreign_key "bets", "tickets"
  add_foreign_key "odds", "games"
  add_foreign_key "tickets", "users"
end
