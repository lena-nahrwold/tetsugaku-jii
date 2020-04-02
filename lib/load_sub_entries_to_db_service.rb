class LoadSubEntriesToDbService
  def self.perform
    sub_file = File.open("data/subeintraege.json")
    sub_entries = JSON.load(sub_file)
    sub_entries.each do |entry|
      SubEntry.create(
        japanese: entry["japanisch"],
        jisho: entry["jisho"],
        jisho_link: entry["jisho_link"],
        buddhdic: entry["buddhdic"],
        buddhdic_link: entry["buddhdic_link"],
        cjk: entry["cjk"],
        cjk_link: entry["cjk_link"],
        combinations_amount: entry["anzahl_kombinationen"],
        combinations: entry["kombinationen"]
      )
    end
  end
end
