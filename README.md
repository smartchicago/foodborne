# FoodBorne

A simple web application that allows the Chicago Department of Public Health to monitor Chicago food-borne-illness-releated tweets, and respond in such a way that facilitates the submission of a 311 report.

## Setup

### Development

FoodBorne uses several services, including [Chicago's Open 311](http://dev.cityofchicago.org/docs/api), [Twitter](https://dev.twitter.com/docs/api/1.1), and a hosted MongoDB service which classifies tweets as food-borne-illness related. To setup a development environment, you will need to obtain api keys for Open 311 and Twitter, as well as MongoDB credentials from the Smart Chicago Collaborative.

Once you have obtained the necessary keys and credentials, copy the contents of `config/settings.yml.example` into a new file named `config/settings.yml`, and fill in the necessary information.

### Production

The live site is hosted on [Heroku](http://heroku.com), and can be found at [http://www.foodbornechicago.org/](http://www.foodbornechicago.org/). All api keys are set and retrieved using [Heroku's config variables](https://devcenter.heroku.com/articles/config-vars).

## Fetching Tweets

There are two, namespaced rake tasks for fetching tweets:

### Twitter

Pulls from a dummy [@foodpoisonuser Twitter account](https://twitter.com/foodpoisonuser).

    rake fetch:twitter

### Classifier

Pulls from the MongoDB classifier. As mentioned above, you will need credentials provided by the Smart Chicago Collaborative.

    rake fetch:classifier