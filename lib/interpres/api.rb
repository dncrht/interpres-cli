module Interpres
  class Api

    def initialize
      @token = ENV['INTERPRES_TOKEN'] or raise "Can't continue without a token"
    end

    def upload(texts)
      texts.each do |literal|
        connection.post '/texts', {text: {literal: literal}, app_token: @token}
      end
    end

    def download(language, path)
      Dir.mkdir(path) unless File.directory? path
      f = File.open "#{path}/#{language}.po", 'w'
      f.write get('/texts.po', {iso: language})
      f.close
    end

    def enabled_languages
      Oj.load get('/apps/enabled_languages')
    end

    private

    def connection
      return @connection if @connection

      @connection = Faraday.new(url: ENV['INTERPRES_URL'])
      if ENV['INTERPRES_USER'] && !ENV['INTERPRES_USER'].empty?
        @connection.basic_auth(ENV['INTERPRES_USER'], ENV['INTERPRES_PASSWORD'])
      end
      @connection
    end

    def get(url, resource = {})
      request = connection.get url, {app_token: @token}.merge(resource)

      raise 'Problem requesting #{url}: check env vars' if request.status != 200

      request.body
    end
  end
end
