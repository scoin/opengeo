require 'net/http'
require 'json'

class FreeGeo
	attr_reader :key, :url, :version, :extraparams
	def initialize(apikey, opts = {})
		@key = apikey
		@url = "open.mapquestapi.com"
		@version = "/geocoding/v1/"
		@extraparams = "&thumbMaps=false&maxResults=1"
	end

	def distance(opts = {})
		#will take two points and calculate distance using haversine
	end

	def geocode(address)
		#will take an address and return lat / long
		address = address.split(' ').join('%20')
		request = build_url("address" => address)
		response = http_request_and_parse(request)
		[response["lat"], response["lng"]].join(',')
	end

	def reverse(opts = {})
		#will take a lat and long and return an address
		# self.version + /reverse?key=YOUR_KEY_HERE&callback=renderReverse&location=40.053116,-76.313603
	end

	def build_url(opts = {})
		call = opts.keys.first
		url = self.version + call + "?key=" + self.key 
		url += "&callback=renderReverse&" if call == "reverse"
		url += "&location=" + opts[call] + self.extraparams
	end

	def http_request_and_parse(request)
		JSON.parse(Net::HTTP.get_response(self.url,request).body)["results"][0]["locations"][0]["latLng"]
	end

end