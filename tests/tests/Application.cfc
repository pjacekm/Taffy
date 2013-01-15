﻿<cfcomponent>

<cfset this.name = 'Taffy_testSuite' />
<cfset this.mappings['/resources']			= '#expandPath(replaceNoCase(cgi.script_name,'/tests/index.cfm',''))#/resources' />
<cfset this.mappings['/resourcesError']	= '#expandPath(replaceNoCase(cgi.script_name,'/tests/index.cfm',''))#/resourcesError' />


<cffunction name="onRequestStart" returnType="void" access="public" output="false">
	<cfif NOT isDefined('application._taffy')>
		<cfset local.apiRootURL	= getDirectoryFromPath(cgi.script_name) />
		<cfset local.apiRootURL	= listDeleteAt(local.apiRootURL,listLen(local.apiRootURL,'/'),'/') />

		<cfhttp method="GET" url="http://#CGI.SERVER_NAME#:#CGI.SERVER_PORT##local.apiRootURL#/index.cfm" />
	</cfif>
</cffunction>

</cfcomponent>