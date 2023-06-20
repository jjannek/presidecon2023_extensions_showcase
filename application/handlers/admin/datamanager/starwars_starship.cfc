component {

	property name="starwarsDataService" inject="starwarsDataService";

	private string function postRenderListing( event, rc, prc, args={} ) {

		var hyperdriveRatingByStarshipChart = newChart( "line" )
			.setShowLegend( false )
			.fromQuery(
				  query       = starwarsDataService.getHyperdriveRatingByStarship()
				, labelColumn = "name"
				, datasets    = [ { label="Rating", column="hyperdrive_rating" } ]
			);

		return '<h2>Starship Hyperdrive Rating Comparison</h2>#renderChart( hyperdriveRatingByStarshipChart )#';
	}

}