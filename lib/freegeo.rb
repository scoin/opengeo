class FreeGeo

	def initialize(apikey, opts = {})
		@key = apikey
	end

	def self.distance(opts = {})
		#will take two points and calculate distance using haversine
	end

	def self.geocode(opts = {})
		#will take an address and return lat / long
	end

	def self.getaddress(opts = {})
		#will take a lat and long and return an address
	end

end