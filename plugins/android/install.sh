#!/bin/sh
source $dotfiles/common.lib
source $dotfiles/plugins/android/path.zsh

ANDROID_STUDIO_VERSION="3.1"

# sdkmanager only work with java8
export JAVA_HOME=$JAVA8_HOME

required_apps=("java8" "android-sdk" "android-studio")

android_studio_preferences_path="$HOME/Library/Preferences/AndroidStudio${ANDROID_STUDIO_VERSION}"
android_studio_plugins_path="$HOME/Library/Application Support/AndroidStudio${ANDROID_STUDIO_VERSION}"

copy_android_studio_preferences() {
   # Install Android Studio custom settings
   info "Copying Android Studio Preferences..."
   local android_studio_custom="$dotfiles/plugins/android/AndroidStudioSettings"

   if [ ! -d ${android_studio_preferences_path} ]; then
       mkdir $android_studio_preferences_path
   fi
   
   # Setting up $ANDROID_HOME to preferences
   local setting_files=("jdk.table.xml" "project.default.xml")

   for file in "${setting_files[@]}"; do
       cp -f $android_studio_custom/options/${file}.sample $android_studio_custom/options/${file}
       sed -i '' "s|\$ANDROID_HOME|${ANDROID_HOME}|g" "$android_studio_custom/options/$file"
   done

   cp -R $android_studio_custom/* $android_studio_preferences_path 
   success "Installed Android Studio Preferences"
}

copy_android_studio_plugins() {
    # Install Android Studio plugins
    info "Installing Android Studio Plugins..."
    local android_studio_custom="$dotfiles/plugins/android/AndroidStudioPlugins"

    if [ ! -d "${android_studio_plugins_path}" ]; then
	mkdir "${android_studio_plugins_path}"
    fi

    cp -Rf $android_studio_custom/* "${android_studio_plugins_path}"
    success "Installed Android Studio Plugins"
}

install() {
   for app in "${required_apps[@]}"; do
        if [ ! "$(brew cask list | grep $app)" ]; then
            info "Installing ${app}..."
            brew cask install $app
        fi
    done
    
    # reexport JAVA_HOME
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/"$(cd /Library/Java/JavaVirtualMachines; ls | grep jdk1.8)"/Contents/Home
    
    # Install sdk package to ANDROID_HOME path
    while read package
    do 
        info "Installing ${package}..."
        sdkmanager "${package}" --sdk_root="${ANDROID_HOME}"
    done < $dotfiles/plugins/android/sdk_packages.txt

    copy_android_studio_preferences
    copy_android_studio_plugins

    success "Installed and customized Android Studio $ANDROID_STUDIO_VERSION"  
}

update() {
    for app in "@{required_apps[@]}"; do
        if [ "$(brew cask outdated | grep $app)" ]; then
            info "Updating ${app}..."
            brew cask upgrade $app
        fi
    done

   info "Updating Android SDK..."
   sdkmanager --update --sdk_root="$ANDROID_HOME"

   copy_android_studio_preferences
   copy_android_studio_plugins

   success "Updated Android SDK and Studio"
}

uninstall() {
    info "Uninstalling Android SDK..."
    while read package
    do
        info "Uninstalling ${package}..."
        sdkmanager --uninstall "${package}" --sdk_root="$ANDROID_HOME"
    done < $dotfiles/modudles/android/sdk_packages.txt

    for app in "${required_apps[@]}"; do
        info "Uninstalling ${app}..."
        brew cask uninstall --force $app
    done

    rm -rf $android_studio_preferences_path
    rm -rf "$android_studio_plugins_path"
    
    success "Uninstalled Android SDK - Android Studio."
}

if [ "$#" == "0" -o "$1" == "--install" ]; then
    install
elif [ "$1" == "--update" ]; then
    update
elif [ "$1" == "--uninstall" ]; then
    uninstall
fi
