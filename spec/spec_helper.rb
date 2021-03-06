ENV["RACK_ENV"] ||= 'test'

require 'rspec'
require 'capybara/dsl'
require 'bundler'
Bundler.require(:default, :test)

require File.expand_path("../../config/environment", __FILE__)

Capybara.app = LittleShopApp

RSpec.configure do |c|
  c.include Capybara::DSL
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:each) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
