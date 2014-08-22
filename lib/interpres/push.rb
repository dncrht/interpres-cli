module Interpres
  class Push
    def self.run(path, inclusion = '{app,lib}/**/*.{rb,erb,haml}', exclusion = nil)
      inclusion = File.join(path, inclusion)
      exclusion = exclusion ? File.join(path, exclusion) : nil

      cache = Interpres::Cache.new

      texts = Interpres::Extractor.new(inclusion, exclusion).run

      Interpres::Api.new.upload cache.diff(texts)

      puts "#{cache.diff(texts).count} new text strings"

      cache.write(texts)
    end
  end
end
