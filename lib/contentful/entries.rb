require_relative 'client'
require_relative 'config'

module Contentful
  class Entries
    attr_reader :client

    def initialize(opts = {})
      opts[:file] ||= 'contentful.yml'
      @client = opts[:client] ||= Client.new(Config.new(opts[:file]))
    end

    def fetch(opts = {})
      opts[:content_type] ||= 'recipe'
      opts[:include] ||= '1'

      response = client.call(opts)
      response['items'].inject([]) do |arr, item|
        recipe = {}
        recipe[:id] = item['sys']['id']
        recipe[:title] = item['fields']['title']
        recipe[:description] = item['fields']['description']

        recipe[:image] = response['includes']['Asset'].find do |asset|
          asset['sys']['id'] == item.dig('fields', 'photo', 'sys', 'id')
        end['fields'].slice('title', 'file') unless item.dig('fields', 'photo', 'sys', 'id').nil?

        recipe[:chef] = response['includes']['Entry'].find do |asset|
          asset['sys']['id'] == item.dig('fields', 'chef', 'sys', 'id')
        end.dig('fields', 'name') unless item.dig('fields', 'chef', 'sys', 'id').nil?

        recipe[:tags] ||= []
        item.dig('fields', 'tags').each do |tag|
          t = response['includes']['Entry'].find { |a| a['sys']['id'] == tag['sys']['id'] }['fields'].slice('name')
          recipe[:tags].push(t['name']) unless t.nil?
        end if item.dig('fields', 'tags')

        arr.push(recipe)
        arr
      end
    end
  end
end
