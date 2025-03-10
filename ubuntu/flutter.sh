lts_version=3.29.1 # check here: https://docs.flutter.dev/release/archive
# Installation doc: https://docs.flutter.dev/get-started/install/linux/android

echo "\n|========= Flutter Installation (v${lts_version}) =========|\n"

# 1. Update apt-get
echo "\n1.Update apt-get:\n-------------\n"
sudo apt-get update -y && sudo apt-get upgrade -y;


# 2. Install prereqs
echo "\n2. Install needed packages (curl, git, unzip, xz-utils, zip, libglu1-mesa, clang, cmake, ninja-build, pkg-config libgtk-3-dev)-------------\n"
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
sudo apt update && sudo apt install clang cmake ninja-build pkg-config libgtk-3-dev



# 3. Install flutter dependencies
echo "\n3.Install prereqs (libc6:amd64 libstdc++6:amd64):\n(https://docs.flutter.dev/get-started/install/linux/android)\n-------------\n"
sudo apt-get install libc6:amd64 libstdc++6:amd64 lib32z1 libbz2-1.0:amd64

# 4. Download flutter installer
echo "\n4.Download flutter installer (v${lts_version}):\n-------------\n"
curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${lts_version}-stable.tar.xz -o flutter.tar.xz

# 5. Extract tar
echo "\n5.Extract tar.xz to ~/Coding/mySDKs/ \n-------------\n"
tar -xf ./flutter.tar.xz -C ~/Coding/mySDKs/

# 6. Add bin to .bashrc
echo "\n6.Update ~/.bashrc\nexport PATH=$PATH:/Coding/mySDKs/flutter/bin >> ~/.bashrc\n-------------\n"
echo 'export PATH=$PATH:/Coding/mySDKs/flutter/bin' >> ~/.bashrc

# # Also export adb
echo "NOTE: Android SDK and platform tools needs to be added to bashrc!"
echo "-------------\n"

echo 'export ANDROID_HOME=~/path/to/AndroidStudio >> ~/.bashrc'
echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME >> ~/.bashrc'
echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH  >> ~/.bashrc'

# echo 'export ANDROID_HOME=~/Coding/mySDKs/AndroidStudio' >> ~/.bashrc
# echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME'  >> ~/.bashrc
# echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH' >> ~/.bashrc

echo "-------------\n'


echo '\n7. soucre ~/.bashrc-------------\n'
source ~/.bashrc

echo '-------------\n'
echo 'Flutter v${lts_version} installed!.Run flutter --version and flutter doctor to test' 


