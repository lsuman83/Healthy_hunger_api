module HealthyHungerApi

    class Meals #class that takes in the input from the api and creates meal objects that can be
        #parsed and sent to the cli for output

        @@all = []

        def self.all #class method that is used as a getter for the class array @@all

            @@all ||= load_meals #loads the meal objects into the @@all array if they don't already exist

        end

        def self.find_by_number(choice) #class method that takes in the choice of the user and then finds
            #the meal object associated with it within the all array
            self.all[choice.to_i - 1]
        end

        def self.load_meals(time, cal, diet, allergy) #class method that passes input from the user into the class methods
            #from the API class based on a conditional of whether the user has chosen day or week for time. It then assigns
            #the return value of those class methods to an instance variable @meals which is passed to a class method within
            #the meals class to create a new instance for each meal and assign the instances to the @@all array

            if time == 'day'
                @meals = API.get_meals(time, cal, diet, allergy)["meals"] #gets the meals from the API class using a the hash symbol
            elsif time == 'week'                                           #necessary to get the appropriate data for daily meals         
                @meals = API.get_meals(time, cal, diet, allergy)["items"]
            end
            
            @@all = self.create_meal_from_specifics(@meals) #passing the return values to create new instances of meals
        end


        def self.create_meal_from_specifics(meals) #class method that is used to create new instances by iterating over the meal hash
            meals.map do |meal_hash|
                self.new(meal_hash)
            end

        end

        attr_accessor  :id, :title, :readyInMinutes, :servings, :sumnary, :day, :slot, :value #creates getter and setter methods for each
                                                                                     #hash key received from the api meal hash               

        def initialize(attributes = {}) #initializes new instances of each meal
            attributes.each do |attribute_name, attribute_value| #iterates over each has assigning each key as an attribute name
                if (attribute_name == "value")
                    initialize(JSON.parse(attribute_value))
                elsif self.respond_to?("#{attribute_name}=")       #and each key value as the attribute value using the send method
                    self.send("#{attribute_name}=", attribute_value)
                end
            end
        end

        
      

        
        def summaries #instance method that uses the id key from the return value of the class method
                            #get_summary of the API class to get the summary of each meal for a daily meal plan
            
            @summaries ||= API.get_summary(self.id) 
            
        end

       

        def get_meal_id

            self.id

        end

        def meals_summary #instance method that uses the "summary" string to access the value from that hash symbol
                                #and replace each of the symbols found through the regex passed into the .gsub method 
                                #with an empty space
            puts ""
            puts "Summary:"
            puts summaries["summary"].gsub(/<\/?[a-z]+>/, "").gsub(/<a href="[a-zA-Z0-9\/:\.\-\+]+">/, "")   
            

        end

       
    end

end