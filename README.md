# README

## Welcome to the The Lord of the Rings SDK to access the "one API to rule them all"

    ## Installation
    * Clone this git repository
    * cd into project
    * run `bundle install`

    ## Configuration
    * sign up to obtain an access key from https://the-one-api.dev/sign-up
    * Modify .env hidden configuation file
        API_TOKEN={access_token}

    ## System Dependencies
    * The code was generted using the latest 3.x version of Ruby (3.1.2).  Earlier versions might not work properly

    ## Run and test API locally
    ⋅⋅* In a terminal window in the project directory run `bundle exec rails server` to start server
    ..* Read the design.md file for  all the SDK documentation
    ⋅⋅* In the browser window visit any of the following endpoints
        * http://localhost:3000/api/movies
        * http://localhost:3000/api/movies/{movie_id}
        * http://localhost:3000/api/movies/{movie_id}/quote
        * http://localhost:3000/api/quotes
        * http://localhost:3000/api/quotes/{quote_id}

    * A single filtered request will work such as this
        * http://localhost:3000/api/v1/movies?query=budgetInMillions<100
