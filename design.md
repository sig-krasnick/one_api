# One API SDK Design Document

## API Endpoint: `http://localhost:3000/api/v1/movies/`

### Description
This API endpoint returns a list of movies related to "The Lord of the Rings" and "The Hobbit" series. The response will include details such as the movie name, runtime, budget, box office revenue, academy award nominations and wins, and the Rotten Tomatoes score.

### Request

The request to the API endpoint `http://localhost:3000/api/v1/movies/` does not require any specific request parameters.

#### Endpoint


### Response

The response from the API endpoint `http://localhost:3000/api/v1/movies/` will be in JSON format and will include the following structure:

```json
{
  "status": "200",
  "data": [
    {
      "_id": "5cd95395de30eff6ebccde56",
      "name": "The Lord of the Rings Series",
      "runtimeInMinutes": 558,
      "budgetInMillions": 281,
      "boxOfficeRevenueInMillions": 2917,
      "academyAwardNominations": 30,
      "academyAwardWins": 17,
      "rottenTomatoesScore": 94
    },
  ]
}

The response will include the following properties:

status (string): The status of the API response.
data (array): An array containing movie objects.
Each movie object will have the following properties:

_id (string): The unique identifier of the movie.
name (string): The name or title of the movie.
runtimeInMinutes (integer): The runtime of the movie in minutes.
budgetInMillions (integer): The budget of the movie in millions.
boxOfficeRevenueInMillions (integer): The box office revenue of the movie in millions.
academyAwardNominations (integer): The number of academy award nominations received by the movie.
academyAwardWins (integer): The number of academy awards won by the movie.
rottenTomatoesScore (float): The Rotten Tomatoes score of the movie.

### Error Handling

In case of any errors, the API should follow standard HTTP error status codes and return appropriate error messages in the response body.

### SDK Usage Example

Below is an example of how the SDK client can use the API endpoint `http://localhost:3000/api/v1/movies/?query=budgetInMillions<100`
In this example, the URL  is used to retrieve movies with a budget less than 100 million. The response is then processed and the details of each movie are printed.
You can similarly use other filtering options like academyAwardWins>0 or runtimeInMinutes>=160 by modifying the URL accordingly:
```code
import requests

def get_movie_data():
    url ="http://localhost:3000/api/v1/movies?query=budgetInMillions<100"
    response = requests.get(url)
    if response.status_code == 200:
        movies = response.json()["data"]
        for movie in movies:
            print(f"Name: {movie['name']}")
            print(f"Runtime: {movie['runtimeInMinutes']} minutes")
            print(f"Budget: ${movie['budgetInMillions']} million")
            print(f"Box Office Revenue: ${movie['boxOfficeRevenueInMillions
```




## API Endpoint: `http://localhost:3000/api/v1/movies/{movieId}`

### Description
This API endpoint allows you to retrieve information about a specific movie by providing the movie ID in the URL. The response will include details such as the movie name, runtime, budget, box office revenue, academy award nominations and wins, and the Rotten Tomatoes score.

### Request

The request to the API endpoint `http://localhost:3000/api/v1/movies/{movieId}` requires the `movieId` path parameter to specify the ID of the movie you want to retrieve.

#### Endpoint


### Response

The response from the API endpoint `http://localhost:3000/api/v1/movies/{movieId}` will be in JSON format and will include the following structure:

