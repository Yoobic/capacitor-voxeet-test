# fix voxeet plugin (iOS) - fix1
# install missing frameworks on ios builds (only compatible with)
PLUGIN_DIR=node_modules/cordova-plugin-voxeet
if [ ! -f "${PLUGIN_DIR}/src/ios/Carthage/Build/iOS/SDWebImage.framework/Info.plist" ]; then
    chmod +x ${PLUGIN_DIR}/carthage.sh
    ${PLUGIN_DIR}/carthage.sh update --platform ios --no-use-binaries --project-directory ${PLUGIN_DIR}/src/ios 
fi