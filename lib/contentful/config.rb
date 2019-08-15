require 'yaml'
require 'erb'

module Contentful
  class Config
    attr_reader :config

    def initialize(file_name = 'contentful.yml')
      file = Rails.root.join('config', file_name)
      @config = YAML.safe_load(ERB.new(File.read(file)).result, [], [], true)[Rails.env] || {}
      define_methods_for_env(config.keys)
    end

    def define_methods_for_env(names)
      names.each do |name|
        self.class.send(:define_method, name.to_sym) do
          config[name]
        end
      end
    end
  end
end