```json
{
  "status": "200",
  "data": [
    {
      "_id": "5cd95395de30eff6ebccde56",
      "name": "The Lord of the Rings Series",
      "runtimeInMinutes": 558,
      "budgetInMillions": 281,
      "boxOfficeRevenueInMillions": 2917,
      "academyAwardNominations": 30,
      "academyAwardWins": 17,
      "rottenTomatoesScore": 94
    }
  ]
}

The response will include the following properties:
    • status (string): The status of the API response.
    • data (array): An array containing a single movie object that matches the provided movieId.
The movie object will have the following properties:
    • _id (string): The unique identifier of the movie.
    • name (string): The name or title of the movie.
    • runtimeInMinutes (integer): The runtime of the movie in minutes.
    • budgetInMillions (integer): The budget of the movie in millions.
    • boxOfficeRevenueInMillions (integer): The box office revenue of the movie in millions.
    • academyAwardNominations (integer): The number of academy award nominations received by the movie.
    • academyAwardWins (integer): The number of academy awards won by the movie.
    • rottenTomatoesScore (float): The Rotten Tomatoes score of the movie.
SDK Usage Example
Below is an example of how the SDK client can use the API endpoint `http://localhost:3000/api/v1/movies/{movieId}`:
```code
import requests

import requests

def get_movie_details(movie_id):
    url = f"http://localhost:3000/api/v1/movies/{movie_id}"
    response = requests.get(url)
    if response.status_code == 200:
        movie = response.json()["data"][0]
        print(f"Name: {movie['name']}")
        print(f"Runtime: {movie['runtimeInMinutes']} minutes")
        print(f"Budget: ${movie['budgetInMillions']} million")
        print(f"Box Office Revenue: ${movie['boxOfficeRevenueInMillions']} million")
        print(f"Academy Award Nominations: {movie['academyAwardNominations']}")
        print(f"Academy Award Wins: {movie['academyAwardWins']}")
        print(f"Rotten Tomatoes Score: {movie['rottenTomatoesScore']}")


# Calling the functions to get movie details and quotes
get_movie_details("5cd95395de30eff6ebccde5c")




## API Endpoint: `http://localhost:3000/api/v1/movies/{movieId}/quote`

### Description

This API endpoint allows you to retrieve quotes from a specific movie by providing the movie ID in the URL. The response will include an array of quotes related to the movie.
### Request

The request to the API endpoint http://localhost:3000/api/v1/movies/{movieId}/quote requires the movieId path parameter to specify the ID of the movie you want to retrieve quotes from.

### Endpoint

``` GET http://localhost:3000/api/v1/movies/{movieId}/quote ```

### Response

The response from the API endpoint `http://localhost:3000/api/v1/movies/{movieId}/quote` will be in JSON format and will include the following structure:
{
  "status": "200",
  "data": [
    {
      "_id": "5cd95395de30eff6ebccde5c",
      "name": "The Fellowship of the Ring",
      "quotes": []
    }
  ]
}

The response will include the following properties:
    • status (string): The status of the API response.
    • data (array): An array containing a single movie object that matches the provided movieId.
The movie object will have the following properties:
    • _id (string): The unique identifier of the movie.
    • name (string): The name or title of the movie.
    • quotes (array): An array of quotes from the movie. (Currently empty)



### SDK Usage
```
import requests


def get_movie_quotes(movie_id):
    url = f"http://localhost:3000/api/v1/movies/{movie_id}/quote"
    response = requests.get(url)
    if response.status_code == 200:
        quotes = response.json()["data"][0]["quotes"]
        if len(quotes) > 0:
            print("Quotes:")
            for quote in quotes:
                print(f"- {quote}")
        else:
            print("No quotes available for this movie.")

# Calling the functions to get movie details and quotes
get_movie_quotes("5cd95395de30eff6ebccde5c")

```

## API Endpoint:  http://localhost:3000/api/v1/movies/quotes

Description
This API endpoint allows you to retrieve a list of quotes from various movies. Each quote includes the dialog, movie ID and name, character ID and name, and a unique quote ID.
Request
The request to the API endpoint http://localhost:3000/api/v1/quotes does not require any additional parameters.
Endpoint
` GET http://localhost:3000/api/v1/quotes `


### Response

The response from the API endpoint `http://localhost:3000/api/v1/quotes` will be in JSON format and will include the following structure:
```
{
  "status": "200",
  "data": [
    {
      "_id": "5cd96e05de30eff6ebcce7e9",
      "dialog": "Deagol!",
      "movie":  "5cd95395de30eff6ebccde5d",
      "character":"5cd99d4bde30eff6ebccfe9e",
        "name": "Gollum"
      "id": "5cd96e05de30eff6ebcce7e9"
    },
  ]
}  ```

The response will include the following properties:
    • status (string): The status of the API response.
    • data (array): An array containing multiple quote objects.
