LineageOS 14.1 device configuration for [ZTE Open C / Kis 3](https://hackurx.wordpress.com/2018/11/20/lineageos-14-1-pour-le-zte-open-c-kis-3/).

Build dependencies installation
-------------------------------

Tested for Debian Version 9 (stretch) 64-bit.
Packages installation:

    dpkg --add-architecture i386 ; apt-get update
    apt-get build-dep gcc binutils llvm-defaults
    apt-get install gcc-arm-none-eabi cmake python-dev swig ant bc proguard maven-debian-helper libemma-java libasm4-java libguava-java libnb-platform18-java libnb-org-openide-util-java libandroidsdk-ddmlib-java libmaven-source-plugin-java libfreemarker-java libmaven-javadoc-plugin-java ca-cacert curl gawk libgmp3-dev libmpfr-dev libmpc-dev git-core gperf libncurses-dev squashfs-tools pngcrush zip zlib1g-dev lzma libc6-dev-i386 g++-multilib lib32z1-dev lib32readline-dev lib32ncurses5-dev zlib1g-dev:i386 xsltproc python-mako schedtool gradle dirmngr libandroidsdk-sdklib-java eclipse-jdt libgradle-android-plugin-java android-sdk-build-tools android-sdk-platform-23 aapt lzop rsync python-dev imagemagick

And the package installation from the contrib repository:

    apt-get install repo

How to build:
-------------

Create a clean folder and work in it:

    mkdir ~/LineageOS
    cd ~/LineageOS

Inform git if this has never been done (To be done only once):

    git config --global user.name "Your Name"
    git config --global user.email "you@example.com"

Initialize repo:

    repo init -u git://github.com/LineageOS/android.git -b cm-14.1
    curl --create-dirs -L -o .repo/local_manifests/manifest_zte_kis3.xml -O -L https://raw.githubusercontent.com/HacKurx/android_local_manifest/cm-14.1/manifest_zte_kis3.xml
    repo sync -j20

Compile:

    . build/envsetup.sh
    brunch kis3

It might be necessary to increase the xmx for java compilation of Jack (see https://stackoverflow.com/questions/35579646/android-source-code-compile-error-try-increasing-heap-size-with-java-option) :

    export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"

How to update:
--------------

As soon as changes have been made by you or in LineageOS :

    cd ~/LineageOS
    . build/envsetup.sh
    repo sync -j20 --force-sync
    brunch kis3

How to add modifications :
--------------------------

Add the changes that are not my git :

    cd ~/LineageOS
    patch -Np1 --no-backup-if-mismatch < device/zte/kis3/Add_my_modifications_without_fork.patch

Edit your files and save your changes :

    repo diff > your_modification.patch
