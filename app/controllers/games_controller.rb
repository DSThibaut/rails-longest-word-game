require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @letters = params[:game_letters]
    @word = params[:word]
    if letters_grid(@word)
      if word_api(@word)
        @response = 'good answer'
      else
        @response = 'it is not an english word'
      end
    else
      @response = 'not in the array'
    end
  end

  private

    def letters_grid(word)
      word.chars.all? { |letter| @letters.include?(letter) }
    end

    def word_api(word)
      url = "https://wagon-dictionary.herokuapp.com/#{word}"
      word = JSON.parse(url)
      word [found]
    end
end
