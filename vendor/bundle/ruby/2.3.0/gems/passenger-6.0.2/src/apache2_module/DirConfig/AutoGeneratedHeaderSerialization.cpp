/*
 *  Phusion Passenger - https://www.phusionpassenger.com/
 *  Copyright (c) 2010-2018 Phusion Holding B.V.
 *
 *  "Passenger", "Phusion Passenger" and "Union Station" are registered
 *  trademarks of Phusion Holding B.V.
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */
#ifndef _PASSENGER_APACHE2_MODULE_AUTOGENERATED_HEADER_SERIALIZATION_CPP_
#define _PASSENGER_APACHE2_MODULE_AUTOGENERATED_HEADER_SERIALIZATION_CPP_

#ifdef INTELLISENSE
	// These includes do nothing, but keep IntelliSense happy.
	#include <ap_config.h>
	#include <string>
	#include "../Config.h"
#endif

namespace Passenger {
namespace Apache2Module {

/*
 * DirConfig/AutoGeneratedHeaderSerialization.cpp is automatically generated from
 * DirConfig/AutoGeneratedHeaderSerialization.cpp.cxxcodebuilder,
 * using definitions from src/ruby_supportlib/phusion_passenger/apache2/config_options.rb.
 * Edits to DirConfig/AutoGeneratedHeaderSerialization.cpp will be lost.
 *
 * To update DirConfig/AutoGeneratedHeaderSerialization.cpp:
 *   rake apache2
 *
 * To force regeneration of DirConfig/AutoGeneratedHeaderSerialization.cpp:
 *   rm -f src/apache2_module/DirConfig/AutoGeneratedHeaderSerialization.cpp
 *   rake src/apache2_module/DirConfig/AutoGeneratedHeaderSerialization.cpp
 */

static void
constructRequestHeaders_autoGenerated(request_rec *r, DirConfig *config, std::string &result) {
	addHeader(result, StaticString("!~PASSENGER_APP_ENV",
			sizeof("!~PASSENGER_APP_ENV") - 1),
		config->mAppEnv);
	addHeader(result, StaticString("!~PASSENGER_APP_GROUP_NAME",
			sizeof("!~PASSENGER_APP_GROUP_NAME") - 1),
		config->mAppGroupName);
	addHeader(result, StaticString("!~PASSENGER_APP_LOG_FILE",
			sizeof("!~PASSENGER_APP_LOG_FILE") - 1),
		config->mAppLogFile);
	addHeader(r, result, StaticString("!~PASSENGER_FORCE_MAX_CONCURRENT_REQUESTS_PER_PROCESS",
			sizeof("!~PASSENGER_FORCE_MAX_CONCURRENT_REQUESTS_PER_PROCESS") - 1),
		config->mForceMaxConcurrentRequestsPerProcess);
	addHeader(result, StaticString("!~PASSENGER_FRIENDLY_ERROR_PAGES",
			sizeof("!~PASSENGER_FRIENDLY_ERROR_PAGES") - 1),
		config->mFriendlyErrorPages);
	addHeader(result, StaticString("!~PASSENGER_GROUP",
			sizeof("!~PASSENGER_GROUP") - 1),
		config->mGroup);
	addHeader(result, StaticString("!~PASSENGER_LOAD_SHELL_ENVVARS",
			sizeof("!~PASSENGER_LOAD_SHELL_ENVVARS") - 1),
		config->mLoadShellEnvvars);
	addHeader(r, result, StaticString("!~PASSENGER_LVE_MIN_UID",
			sizeof("!~PASSENGER_LVE_MIN_UID") - 1),
		config->mLveMinUid);
	addHeader(r, result, StaticString("!~PASSENGER_MAX_PRELOADER_IDLE_TIME",
			sizeof("!~PASSENGER_MAX_PRELOADER_IDLE_TIME") - 1),
		config->mMaxPreloaderIdleTime);
	addHeader(r, result, StaticString("!~PASSENGER_MAX_REQUEST_QUEUE_SIZE",
			sizeof("!~PASSENGER_MAX_REQUEST_QUEUE_SIZE") - 1),
		config->mMaxRequestQueueSize);
	addHeader(r, result, StaticString("!~PASSENGER_MAX_REQUESTS",
			sizeof("!~PASSENGER_MAX_REQUESTS") - 1),
		config->mMaxRequests);
	addHeader(result, StaticString("!~PASSENGER_METEOR_APP_SETTINGS",
			sizeof("!~PASSENGER_METEOR_APP_SETTINGS") - 1),
		config->mMeteorAppSettings);
	addHeader(r, result, StaticString("!~PASSENGER_MIN_PROCESSES",
			sizeof("!~PASSENGER_MIN_PROCESSES") - 1),
		config->mMinInstances);
	addHeader(result, StaticString("!~PASSENGER_NODEJS",
			sizeof("!~PASSENGER_NODEJS") - 1),
		config->mNodejs);
	addHeader(result, StaticString("!~PASSENGER_PYTHON",
			sizeof("!~PASSENGER_PYTHON") - 1),
		config->mPython);
	addHeader(result, StaticString("!~PASSENGER_RESTART_DIR",
			sizeof("!~PASSENGER_RESTART_DIR") - 1),
		config->mRestartDir);
	addHeader(result, StaticString("!~PASSENGER_RUBY",
			sizeof("!~PASSENGER_RUBY") - 1),
		config->mRuby.empty() ? serverConfig.defaultRuby : config->mRuby);
	addHeader(result, StaticString("!~PASSENGER_SPAWN_METHOD",
			sizeof("!~PASSENGER_SPAWN_METHOD") - 1),
		config->mSpawnMethod);
	addHeader(r, result, StaticString("!~PASSENGER_START_TIMEOUT",
			sizeof("!~PASSENGER_START_TIMEOUT") - 1),
		config->mStartTimeout);
	addHeader(result, StaticString("!~PASSENGER_STARTUP_FILE",
			sizeof("!~PASSENGER_STARTUP_FILE") - 1),
		config->mStartupFile);
	addHeader(result, StaticString("!~PASSENGER_STICKY_SESSIONS",
			sizeof("!~PASSENGER_STICKY_SESSIONS") - 1),
		config->mStickySessions);
	addHeader(result, StaticString("!~PASSENGER_STICKY_SESSIONS_COOKIE_NAME",
			sizeof("!~PASSENGER_STICKY_SESSIONS_COOKIE_NAME") - 1),
		config->mStickySessionsCookieName);
	addHeader(result, StaticString("!~PASSENGER_USER",
			sizeof("!~PASSENGER_USER") - 1),
		config->mUser);
}


} // namespace Apache2Module
} // namespace Passenger

#endif /* _PASSENGER_APACHE2_MODULE_AUTOGENERATED_HEADER_SERIALIZATION_CPP_ */
