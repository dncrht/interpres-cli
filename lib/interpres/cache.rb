module Interpres
  class Cache

    CACHE = '.interpres_cache.json'

    def initialize
      mode = File.file?(CACHE) ? 'r' : 'w+'
      file = File.open(CACHE, mode)
      @cached_texts = Oj.load(file.read) || []
      file.close
    end

    def read
      @cached_texts
    end

    def write(texts)
      file = File.open(CACHE, 'w')
      file.write(Oj.dump texts)
      file.close
      @cached_texts = texts
    end

    def diff(texts)
      texts - @cached_texts
    end

  end
end
