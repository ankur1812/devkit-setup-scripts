## Android Studio Setup for Linux (Ubuntu based distros)


## 1. Install the application's tar/zip file
Download it from the [official site](https://developer.android.com/)

#### (Optional) Update the ~/.bashrc
The location of extracted folder (destination of its /bin folder) can be added to `.bashrc` to allow opening Android Studio directly from terminal 
```
nano ~/.bashrc


## Add below line:
# export PATH=$PATH:~/path/to/extractedfolder___/android-studio/bin


## Then source the bashrc to run the "studio" command directly from the terminal
# source ~/.bashrc
```
```
studio
```

#### (Optional) Create a shortcut command to run directly
You can also create a symbolic link to run the app directly using `android-studio` command. 
```
sudo ln -s ~/path/to/extractedfolder___/android-studio/bin/studio /usr/local/bin/android-studio
```
```
android-studio
```


## 2. Run the "/bin/studio" executable to download the needed packages
Either through the explorer or through terminal (`studio` or `android-studio` command)
These include the Android Debug Bridge (adb), Cmdline-tools, platform tools, Emulator, etc.

The Cmdline tools might be missing from the default installtion options. They can be downloaded later by going to
`Android Studio (IDE) > tools > SDK Manager > Language & Frameworks > Android SDK > SDK Tools`

## 3. Add the CLI tools to ~/.bashrc 
The Studio tools like adb, cmdline tools, emulators need to be added to bashrc!

```
nano ~/.bashrc"
```
Now Add below lines to upadte the PATH / env variables"

```
export PATH=$PATH:~/MyApps/android-studio/bin  #  Location of Android Studio ZIP download (extracted)

export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
```

Then source the rc file again.

```
source ~/.bashrc
```

Test if the sdk tools are added to the bash. Try running the adb command it should work now!
```
$ adb devices
List of devices attached
```
**Note:** In case the adb fails to detect android devices connected through usb, check the steps [here](https://github.com/ankur1812/Flutter-React-Native-Scripts?tab=readme-ov-file#12-fix-failing-device-connections)


