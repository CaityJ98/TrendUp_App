#seperation of concerns. All things to do with factory bot are in this file

RSpec.configure do |config|
    #when running tests use factory bot
    config.include FactoryBot::Syntax::Methods

end 