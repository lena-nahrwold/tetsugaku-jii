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
    main_file = File.open("data/haupteintraege.json")
    main_entries = JSON.load(main_file)
    english_selection = main_entries.select do |entry|
      entry["englisch"].downcase == search_term.downcase
    end
    japanese_selection = main_entries.select do |entry|
      entry["japanisch"].downcase == search_term.downcase
    end
    return english_selection + japanese_selection
  end
  
  def get_main_selection_for(search_term)
    main_file = File.open("data/haupteintraege.json")
    main_entries = JSON.load(main_file)
    english_selection = main_entries.select do |entry|
      entry["englisch"].downcase.include?(search_term.downcase)
    end
    japanese_selection = main_entries.select do |entry|
      entry["japanisch"].downcase.include?(search_term.downcase)
    end
    return english_selection + japanese_selection
  end
  
  def get_sub_selection_for(search_term)
    sub_file = File.open("data/subeintraege.json")
    sub_entries = JSON.load(sub_file)
    sub_selection = []
    search_term.each_char do |character|
      sub_selection += sub_entries.select do |entry|
        entry["japanisch"].include?(character)
      end
    end
    return sub_selection
  end

end