## Created with Capacitor Create

This app was created using the `npx @capacitor/cli create` command, and comes with a very
minimal shell for building an app.

Note: unless you know what you're doing, we don't recommend using the `create` way of building an app. Instead, you'll
likely want to create an app using your framework's tooling (such as `create-react-app`), and then *add* capacitor
to *that* project (using `npx @capacitor/cli init`).

### Running this example

To run the provided example, can use serve command:

```bash
npx cap serve
```


### Capacitor - Voxeet Bug 1

To reproduce the capacitor sync issue run the following : 

```bash
npm i
npx cap sync ios
```

this will fail with the following error : 

```bash
✔ Copying web assets from www to ios/App/public in 12.25ms
✔ Copying native bridge in 1.36ms
✔ Copying capacitor.config.json in 1.43ms
  Found 1 Cordova plugin for ios
    cordova-plugin-voxeet (1.4.6)
✔ copy in 73.33ms
✔ Updating iOS plugins in 9.10ms
  Found 0 Capacitor plugins for ios:
✖ update ios: ENOENT: no such file or directory, stat '/Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/cordova-plugin-voxeet/src/ios/Carthage/Build/iOS/VoxeetUXKit.framework'
[error] Error: ENOENT: no such file or directory, stat '/Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/cordova-plugin-voxeet/src/ios/Carthage/Build/iOS/VoxeetUXKit.framework'
    at Object.statSync (fs.js:1086:3)
    at Object.statSync (/Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/graceful-fs/polyfills.js:308:16)
    at Object.copySync (/Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/fs-extra/lib/copy-sync/copy-sync.js:31:86)
    at /Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/@capacitor/cli/dist/ios/update.js:315:22
    at Array.map (<anonymous>)
    at /Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/@capacitor/cli/dist/ios/update.js:313:20
    at Array.map (<anonymous>)
    at copyPluginsNativeFiles (/Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/@capacitor/cli/dist/ios/update.js:259:20)
    at Object.updateIOS (/Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/@capacitor/cli/dist/ios/update.js:27:9)
    at async /Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/@capacitor/cli/dist/tasks/update.js:65:13 {
  errno: -2,
  syscall: 'stat',
  code: 'ENOENT',
  path: '/Users/gabriel/DEV/CORDOVA-DEV/capacitor-voxeet-test/node_modules/cordova-plugin-voxeet/src/ios/Carthage/Build/iOS/VoxeetUXKit.framework'
}
```

this can be fixed by running script `./plugin_fix1.sh` before `npx cap sync ios`

### Capacitor - Voxeet Bug 2

To reproduce the build issue run the following : 

```bash
npm i
./plugin_fix1.sh
npx cap sync ios
npx cap open ios
```

- In App.xcodeproj change the Team and App identifier to be able to run on a device
- Build and run on a ios device connected to your laptop 


this will fail with the following error in XCode: 

```bash
ld: warning: Could not find or use auto-linked framework 'VoxeetSDK'
ld: warning: Could not find or use auto-linked framework 'VoxeetUXKit'
ld: warning: Could not find or use auto-linked framework 'WebRTC'
Undefined symbols for architecture arm64:
  "_OBJC_CLASS_$__TtC9VoxeetSDK13VTJoinOptions", referenced from:
      objc-class-ref in CDVVoxeet.o
  "_OBJC_CLASS_$__TtC9VoxeetSDK19VTConferenceOptions", referenced from:
      objc-class-ref in CDVVoxeet.o
  "_OBJC_CLASS_$__TtC9VoxeetSDK17VTParticipantInfo", referenced from:
      objc-class-ref in CDVVoxeet.o
  "_OBJC_CLASS_$__TtC11VoxeetUXKit11VoxeetUXKit", referenced from:
      objc-class-ref in CDVVoxeet.o
  "_OBJC_CLASS_$__TtC9VoxeetSDK9VoxeetSDK", referenced from:
      objc-class-ref in CDVVoxeet.o
ld: symbol(s) not found for architecture arm64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

to fix this issue run `./plugin-fix2.sh` after the sync: 


```bash
npm i
./plugin_fix1.sh
npx cap sync ios
./plugin_fix2.sh
npx cap open ios
```


### Capacitor - Voxeet Bug 3

To fix both previous issues reproduce this build issue run the following : 

```bash
npm i
./plugin_fix1.sh
npx cap sync ios
./plugin_fix2.sh
npx cap open ios
```

- In App.xcodeproj change the Team and App identifier to be able to run on a device
- Build and run on a ios device connected to your laptop 


this will fail with the following error in XCode: 

```bash
ld: warning: Could not find or use auto-linked framework 'VoxeetSDK'
ld: warning: Could not find or use auto-linked framework 'VoxeetUXKit'
ld: warning: Could not find or use auto-linked framework 'WebRTC'
Undefined symbols for architecture arm64:
  "_OBJC_CLASS_$__TtC9VoxeetSDK13VTJoinOptions", referenced from:
      objc-class-ref in CDVVoxeet.o
  "_OBJC_CLASS_$__TtC9VoxeetSDK19VTConferenceOptions", referenced from:
      objc-class-ref in CDVVoxeet.o
  "_OBJC_CLASS_$__TtC9VoxeetSDK17VTParticipantInfo", referenced from:
      objc-class-ref in CDVVoxeet.o
  "_OBJC_CLASS_$__TtC11VoxeetUXKit11VoxeetUXKit", referenced from:
      objc-class-ref in CDVVoxeet.o
  "_OBJC_CLASS_$__TtC9VoxeetSDK9VoxeetSDK", referenced from:
      objc-class-ref in CDVVoxeet.o
ld: symbol(s) not found for architecture arm64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

to fix both issues you can build with the following steps : 


```bash
npm i
./plugin_fix1.sh
npx cap sync ios
./plugin_fix2.sh
npx cap open ios
```