module HealthyHungerApi
    
    class Recipes

        @@all = []

        def self.all

            @@all ||= load_recipes

        end

        def self.load_recipes(id)

            @recipes = API.get_recipes(id)["extendedIngredients"]
            @@all = self.create_new_recipe(@recipes)
            binding.pry
        end

        def self.create_new_recipe(recipes)

            recipes.map do |recipe_hash|
                self.new(recipe_hash)
            end

        end

        attr_accessor :extended_ingredients, :instructions

        def initialize (attributes = {})

            attributes.each do |attribute_name, attribute_value|
                self.send("#{attribute_name}=", attribute_value) if self.respond_to?("#{attribute_name}=")
            end

        end


    end

end
