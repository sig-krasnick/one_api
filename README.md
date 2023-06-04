# README

## Welcome to the The Lord of the Rings SDK to access the "one API to rule them all"

## System Dependencies
 * The code was generated using the latest 3.x version of Ruby (3.1.2).  
   Earlier versions might not work properly
 * Rails 7.0
 * Bundler 2.4.12
   
## Installation
 * Clone this git repository
 * cd into project
 * run `bundle install`

## Configuration
 * sign up to obtain an access key from https://the-one-api.dev/sign-up
 * Modify .env hidden configuation file
        `API_TOKEN={access_token}`

## Run and test API locally
 * In a terminal window in the project directory run `bundle exec rails server` to start server
 * Read the design.md file for  all the SDK documentation
 * In the browser window visit any of the following endpoints
     * http://localhost:3000/api/movies
     * http://localhost:3000/api/movies/{movie_id}
     * http://localhost:3000/api/movies/{movie_id}/quote
     * http://localhost:3000/api/quotes
     * http://localhost:3000/api/quotes/{quote_id}

 * A single filtered request will work such as this
     * http://localhost:3000/api/v1/movies?query=budgetInMillions<100


## Developer's Notes
This is an API that is a wrapper around the https://the-one-api.dev/v2/ API.

You can find descriptions of all the endpoints here https://the-one-api.dev/documentation

Only the movies and quotes endpoints have been implemented in this SDK.  There are only 
GET endpoints in this api.  POST or PUT methods are not supported by the API.

Access to the API is handled by a single module located in lib/apiaccess.rb.  

The module contains a single class called ApiAccess that all models inherit from.  This class contains all the logic for creating the api requests
for the models and the formation of the filtering query parameters.  

The descendent models do not need to be concerned with the calling of the API. These methods are abstracted away from the model. 

Rather two class methods have been created that imitate a typical ROR ActiveRecord model.  The `all` method retrieves all the data from an endpoint. 
The `find_by_id({id})` method retrieves a single item from an endpoint.  The `all` method supports additional parameters to allow for filter queries
and pagination.

A call to retrieve all data from an endpoint would look like this `Movie.all(permitted_params)`. 

The permitted_params contins the filtering and sorting parameters.  
The default parameters are located in the application_controller.rb file

```
 def permitted_params
    params.permit(:id, :query, :sort, :page, :offset, :limit)
  end
```

It is very easy to add additional endpoints such as the book, chapter and character endpoints.
Create a class that inherits from ApiAccess and add the set_model_name method.  Here's an example:
```
class Chapter < ApiAccess

  def self.set_model_name
    self.model_name = 'chapter'
  end
end  
```
Create a new controller for the resource that contains an index and show method.
The index method will call the `model.all(permitted_params` method,  The show method will call the `model.find_by_id(id)` method.

here's an example

```
class Api::V1::ChaptersController < ApplicationController
  def index
    code, @chapters = Chapter.all(permitted_params)
    result = {status: code, data: @chapter['docs']}
    render json: result
  end

  def show
    code, @chapter = Chapter.find_by_id("#{permitted_params[:id]}")
    result = {status: code, data: @chapter['docs']}
    render json: result
  end
end
```
Note that the response will contain code, and the JSON parsed body.  Return the code and `body['docs']` in a single hash to the caller
`result = {status: code, data: @chapter['docs']}`

That's all that's required to return the data from the API.  

Both the movie and quotes models each do a bit extra to formulate 
a better response object.  

For example, the quote model returns a movie object as well as a charater object so that the caller does 
not have to make additional calls to decipher the movie and character ids.  
The model returns a quote object to handle the `movie({movie_id})/quote` endpoint.






