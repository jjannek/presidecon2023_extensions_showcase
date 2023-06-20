<cfscript>
	records = args.records ?: queryNew( "" );
</cfscript>
<cfoutput>
	<cfif records.recordCount>
		<ol>
			<cfloop query="records">
				<li><a href="#records.uri#" target="_blank">#records.uri#</a> <span class="badge">#records.page_visit_count#</span></li>
			</cfloop>
		</ol>
	<cfelse>
		no tracked pages found
	</cfif>
</cfoutput>