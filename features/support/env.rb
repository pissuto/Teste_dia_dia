require 'capybara'
require 'capybara/cucumber'
require 'byebug'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'cpf_faker'
require 'faker'

require_relative 'helper.rb'
require_relative 'page_helper.rb'

World(Pages)
World(Helper)

AMBIENTE = ENV['AMBIENTE']
BROWSER = ENV['BROWSER']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{AMBIENTE}.yml")

## register driver according with browser chosen
Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { 'args' => ['--incognito',
                                        '--disable-cache',
                                        'start-maximized',
                                        '--disable-infobars'] }
      )
    )
  elsif BROWSER.eql?('chrome_headless')
    Capybara::Selenium::Driver.new( 
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { 'args' => ['--incognito',
                                        '--headless',
                                        'disable-gpu',
                                        '--disable-cache',
                                        '--disable-infobars'] }
      )
    )
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      marionette: true
    )
  elsif BROWSER.eql?('firefox_headless')
    browser_options = Selenium::WebDriver::Firefox::Options.new(
      args: ['--headless',
             'disable-gpu',
             '--disable-cache']
    )
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: browser_options
    )
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url_default']
  config.default_max_wait_time = 10
end
