module Interpres
  class Pull
    def self.run(path)
      text_api = Interpres::Api.new
      text_api.enabled_languages.each do |iso|
        text_api.download iso, path
      end
    end
  end
end
