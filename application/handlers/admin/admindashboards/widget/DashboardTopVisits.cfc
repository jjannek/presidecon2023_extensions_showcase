component extends="preside.system.base.AdminHandler" {

	private string function render( event, rc, prc, args={} ) {
		
		args.records = getPresideObject( "website_user_action" ).selectData(
			  selectFields = [ "uri", "count(id) as page_visit_count" ]
			, groupBy      = "uri"
			, orderBy      = "count(id) desc"
			, maxrows      = 10
		);

		return renderView( view="admin/admindashboards/widget/dashboardTopVisits/index", args=args );
	}

	private boolean function isUserDashboardWidget( event, rc, prc, args={} ) {
		return true;
	}
}