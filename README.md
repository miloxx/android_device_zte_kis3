TWRP 9.0 device configuration for [ZTE Kis 3]

Build dependencies installation
-------------------------------

Tested for Debian Version 9 (stretch) 64-bit.
Packages installation:

    dpkg --add-architecture i386 ; apt-get update
    apt-get build-dep gcc binutils llvm-defaults
    sudo apt-get install gcc-arm-none-eabi cmake python-dev swig ant bc proguard maven-debian-helper libemma-java libasm4-java libguava-java libnb-platform18-java libnb-org-openide-util-java libandroidsdk-ddmlib-java libmaven-source-plugin-java libfreemarker-java libmaven-javadoc-plugin-java ca-cacert curl gawk libgmp3-dev libmpfr-dev libmpc-dev git-core gperf libncurses-dev squashfs-tools pngcrush zip zlib1g-dev lzma libc6-dev-i386 g++-multilib lib32z1-dev lib32readline-dev lib32ncurses5-dev zlib1g-dev:i386 xsltproc python-mako schedtool gradle dirmngr libandroidsdk-sdklib-java eclipse-jdt libgradle-android-plugin-java android-sdk-build-tools android-sdk-platform-23 aapt lzop rsync python-dev imagemagick

And the package installation from the contrib repository:

    sudo apt-get install repo

How to build:
-------------

Create a clean folder and work in it:

    mkdir ~/android/twrp
    cd ~/android/twrp

Inform git if this has never been done (To be done only once):

    git config --global user.name "Your Name"
    git config --global user.email "you@example.com"

Initialize repo:

    repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0
    curl --create-dirs -L -o .repo/local_manifests/manifest_zte_kis3.xml -O -L https://raw.githubusercontent.com/miloxx/android_local_manifest/twrp/manifest_zte_kis3.xml
    repo sync -j20

Compile:

    cd <source-dir>; export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch lineage_kis3-userdebug; mka recoveryimage

It might be necessary to increase the xmx for java compilation of Jack (see https://stackoverflow.com/questions/35579646/android-source-code-compile-error-try-increasing-heap-size-with-java-option) :

    export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"
