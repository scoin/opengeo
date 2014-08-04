opengeo
=======
OpenGeo is a simple geocoder gem using the Mapquest Open Geocoding Service.

It is designed to be uncomplicated and fast for the simplest of use cases.

To start using OpenGeo, you will need an API Key from Mapquest. 
Get one here: http://developer.mapquest.com

Mapquest uses open, free, unlicensed data and does not specify a geocoding request limit.

Please read their terms of use here: 
http://developer.mapquest.com/web/products/open/geocoding-service

First you will need to:

    require 'opengeo'

To instantiate an OpenGeo object, do:

    myworld = OpenGeo.new(YOUR_MAPQUEST_API_KEY)

To receive a latitude and longitude, you can enter requests like:

    myworld.geocode("34 North 7th St, Brooklyn, NY, 11211")

or

    myworld.geocode("Brooklyn, NY")

or

    myworld.geocode("11211")

Just make sure the string's values are separated by commas.


To reverse geocode and receive an address, you must enter requests like:

    myworld.reverse("40.720459,-73.96263")

Please enjoy this 100% open source and open data geocoding gem!
