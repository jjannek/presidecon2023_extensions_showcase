component {

	property name="starwarsDataService" inject="starwarsDataService";

	private function index( event, rc, prc, args={} ) {
		
		args.speciesDistribution             = starwarsDataService.getSpeciesDistribution();
		args.averageResidentsHeightByPlanets = starwarsDataService.getAverageResidentsHeightByPlanets();
		args.appearanceCountByFilmAndSpecies = starwarsDataService.getAppearanceCountByFilmAndSpecies();
		args.hyperdriveRatingByStarship      = starwarsDataService.getHyperdriveRatingByStarship();

		return renderView(
			  view          = 'page-types/chart_samples/index'
			, presideObject = 'chart_samples'
			, id            = event.getCurrentPageId()
			, args          = args
		);
	}
}
