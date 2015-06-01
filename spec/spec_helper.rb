require 'rubygems'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'database_cleaner'
require 'rails/mongoid'

RSpec.configure do |config|
  config.fixture_path                               = "#{Rails.root}/spec/fixtures"
  config.use_transactional_fixtures                 = false
  config.infer_base_class_for_anonymous_controllers = false

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  config.order = :random
  #смело убирайте след строку, если не используите devise
  config.include Devise::TestHelpers, :type => :controller

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
  config.extend ControllerMacros, :type => :controller
  
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  
  config.before(:each) do
    DatabaseCleaner.start
  end
  
  config.after(:each) do
    DatabaseCleaner.clean
  end
end