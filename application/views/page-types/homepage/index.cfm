<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />

<cfoutput>
	<h1>#args.title#</h1>

	#args.main_content#
</cfoutput>