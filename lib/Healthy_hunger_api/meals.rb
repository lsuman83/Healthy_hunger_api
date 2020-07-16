module HealthyHungerApi

    class Meals

        @@all = []

        def self.all

            @@all ||= load_meals

        end

        def self.find_by_number(choice)
            self.all[choice.to_i - 1]
        end

        def self.load_meals(time, cal, diet, allergy)
            if time == 'day'
                @meals = API.get_meals(time, cal, diet, allergy)["meals"]
            elsif time == 'week'
                @meals = API.get_meals(time, cal, diet, allergy)["items"]
            end
            #@nutrients = 
             #API.get_meals(time, cal, diet, allergy)["nutrients"]
            @@all = self.create_meal_from_specifics(@meals) 
        end


        def self.create_meal_from_specifics(meals)
            meals.map do |meal_hash|
                self.new(meal_hash)
            end

        end

        attr_accessor :id, :title, :readyInMinutes, :servings, :sumnary, :day, :slot, :value

        def initialize(attributes = {})
            attributes.each do |attribute_name, attribute_value|
                if self.respond_to?("#{attribute_name}=")
                    self.send("#{attribute_name}=", attribute_value)
                end
            end
        end

        
        def value_parser

            API.get_summary(JSON.parse(self.value)["id"])

        end

        
        def daily_summaries
            
            @summaries ||= API.get_summary(self.id) 
            
        end

        def weekly_summaries

                @summaries ||= value_parser

        end


        def display_meals_by_day

            puts daily_summaries["summary"].gsub(/<\/?[a-z]+>/, "").gsub(/<a href="[a-zA-Z0-9\/:\.\-\+]+">/, "")   

        end

        def display_meals_by_week

            puts weekly_summaries["summary"].gsub(/<\/?[a-z]+>/, "").gsub(/<a href="[a-zA-Z0-9\/:\.\-\+]+">/, "")

        end

    end

end