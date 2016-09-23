#! /bin/bash

# Copyright 2016, Sandvine Incorporated.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

build_yum_repo_yukon()
{

	YUKON_SVNDA="5.20.0018"

	YUKON_SVTSE="1.00.0041"

	YUKON_SVTCPA="5.40.0052"

	YUKON_SVPTS="7.30.0518"
	YUKON_SVPTS_EXPERIMENTAL="7.40.0123.pts_tse_dev_integration"

	YUKON_SVPROTOCOLS="16.09.2211"

	YUKON_SVSDE="7.50.0132"

	YUKON_SVSPB="6.65.0078"
	YUKON_SVSPB_EXPERIMENTAL="7.00.0044"

	YUKON_SVNDS="6.65.0005"

	YUKON_SVUM="5.20.0306"

	YUKON_SVSM_C6="7.50.0006"
	YUKON_SVSM_C7="7.50-0006"


	#
	# NA stuff
	#

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=svnda --version=$YUKON_SVNDA --latest



	#
	# TSE stuff
	#

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=svtse --version=$YUKON_SVTSE --latest


	#
	# TCP Accelerator stuff
	#

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=svtcpa --version=$YUKON_SVTCPA --latest


	#
	# PTS stuff
	#

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=svpts --version=$YUKON_SVPTS --latest
	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=svprotocols --version=$YUKON_SVPROTOCOLS --latest

	# Usage Management PTS

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=svusagemanagementpts --version=$YUKON_SVUM --latest


	# Experimental

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svpts --version=$YUKON_SVPTS --latest
	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svprotocols --version=$YUKON_SVPROTOCOLS --latest

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svusagemanagementpts --version=$YUKON_SVUM --latest

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=svpts --version=$YUKON_SVPTS_EXPERIMENTAL --latest-of-serie
	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svpts --version=$YUKON_SVPTS_EXPERIMENTAL --latest-of-serie


	#
	# SDE stuff
	#

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=svsde --version=$YUKON_SVSDE --latest
	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svsde --version=$YUKON_SVSDE --latest

	# Usage Management

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=svusagemanagement --version=$YUKON_SVUM --latest
	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svusagemanagement --version=$YUKON_SVUM --latest

	# Subscriber Mapping

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svsubscribermapping --version=$YUKON_SVSM_C6 --latest
	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos7 --product=subscriber_mapping --version=$YUKON_SVSM_C7 --latest


	#
	# SPB stuff
	#

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svspb --version=$YUKON_SVSPB --latest

	# NDS

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svreports --version=$YUKON_SVNDS --latest


	# Experimental

	./yum-repo-builder.sh --release-code-name=yukon --release=dev --base-os=centos6 --product=svspb --version=$YUKON_SVSPB_EXPERIMENTAL --latest-of-serie

}
