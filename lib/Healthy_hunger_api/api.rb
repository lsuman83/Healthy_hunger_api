require 'uri'
require 'net/http'
require 'openssl'
require 'json'


module HealthyHungerApi

    class API #class that is accessing the api from the url

      def self.get_meals (timeFrame, targetCalories, diet, exclude) #class method that is accepting input parameters to get specific info from url   

        url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/mealplans/generate")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        params = { #optional parameters that are used to access specific info within the api
            timeFrame: timeFrame, 
            targetCalories: targetCalories, 
            diet: diet, 
            exclude: exclude
        }

        url.query = URI.encode_www_form(params)

        request = Net::HTTP::Get.new(url) #calling the Net::HTTP get method and passing the url to that method
        request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
        request["x-rapidapi-key"] 

        response = http.request(request)
        JSON.parse(response.read_body) if response.is_a?(Net::HTTPSuccess) #parsing through the return value of the response.body as long as the get request is successful
      end

      def self.get_summary(id) #class method used to get the summary of each item using a single id parameter

        url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{id}/summary")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        
        
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = 
        response = http.request(request)
        JSON.parse(response.read_body) if response.is_a?(Net::HTTPSuccess)

      
      end


    end

end
