## Sweater Weather 

This is a one week long, solo project where we use Rails to consume the Dark Sky API, Google Geocoding API, Flickr API and Amypode API to build a JSON API that renders current, hourly and weekly weather data for a specific location.

The project serves as the back-end of an application, where a user can create and account, log in, and save, see and delete favorite locations. Each location will be able to retrieve the weather data at any time.

Here is the [project description](http://backend.turing.io/module3/projects/sweater_weather). In the project I have used the gem  Fast JSON:API, which complies with the the [JSON:API specifications](https://jsonapi.org/). I have also used redis caching in [production](https://mysterious-citadel-95028.herokuapp.com) that will save the weather data for an hour before making a new API call.

## Local Setup

If you wish to install this app locally, you can fork or clone the repository:

```
	$ git clone https://github.com/juliamarco/sweater_weather.git
	$ cd sweater_weather
	$ bundle install
```
Set up the database:
```
$ rake db:create
$ rake db:migrate
```
You will need to sign up for API keys from:

Dark Sky API
Google Geocoding API
Flickr API
Amypode API

Once the app is installed locally, you can run the test suite:
```
$ rspec
```
