<cf_presideparam name="args.title"         field="page.title"        editable="true" />
<cf_presideparam name="args.main_content"  field="page.main_content" editable="true" />

<cfscript>
	speciesDistributionChart = newChart( "doughnut" )
		.setLegendPosition( "right" )
		.fromQuery(
			  query       = args.speciesDistribution
			, labelColumn = "species_name"
			, datasets    = [ { label="Counts", column="people_count" } ]
		);

	averageResidentsHeightByPlanetsChart = newChart( "bar" )
		.setColourMode( "datapoint" )
		.setShowLegend( false )
		.fromQuery(
			  query       = args.averageResidentsHeightByPlanets
			, labelColumn = "planet_name"
			, datasets    = [ { label="Average resident's height", column="avg_residents_height" } ]
		);
	
	appearanceCountByFilmAndSpeciesChart = newChart( "bar" )
		.setStacked( true )
		.setLegendPosition( "right" )
		.setLabels( args.appearanceCountByFilmAndSpecies.filmTitles );

	for ( speciesName in args.appearanceCountByFilmAndSpecies.speciesNames ) {
		appearanceCountByFilmAndSpeciesChart.addDataset( label=speciesName, data=args.appearanceCountByFilmAndSpecies.data[ speciesName ] );
	}

	hyperdriveRatingByStarshipChart = newChart( "line" )
		.setShowLegend( false )
		.fromQuery(
			  query       = args.hyperdriveRatingByStarship
			, labelColumn = "name"
			, datasets    = [ { label="Rating", column="hyperdrive_rating" } ]
		);

</cfscript>

<cfoutput>
	<h1>#args.title#</h1>
	#args.main_content#

	<h2>Species Distribution (more than 1)</h2>
	#renderChart( speciesDistributionChart )#
	<h2>Top 10 Average Residents Height By Planets</h2>
	#renderChart( averageResidentsHeightByPlanetsChart )#
	<h2>Appearance Count by Film and Species</h2>
	#renderChart( appearanceCountByFilmAndSpeciesChart )#
	<h2>Starship Hyperdrive Rating Comparison</h2>
	#renderChart( hyperdriveRatingByStarshipChart )#
</cfoutput>