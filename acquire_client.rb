module BillForwardDemo
  class Config
    attr_accessor :config
    attr_accessor :client
    attr_accessor :yam

    def initialize
      @yam = YAML.load_file('config.yml')

      @config = BillForward::Configuration.new
      @config.host = @yam['config']['host']
      @config.scheme = @yam['config']['scheme']
      @config.base_path = @yam['config']['base_path']
      @config.debugging = @yam['config']['debugging']
      @config.logger.level = Logger.const_get(@yam['client']['logger']['level'])

      access_token = @yam['client']['access_token']

      @client = BillForward::ApiClient.new @config
      @client.default_headers.merge! 'Authorization' => "Bearer #{access_token}"
    end
  end
end