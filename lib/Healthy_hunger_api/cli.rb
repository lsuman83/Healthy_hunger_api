module HealthyHungerApi

    class CLI  #class that runs the CLI. It outputs options to the screen and receives input from a user to help access othe classes

        def initialize 

            @input = "" #initializes all input instances to an empty string
            @all = []
        end

        def start #instance method that starts the program and calls other instance methods used to access info for the app

            puts "What is your name?"
            @input = gets.strip
            puts ""
            puts "\tWelcome to our Healthy Hunger CLI app, #{@input}!"
            puts ""
            puts "We are here to help you create a healthy meal plan for yourself. Let's get started!"
            puts ""

                
            meal_plan_time_frame
            meal_calories
            diet
            allergies
        
            set_meals
            if @menu_input == 'day' #conditional statements used to call a method that displays the meals by day or by week
                list_meals_by_day 
            elsif @menu_input == 'week'
                list_meals_by_week
            end
            ask_for_choice
                
            while @input != 'exit' #conditionals based on the validity of the choice returned by the ask_for_choice method
                if valid?(@input)
                    #if @menu_input == 'day'
                    Meals.find_by_number(@input).meals_summary #calls the instance method that displays the meals by using the class method 
                    #elsif @menu_input == 'week' #that is used to find the number that references the particular meal from the Meal class
                      #  Meals.find_by_number(@input).display_meals_by_week
                    #end
                    @meal_id = Meals.find_by_number(@input).get_meal_id
                    
                    set_recipes

                    puts ""
                    Recipes.print_recipe
                    
                    puts ""
                    puts "To see the description of another meal, type 'next'"
                    puts "otherwise type 'exit' to exit the app!"

                    @input = gets.strip
                    if @input == 'next' #conditional that is used to either exit the program or get more descriptions of meals
                        if @menu_input == 'day' #conditional statements used to call a method that displays the meals by day or by week
                            list_meals_by_day 
                        elsif @menu_input == 'week'
                            list_meals_by_week
                        end
                        ask_for_choice
                    elsif @input != 'next' && @input != 'exit'
                        puts "Didn't recognize input. Please try again"
                        puts ""
                    end
                elsif !valid?(@input) #conditional that is checking input validation and displays error if not valid
                    puts "Please make a valid selection."
                    puts ""
                    ask_for_choice
                elsif @input == 'exit'
                    return 'exit'
                end

            end

            puts ""
            puts "Thank you for using our Healthy Hunger CLI app!"

        end

        def meal_plan_time_frame #instance method that takes the input of whether the user wants a daily meal plan or weekly one

                puts "Please choose from one of the following options to"
                puts "create a meal plan designed especially for you: "
                puts ""
                puts "\t1 - Daily Meal Plan"
                puts "\t2 - Weekly Meal Plan"
                puts ""
                @input = gets.strip
                
                puts ""

                if @input == '1'#conditional used to set the return value of the method based on the user input so that the method returns
                    @menu_input = "day"# the proper string to pass to the api call
                elsif @input == '2'
                    @menu_input = "week"
                else
                    puts "Please enter proper input, choose either '1' or '2'"
                    puts ""
                    meal_plan_time_frame#recursively calls the method if input is invalid and gives the user the option again
                end

        end

        def meal_calories #instance method that is getting a calorie input from user also making sure the
                            #value is within the parameters given
            puts "What is your target daily Calorie intake? (400 - 3200)"
            @meal_cal = gets.strip

            puts ""

            if @meal_cal.to_i == 0 #checking to make sure the user doesn't accidentally input a string
                puts "Please enter a number"
                puts ""
                meal_calories
            end
            if @meal_cal.to_i < 400 || @meal_cal.to_i > 3200 #checking that the input from the user is within parameters giben
                puts "Please enter a number between 400 and 3200"#and displaying an error message if it is not
                puts ""
                meal_calories
            end
           
        end

        def diet #instance method that takes in a numbered menu choice and sets that menu choice
                #to the proper string that needs to be passed to the api as a parameter
            puts "Choose your diet:"
            puts "  1. Vegetarian"
            puts "  2. Vegan"
            puts "  3. Paleo"
            puts "  4. Keto"
            puts "  5. None"   
            @input = gets.strip 

            puts ""

            if @input == "1" #conditionals setting the return values of the method equal to the string that the input
                @diet_input = "vegetarian"#from the user refers to
            elsif @input == '2'
                @diet_input = "vegan"
            elsif @input == '3'
                @diet_input = "paleo"
            elsif @input == '4'
                @diet_input = "keto"
            elsif @input == '5'
                @diet_input = 'null'
            else
                puts "Please make a valid selection (1 - 5)."
                puts ""
                diet
            end    

        end

        def allergies #instance method that takes in possible allergies as input and returns those 
                        #strings as values of the method
            puts "List any allergies you may have. If you enter more than one, seperate them with a comma."
            @allergy = gets.strip

            if @allergy.to_i != 0 #checks to make sure that the value entered is not an integer
                puts "Please enter an allergy, not a number."
                puts ""
                allergies
            end

        end

        def set_meals #instance method that passes each input value for the previous
                        #methods into the class Meals class method load_by_day when menu input 
            Meals.load_meals(@menu_input, @meal_cal, @diet_input, @allergy)
           
        end

        def set_recipes

            Recipes.load_recipes(@meal_id)

        end

        def list_meals_by_day #instance method that searches through all of the meal objects that have been 
                #created for a daily meal plan, iterates over the objects and prints out the name of the meal with its
                #index number next to it

            puts "" 
            puts "Here are your meals for the day:"
            puts ""

            Meals.all.each.with_index(1) do |meal, index|
                puts "Meal ##{index}: #{meal.title}"
            end

        end
        
        def list_meals_by_week #instance method that searches through all of the meal objects that have been 
            #created for a weekly meal plan, iterates over the objects and prints out the name of the meal with its
            #index number next to it. It also prints the meal number and which day of the week it is refering to

            puts ""
            puts "Here are your meals for the week:"
            puts ""

            daily_index = 0

            Meals.all.each.with_index(1) do |meal, index|
                if daily_index % 3 == 0
                    puts "Day ##{meal.day}:"
                end
                puts "  Meal ##{meal.slot} (#{index}): #{meal.title}"
                daily_index += 1
            end

        end


        def ask_for_choice #instance method that is asking the user to input the meal number in order to see
            #which meal that the user wants a description of

            puts ""
            puts "Choose a meal number to see a description"
            @input = gets.strip
    
        end

        def valid?(input) #instance method that returns as truthy or falsey based on whether the input that 
            #the user has chosen is a valid meal number in the list of meal objects

            Meals.all[input.to_i - 1] != nil

        end

    end

end