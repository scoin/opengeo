require 'net/http'
require 'json'

class OpenGeo
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
		address.gsub!(/ /, "%20")
		request = build_url("address" => address)
		parse_latlng(http_request(request))
	end

	def reverse(latlng)
		#will take a lat and long and return an address
		latlng.gsub!(/ /, '')
		request = build_url("reverse" => latlng)
		parse_address(http_request(request))
	end

	private

	def build_url(opts = {})
		call = opts.keys.first
		url = self.version + call + "?key=" + self.key 
		url += "&location=" + opts[call] + self.extraparams
	end

	def http_request(request)
		JSON.parse(Net::HTTP.get_response(self.url,request).body)
	end

	def parse_latlng(response)
		response = response["results"][0]["locations"][0]["latLng"]
		[response["lat"], response["lng"]].join(',')
	end

	def parse_address(response)
		address = response["results"][0]["locations"][0]
		[address["street"], address["adminArea5"], address["adminArea3"], address["postalCode"]].join(', ')
	end

end