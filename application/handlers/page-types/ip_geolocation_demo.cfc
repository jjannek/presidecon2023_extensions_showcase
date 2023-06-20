component {

	property name="geoLocationService" inject="geoLocationService";

	private function index( event, rc, prc, args={} ) {
		args.geoLocationInfo = {
			  city         = geoLocationService.getCity()
			, region       = geoLocationService.getRegion()
			, countryCode  = geoLocationService.getCountryCode()
			, continent    = geoLocationService.getContinent()
			, lat          = geoLocationService.getLat()
			, lon          = geoLocationService.getLon()
			, businessName = geoLocationService.getBusinessName()
		};
		return renderView(
			  view          = 'page-types/ip_geolocation_demo/index'
			, presideObject = 'ip_geolocation_demo'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}
}
