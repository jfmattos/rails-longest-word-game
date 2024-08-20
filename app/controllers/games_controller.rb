class GamesController < ApplicationController

  def new
    letters = []
    vowel = ["a", "e", "i", "o", "u"]
    letters << vowel.sample(2)
    letters << ('a'..'z').to_a.sample(8)
    @letters = letters.flatten
  end

  def score
    @params = params[:word]
    serialized_response = URI.open("https://dictionary.lewagon.com/#{@params}").read
    parsed_json = JSON.parse(serialized_response)
    if parsed_json["found"] == true
      puts("word is valid")

    else
      { score: 0,
        message: "not an english word" }
    end
  end

end




# def run_game(attempt, grid, start_time, end_time)
#   # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
#   # check if attempt is a valid word
#   # check if it contains the letters from the grid
#   # if it's true we need to calculate the score by the time and word size
#   # if it's false the score is zero and we print a message to the user
#   # (1..4).all? {|element| element < 5 }
#   serialized_response = URI.open("https://dictionary.lewagon.com/#{attempt}").read
#   parsed_json = JSON.parse(serialized_response)
#   if parsed_json["found"] == true
#     attempt_validation(attempt, grid, start_time, end_time)
#   else
#     { score: 0,
#       message: "not an english word" }
#   end
# end

# def attempt_validation(attempt, grid, start_time, end_time)
#   # attempt.count == mesma quantidade da mesma letra no grid
#   valid = attempt.upcase.chars.all? { |letter| attempt.upcase.count(letter) <= grid.count(letter) }
#   if valid
#     # calculate score and return hash
#     score = attempt.chars.size * (1 / (end_time - start_time))
#     { score: score,
#       message: "well done",
#       time: end_time - start_time }
#   else
#     { score: 0,
#       message: "not in the grid" }
#   end
# end
