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


# The idea is to mirror any repository, in a new architecture, by just passing
# the required values as arguments, for example:


yum_repo_builder()
{

case "$BASE_OS" in

	centos6)
		BASE_OS="RHEL6-x64"
		OS_DIR="6"
		;;

	centos7)
		BASE_OS="RHEL7-x64"
		OS_DIR="7"
		;;

	*)
                echo
                echo "Usage: $0 --base-os={centos6|centos7}"
                exit 1
                ;;

esac


case "$PRODUCT" in

	svcontrol-center)

		PROD_DIR="CONTROL_CENTER"
		;;

	svnda)

		PROD_DIR="NA"
		;;

	svtcpa)

		PROD_DIR="TCPA"
		;;

	svtse)

		PROD_DIR="SVTSE"
		;;

	svpts)

		PROD_DIR="SVPTS"
		;;

	svprotocols)

		PROD_DIR="PTSD_PROTOCOLS"
		;;

	svspb)

		PROD_DIR="SPB"
		;;

	svsde)

		PROD_DIR="SDE"
		;;

	svusagemanagement)

		PROD_DIR="USAGE_MANAGEMENT"
		;;

	svusagemanagementpts)

		PROD_DIR="USAGE_MANAGEMENT_PTS"
		;;

	svmcdtext)

		PROD_DIR="MCDTEXT"
		;;

	svreports)

		PROD_DIR="NDS"
		;;

	svsubscribermapping)

		PROD_DIR="SUBSCRIBER_MAPPING"
		;;

	subscriber_mapping)

		PROD_DIR="RPM_COMMON/SUBSCRIBER_MAPPING"
		;;

	*)
		echo
		echo "You must select a product to mirror..."
		exit 1
		;;

esac


MAJOR_VERSION=`echo $VERSION | cut -d \. -f 1`
MINOR_VERSION=`echo $VERSION | cut -d \. -f 2`
BUILD_VERSION=`echo $VERSION | cut -d \. -f 3`


# SPB repo subdir < 6.65 doesn't have "-LNX-" on its name.
if [ "$PRODUCT" == "svspb" ] && [ "$MAJOR_VERSION" -le "6" ] && [ "$MINOR_VERSION" -le 60 ]
then
	FULL_NAME="$PRODUCT-$VERSION"
else
	FULL_NAME="$PRODUCT-$PLATFORM-$VERSION"
fi

if [ "$PRODUCT" == "svreports" ]
then
	FULL_NAME="$PRODUCT-$VERSION"
fi

if [ "$PRODUCT" == "svcontrol-center" ]
then
	FULL_NAME="$PRODUCT-$VERSION"
fi

# TSE repo have an different exension, dealing with it.
if [ "$PRODUCT" == "svtse" ]
then
	FULL_NAME="$PRODUCT-$PLATFORM-$VERSION.pts_tse_dev_integration"
fi

# TCP Accelerator repo have an different exension, dealing with it.
if [ "$PRODUCT" == "svtcpa" ]
then
	FULL_NAME="tcp_accelerator-$PLATFORM-$VERSION.tcp_540_svcommon"
fi


SHORT_NAME="$PRODUCT-$VERSION"

SHORT_VERSION=`echo $VERSION |sed 's/.\{5\}$//'`

VER_DOT=`echo $VERSION | sed 's/\-/\./'`

SVAUTO_MAIN_REPO_PATH="$DOCUMENT_ROOT/centos/$RELEASE_CODE_NAME/$OS_DIR/os/x86_64"

REPOS_PATH="$DOCUMENT_ROOT/centos/$RELEASE_CODE_NAME/$OS_DIR/svrepos/x86_64"

FULL_PATH="$DOCUMENT_ROOT/centos/$RELEASE_CODE_NAME/$OS_DIR/svrepos/x86_64/$SHORT_NAME"


mkdir -p $SVAUTO_MAIN_REPO_PATH/Packages

mkdir -p $FULL_PATH/Packages


# If subscriber_mapping on CentOS 7, the subdirectory and the RPM package
# location are different.
if [ "$PRODUCT" == "subscriber_mapping" ]
then
	wget -c -P $FULL_PATH/Packages ftp://$SV_YUM_HOST/images/Linux/$BASE_OS/$PROD_DIR/$SHORT_NAME*el7.x86_64.rpm
else
	wget -c -P $FULL_PATH/Packages ftp://$SV_YUM_HOST/images/Linux/$BASE_OS/$PROD_DIR/$FULL_NAME/*.rpm
fi


if [ "$PRODUCT" == "subscriber_mapping" ]
then
	mv $REPOS_PATH/$SHORT_NAME $REPOS_PATH/svsubscribermapping-$VER_DOT
	PRODUCT="svsubscribermapping"
	SHORT_NAME="$PRODUCT-$VER_DOT"
fi


rm -f $FULL_PATH/Packages/nginx*


if [ "$PRODUCT" == "svpts" ]
then

	rm -f $FULL_PATH/Packages/dpdk*

fi


if [ "$PRODUCT" == "svnda" ]
then

	rm -f $FULL_PATH/Packages/postgresql93*

fi


#createrepo $SVAUTO_MAIN_REPO_PATH

createrepo $FULL_PATH


if [ "$LATEST_OF_SERIE" == "yes" ]
then
	pushd $REPOS_PATH

	[ -L "$PRODUCT-$SHORT_VERSION" ] && rm -f "$PRODUCT-$SHORT_VERSION"
	ln -sf $SHORT_NAME $PRODUCT-$SHORT_VERSION

	popd
fi


if [ "$LATEST" == "yes" ]
then
	pushd $REPOS_PATH

	[ -L "$PRODUCT-$SHORT_VERSION" ] && rm -f "$PRODUCT-$SHORT_VERSION"
	ln -sf $SHORT_NAME $PRODUCT-$SHORT_VERSION

	[ -L "$PRODUCT" ] && rm -f "$PRODUCT"
	ln -sf $PRODUCT-$SHORT_VERSION $PRODUCT

	popd
fi

}