Each quote object will have the following properties:
    • _id (string): The unique identifier of the quote.
    • dialog (string): The dialog of the quote.
    • movie (object): An object containing the movie details.
        ◦ id (string): The unique identifier of the movie.
        ◦ name (string): The name or title of the movie.
    • character (object): An object containing the character details.
        ◦ id (string): The unique identifier of the character.
        ◦ name (string): The name of the character.
    • id (string): The unique identifier of the quote.
SDK Usage Example
Below is an example of how the SDK client can use the API endpoint http://localhost:3000/api/v1/quotes:
```
import requests

def get_quotes():
    url = "http://localhost:3000/api/v1/quotes"
    response = requests.get(url)
    if response.status_code == 200:
        quotes = response.json()["data"]
        if len(quotes) > 0:
            for quote in quotes:
                print("Quote:")
                print(f"- Dialog: {quote['dialog']}")
                print(f"- Movie: {quote['movie']['name']} (ID: {quote['movie']['id']})")
                print(f"- Character: {quote['character']['name']} (ID: {quote['character']['id']})")
                print(f"- Quote ID: {quote['id']}")
                print("---")
        else:
            print("No quotes available.")

# Calling the function to get quotes
get_quotes()
```

## API Endpoint: http://localhost:3000/api/v1/quotes/{quoteId}
### Description
This API endpoint allows you to retrieve information about a specific quote by providing the quote ID in the URL. The response will include the dialog, movie ID and name, character ID and name, and the quote ID.
### Request
The request to the API endpoint http://localhost:3000/api/v1/quotes/{quoteId} requires the quoteId path parameter to specify the ID of the quote you want to retrieve.
### Endpoint
` GET http://localhost:3000/api/v1/quotes/{quoteId} `

### Response 
The response from the API endpoint `http://localhost:3000/api/v1/quotes/{quoteId}` will be in JSON format and will include the following structure:
```
{
  "status": "200",
  "data": {
    "_id": "5cd96e05de30eff6ebcce7e9",
    "dialog": "Deagol!",
    "movie": {
      "id": "5cd95395de30eff6ebccde5d",
      "name": "The Two Towers"
    },
    "character": {
      "id": "5cd99d4bde30eff6ebccfe9e",
      "name": "Gollum"
    },
    "id": "5cd96e05de30eff6ebcce7e9"
  }
}
```

The response will include the following properties:
    • status (string): The status of the API response.
    • data (object): An object containing the quote details.
The quote object will have the following properties:
    • _id (string): The unique identifier of the quote.
    • dialog (string): The dialog of the quote.
    • movie (object): An object containing the movie details.
        ◦ id (string): The unique identifier of the movie.
        ◦ name (string): The name or title of the movie.
    • character (object): An object containing the character details.
        ◦ id (string): The unique identifier of the character.
        ◦ name (string): The name of the character.
    • id (string): The unique identifier of the quote.
SDK Usage Example
Below is an example of how the SDK client can use the API endpoint http://localhost:3000/api/v1/quotes/{quoteId}:

```
import requests

def get_quote(quote_id):
    url = f"http://localhost:3000/api/v1/quotes/{quote_id}"
    response = requests.get(url)
    if response.status_code == 200:
        quote = response.json()["data"]
        print("Quote:")
        print(f"- Dialog: {quote['dialog']}")
        print(f"- Movie: {quote['movie']['name']} (ID: {quote['movie']['id']})")
        print(f"- Character: {quote['character']['name']} (ID: {quote['character']['id']})")
        print(f"- Quote ID: {quote['id']}")
    else:
        print("Quote not found.")

# Calling the function to get a specific quote
get_quote("5cd96e05de30eff6ebcce7e9")
```
Feel free to adjust the SDK usage examples based on your programming language and requirements.

### Other endpoints coming soon in V2!
/book 			List of all "The Lord of the Rings" books
/book{id}/chapter	Request all chapters of one specific book
/character			List of characters including metadata like name, gender, realm, race
/character/{id}		Request one character
/character/{id}/quote	Request all movie quotes of one specific character
/chapter			List of all book chapters
/chapter/{id}		Request one specific book chapter



