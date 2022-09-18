function open_release() {
    open "build/app/outputs/bundle/release"
}

function open_with_android_studio() {
    open -a "/Applications/Android\ Studio.app" "$1"
}
