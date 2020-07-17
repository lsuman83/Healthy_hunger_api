# HealthyHungerApi

Welcome to my ruby gem HealthyHungerApi! It is designed to help those in need of finding some healthy meal options while creating a plan that the user can visualize. My gem takes in input based on whether the user wants a daily or weekly meal plan setup and also takes in certain parameters to help create a more specific plan such as desired caloric intake, diet (i.e. vegan, keto, etc..), and any allergies the user may have. After the user has input the optional parameters, my gem creates and outputs a daily or weekly meal plan based on the specifics entered. The meals that are found and used to create a meal plan and the summary that accompanies each meal are accessed through an outside API. All information that is used to produce the neal plans come from the spoonacular API called recipe-food-nutrition located at rapidapi.com. (https://rapidapi.com/spoonacular/api/recipe-food-nutrition)

## Installation

    $ gem install Healthy_hunger_api

    Healthy_hunger_api

   In order to run the gem type in '$ gem install Healthy_hunger_api', and then type in 'Healthy_hunger_api' to begin the cli application


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lsuman83/Healthy_hunger_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lsuman83/Healthy_hunger_api/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HealthyHungerApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lsuman83/Healthy_hunger_api/blob/master/CODE_OF_CONDUCT.md).
