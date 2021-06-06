require_relative "Healthy_hunger_api/version" #gives access to the version file in the Healthy_hunger_api folder
require_relative "Healthy_hunger_api/meals" #gives access to the meals file in the Healthy_hunger_api folder
require_relative "Healthy_hunger_api/api" #gives access to the api file in the Healthy_hunger_api folder
require_relative "Healthy_hunger_api/cli" #gives access to the cli file in the Healthy_hunger_api folder
require_relative "Healthy_hunger_api/recipes"

module HealthyHungerApi
  class Error < StandardError; end
  # Your code goes here...
end
