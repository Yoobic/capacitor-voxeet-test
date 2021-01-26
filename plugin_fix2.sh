
# fix voxeet plugin (iOS) - fix2

# Running `npx cap sync ios` will override this setting in project.pbxproj, so this fix is needed after each capacitor sync
# if ENABLE_BITCODE=NO is not set the ios build will fail when compiling voxeet plugin
echo "start fix ios"
OLD_LINE='\sGCC_PREFIX_HEADER'
NEW_LINE="ENABLE_BITCODE=NO;GCC_PREFIX_HEADER"

$(npm bin)/replace ${OLD_LINE} ${NEW_LINE} ./ios/App/Pods/Pods.xcodeproj/project.pbxproj

