class LoadMainEntriesToDbService
  def self.perform
    main_file = File.open("data/haupteintraege.json")
    main_entries = JSON.load(main_file)
    main_entries.each do |entry|
      MainEntry.create(
        japanese: entry["japanisch"],
        english: entry["englisch"],
        phonetics: entry["lautschrift"],
        page: entry["seitenzahl"],
        jisho: entry["jisho"],
        jisho_link: entry["jisho_link"],
        buddhdic: entry["buddhic"],
        buddhdic_link: entry["buddhdic_link"],
        cjk: entry["cjk"],
        cjk_link: entry["cjk_link"],
        symbols: entry["symbols"]
      )
    end
  end
end
