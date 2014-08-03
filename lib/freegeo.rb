require 'net/http'
require 'json'

class FreeGeo
	attr_reader :key, :url, :extraparams
	def initialize(apikey, opts = {})
		@key = apikey
		@url = "open.mapquestapi.com"
		@extraparams = "&thumbMaps=false&maxResults=1"
	end

	def distance(opts = {})
		#will take two points and calculate distance using haversine
	end

	def geocode(opts = {})
		#will take an address and return lat / long
		address = opts[:address].split(' ').join('%20')
		request = build_url(address)
		response = http_request_and_parse(request)
		[response["lat"], response["lng"]].join(',')
	end

	def getaddress(opts = {})
		#will take a lat and long and return an address
	end

	private

	def build_url(address)
		"/geocoding/v1/address/?key=" + self.key + "&location=" + address + self.extraparams
	end

	def http_request_and_parse(request)
		JSON.parse(Net::HTTP.get_response(self.url,request).body)["results"][0]["locations"][0]["latLng"]
	end

end