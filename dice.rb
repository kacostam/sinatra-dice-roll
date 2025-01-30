# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# better error visualization -- need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

# create root path
get ('/') do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "hopefully this shows up without needing to restart the server 🤞🏾"
end


# create a page to throw dice for you

# 2 6-sided dice
get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_six)
end


# 2 10-sided dice
get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  @outcome = "You got a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten)

end

# 1 20-sided die
get("/dice/1/20") do
  die = rand(1..20)
  @outcome = "You got a #{die}."

    erb(:one_twenty)
end

# 5 4-sided dice
get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
  @outcome = "You got a #{first_die}, #{second_die}, #{third_die}, #{fourth_die} and a #{fifth_die}, for a total of #{sum}."

  erb(:five_four)
end

# 3 7-sided dice
get("/dice/3/7") do
  first_die = rand(1..7)
  second_die = rand(1..7) 
  third_die = rand(1..7)
  sum = first_die + second_die + third_die
  @outcome = "You got a #{first_die}, #{second_die} and a #{third_die} for a total of #{sum}."

  erb(:three_seven)
end
