component extends="preside.system.config.Config" {

// CORE COLDBOX CONFIGURE METHOD(S)
	public void function configure() {
		_loadCorePresideConfig();
		_setupCommonSettings();
		_setupRicheditor();
		_setupFeatures();

		// Launcher Extension
		settings.launcher.objectDatasources = [ "starwars_character", "starwars_film", "starwars_planet", "starwars_species", "starwars_starship", "starwars_vehicle" ];

		// Content Dependency Tracker
		settings.contentDependencyTracker = settings.contentDependencyTracker ?: {};

		settings.contentDependencyTracker.autoTrackRelatedObjects = true;

		settings.contentDependencyTracker.trackObjects = settings.contentDependencyTracker.trackObjects ?: {};

		settings.contentDependencyTracker.trackObjects.starwars_dictionary.enabled = true;
		settings.contentDependencyTracker.trackObjects.starwars_character.enabled  = true;
		settings.contentDependencyTracker.trackObjects.starwars_film.enabled       = true;
		settings.contentDependencyTracker.trackObjects.starwars_planet.enabled     = true;
		settings.contentDependencyTracker.trackObjects.starwars_species.enabled    = true;
		settings.contentDependencyTracker.trackObjects.starwars_starship.enabled   = true;
		settings.contentDependencyTracker.trackObjects.starwars_vehicle.enabled    = true;

		settings.enum.dependencyTrackerObjectNames = settings.enum.dependencyTrackerObjectNames ?: [];
		arrayAppend( settings.enum.dependencyTrackerObjectNames, [ "starwars_dictionary", "starwars_character", "starwars_film", "starwars_planet", "starwars_species", "starwars_starship", "starwars_vehicle" ], true );

		// Content Lib
		settings.admin.topNavItems = settings.admin.topNavItems ?: [];
		settings.admin.topNavItems.append( "contentLibrary" );
		
		settings.adminMenuItems.contentLibrary = {
			  buildLinkArgs = { objectName="content_library_content" }
			, activeChecks  = { datamanagerObject=[ "content_library_content", "content_library_conditional_alternative" ] }
			, title         = "admin.menuitem:contentLibrary.title"
			, icon          = "fa-align-left"
		};
	}

	public void function local() {
		super.local();
		settings.features.oneClickLocalLogin.enabled = true;
		coldbox.handlerCaching                       = false;
	}

// HELPERS
	private void function _loadCorePresideConfig() {
		super.configure();
	}

	private void function _setupCommonSettings() {
		settings.preside_admin_path = "admin";
		settings.system_users       = "sysadmin";
		settings.default_locale     = "en";
		settings.default_log_name   = "presidecon2023";
		settings.default_log_level  = "information";
		settings.sql_log_name       = "presidecon2023";
		settings.sql_log_level      = "information";
	}

	private void function _setupRicheditor() {
		settings.ckeditor.defaults.stylesheets.append( "css-bootstrap" );
		settings.ckeditor.defaults.stylesheets.append( "css-layout" );
	}

	private void function _setupFeatures() {
		settings.features.formbuilder.enabled              = false;
		settings.features.websiteUsers.enabled             = true;
		settings.features.multilingual.enabled             = false;
		settings.features.dataexport.enabled               = true;
		settings.features.apiManager.enabled               = false;
		settings.features.restTokenAuth.enabled            = false;

		settings.features.fullPageCaching.enabled          = false;
		settings.features.assetQueue.enabled               = false;
		settings.features.queryCachePerObject.enabled      = false;

		settings.features.dumpLogs.enabled                 = true;
		settings.features.reverseLocalhostIpLookup.enabled = true;
	}
}