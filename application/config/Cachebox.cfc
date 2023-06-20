component extends="preside.system.config.Cachebox" {
	function configure(){
		super.configure( argumentCollection=arguments );

		// for demo purpose overwrite the ip lookup cache to have a very short timeout
		cacheBox.caches.ipLookupCache = {
			  provider   = "preside.system.coldboxModifications.cachebox.CacheProvider"
			, properties = {
				  objectDefaultTimeout           = 1
				, objectDefaultLastAccessTimeout = 0
				, useLastAccessTimeouts          = false
				, reapFrequency                  = 60
				, evictionPolicy                 = "LFU"
				, evictCount                     = 500
				, maxObjects                     = 1
				, objectStore                    = "ConcurrentStore"
			}
		};
	}
}