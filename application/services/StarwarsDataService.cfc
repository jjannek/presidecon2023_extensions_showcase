/**
* @singleton      true
* @presideService true
*/
component {

	public any function init() {
		return this;
	}

	public query function getSpeciesDistribution() {
		return $getPresideObjectService().selectData(
			  objectName   = "starwars_species"
			, selectFields = [ "name as species_name", "count(distinct people.id) as people_count" ]
			, groupby      = "name"
			, having       = "count(distinct people.id) > 1"
		);
	}

	public query function getAverageResidentsHeightByPlanets() {
		return $getPresideObjectService().selectData(
			  objectName   = "starwars_planet"
			, selectFields = [ "name as planet_name", "avg(residents.height) as avg_residents_height" ]
			, filter       = "concat('',residents.height * 1) = residents.height"
			, groupby      = "name"
			, having       = "avg(residents.height) > 0"
			, orderBy      = "avg_residents_height desc"
			, maxRows      = 10
		);
	}

	public struct function getAppearanceCountByFilmAndSpecies() {
		var result = { filmTitles=[], speciesNames=[], data={} };

		var q = $getPresideObjectService().selectData(
			  objectName   = "starwars_film"
			, selectFields = [ "title as film_title", "characters$species.name as species_name", "count(characters.id) as character_count" ]
			, filter       = "characters$species.name in ( 'Droid', 'Ewok', 'Gungan', 'Human', 'Hutt', 'Mon Calamari', 'Wookiee', 'Yoda\'s species', 'Rodian' )"
			, groupby      = "title, characters$species.name"
			, having       = "count(characters.id) > 0"
			, orderBy      = "release_date, count(characters.id) desc"
		);

		var helperMap = {};

		for ( var record in q ) {
			if ( !arrayFindNoCase( result.filmTitles, record.film_title ) ) {
				arrayAppend( result.filmTitles, record.film_title );
			}
			if ( !arrayFindNoCase( result.speciesNames, record.species_name ) ) {
				arrayAppend( result.speciesNames, record.species_name );
			}
			if ( !structKeyExists( result.data, record.species_name ) ) {
				result.data[ record.species_name ] = [];
			}
			helperMap[ record.film_title ][ record.species_name ] = record.character_count;
		}

		arraySort( result.speciesNames, "textnocase" );

		for ( var speciesName in result.speciesNames ) {
			for ( var filmTitle in result.filmTitles ) {
				if ( isNumeric( helperMap[ filmTitle ][ speciesName ] ?: "" ) ) {
					arrayAppend( result.data[ speciesName ], helperMap[ filmTitle ][ speciesName ] ?: 0 );
				}
			}
		}

		return result;
	}

	public query function getHyperdriveRatingByStarship() {
		return $getPresideObjectService().selectData(
			  objectName   = "starwars_starship"
			, selectFields = [ "name", "hyperdrive_rating" ]
			, filter       = "concat('',hyperdrive_rating * 1) = hyperdrive_rating"
			, orderBy      = "hyperdrive_rating desc"
			, maxRows      = 20
		);
	}
}