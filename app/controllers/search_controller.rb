class SearchController < ApplicationController

  def home
  end

  def result
    @search_term = params["search_term"]
    @main_selection = get_main_selection_for(@search_term)
    @sub_selection = get_sub_selection_for(@search_term)
  end

  def details
    @word = params['word']
    @main_selection = get_entry_for(@word)
    @sub_selection = get_sub_selection_for(@word)
  end

  private

  def get_entry_for(search_term)
    japanese_selection = MainEntry.all.where("japanese LIKE :search", search: search_term)
    return japanese_selection
  end

  def get_main_selection_for(search_term)
    japanese_selection = MainEntry.all.where("japanese LIKE :search", search: search_term)
    english_selection = MainEntry.all.where("lower(english) LIKE :search", search: search_term.downcase)
    return english_selection + japanese_selection
  end

  def get_sub_selection_for(search_term)
    sub_selection = []
    search_term.each_char do |character|
      sub_selection += SubEntry.all.where("japanese LIKE :search", search: character)
    end
    return sub_selection
  end

end
