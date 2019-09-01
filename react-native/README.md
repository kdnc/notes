## Basics

#### Q - Explain some of the fundamental trade offs between building with React Native and building a “true” native app.

* React Native makes sense when a team is building a product that does not need **extremely high performance**. The limitations of the asynchronous bridge are a bottleneck for things like 3D games, and games with lots of particle updates. Apps that rely on deep interactions with low-level APIs, or need large amounts of native code, might be easier to build as native apps.
* React Native makes sense **when an existing team is already proficient in JavaScript** and/or has an existing React application built on the web or another platform. The “learn once, write everywhere” ethos advocated for by Facebook is very useful when diversifying a product across platforms.

#### Q - What is the relationship between React Native and React?

* React Native is built using React. React, at its core, is a library for **“diffing” a virtual DOM and rendering this DOM to a screen** with minimal operations. React, by default, does not have an opinion about which nodes are in its virtual DOM tree. Instead, it simply has algorithms that can determine changes in the tree and re-render. React Native implements a bridge that allows the JavaScript runtime to communicate asynchronously with the native runtime. React itself provides the tree diffing and rendering infrastructure that allows React Native to work.
* React on the web provides its **own node primitives** (`<div>, <span>`, etc), which are the building blocks for web applications. But new node primitives can be defined, as React Native has done. React Native defines its own primitives (`<View>, <Image>`, etc) which do not render HTML elements but instead map to native views, like UIView and UIImageView.

---

## Getting Started

#### Q - How to setup React Native for development?

You will need Node, Watchman, the React Native command line interface, and Xcode (in order to set up the necessary tooling to build your React Native app for iOS).

1. Install Node, Watchman, JDK

    We recommend installing Node, Watchman, and JDK using Homebrew. Run the following commands in a Terminal after installing Homebrew:
    
    ```
    brew install node
    brew install watchman
    brew tap AdoptOpenJDK/openjdk
    brew cask install adoptopenjdk8
    ```
    
    If you have already installed Node on your system, make sure it is Node 8.3 or newer.
    
    Watchman is a tool by Facebook for watching changes in the filesystem. It is highly recommended you install it for better performance.
    
    If you have already installed JDK on your system, make sure it is JDK 8 or newer.

2. Install React Native CLI

    Node comes with npm, which lets you install the React Native command line interface.
    
    ```
    npm install -g react-native-cli
    ```

3. Install XCode
    
    The easiest way to install Xcode is via the Mac App Store. Installing Xcode will also install the iOS Simulator and all the necessary tools to build your iOS app.
    
    If you have already installed Xcode on your system, make sure it is version 9.4 or newer.
    
4. Install XCode Command Line Tools

    You will also need to install the Xcode Command Line Tools. Open Xcode, then choose "Preferences..." from the Xcode menu. Go to the Locations panel and install the tools by selecting the most recent version in the Command Line Tools dropdown.
    
    ![](https://facebook.github.io/react-native/docs/assets/GettingStartedXcodeCommandLineTools.png)

Reference - https://facebook.github.io/react-native/docs/getting-started

#### Q - How to create a new application?

Use the React Native command line interface to generate a new React Native project called "AwesomeProject"
```
react-native init AwesomeProject
```
You can also use a third-party CLI to init your React Native app, such as Ignite CLI.

If you want to start a new project with a specific React Native version, you can use the --version argument

```
react-native init AwesomeProject --version X.XX.X
```
```
react-native init AwesomeProject --version react-native@next
```

Reference - https://facebook.github.io/react-native/docs/getting-started

#### Q - How to run your React Native application?

Run `react-native run-ios` inside your React Native project folder
```
cd AwesomeProject
react-native run-ios
```
`react-native run-ios` is just one way to run your app. You can also run it directly from within Xcode.

Reference - https://facebook.github.io/react-native/docs/getting-started

---

## Upgrading

#### Q - How to upgrade your project to new React Native version?

Because typical React Native projects are essentially made up of an Android project, an iOS project, and a JavaScript project, upgrading can be rather tricky. Here's what you need to do to upgrade from an older version of React Native.

##### Option 1

The React Native CLI comes with `upgrade` command that provides a one-step operation to upgrade the source files with a minimum of conflicts, thanks to the rn-diff-purge project.

1. Run the upgrade command

    Run the following command to start the process of upgrading to the latest version:
    ```
    react-native upgrade
    ```
    You may specify a React Native version by passing an argument, e.g. to upgrade to 0.59.0-rc.0 run
    ```
    react-native upgrade 0.59.0-rc.0
    ```
    The project is upgraded using git apply with 3-way merge. That's why it may happen you'll need to resolve some conflicts.

2. Resolve the conflicts
    
    Conflicted files include delimiters which make very clear where the changes come from. For example
    
    ```js
     13B07F951A680F5B00A75B9A /* Release */ = {
       isa = XCBuildConfiguration;
       buildSettings = {
         ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
     <<<<<<< ours
         CODE_SIGN_IDENTITY = "iPhone Developer";
         FRAMEWORK_SEARCH_PATHS = (
           "$(inherited)",
           "$(PROJECT_DIR)/HockeySDK.embeddedframework",
           "$(PROJECT_DIR)/HockeySDK-iOS/HockeySDK.embeddedframework",
         );
     =======
         CURRENT_PROJECT_VERSION = 1;
     >>>>>>> theirs
         HEADER_SEARCH_PATHS = (
           "$(inherited)",
           /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include,
           "$(SRCROOT)/../node_modules/react-native/React/**",
           "$(SRCROOT)/../node_modules/react-native-code-push/ios/CodePush/**",
         );
    ```
    You can think of "ours" as "your team" and "theirs" as "the React Native dev team".

##### Alternative

Use this only in case the above didn't work.

1. Upgrade the `react-native` dependency

    Note the latest version of the `react-native` npm package from here (or use `npm info react-native` to check).
    
    Now install that version of `react-native` in your project with `npm install --save`

    ```
    $ npm install --save react-native@X.Y
    // where X.Y is the semantic version you are upgrading to
    npm WARN peerDependencies The peer dependency react@~R included from react-native...
    ```

    If you saw a warning about the peerDependency, also upgrade react by running:
    
    ```
    $ npm install --save react@R
    // where R is the new version of react from the peerDependency warning you saw
    ```

2. Upgrade your project templates

    The new npm package may contain updates to the files that are normally generated when you run `react-native init`, like the iOS and the Android sub-projects.

    You may consult rn-diff-purge(https://github.com/pvinis/rn-diff-purge) to see if there were changes in the project template files. In case there weren't any, simply rebuild the project and continue developing. In case of minor changes, you may update your project manually and rebuild.
    
    If there were major changes, run this in a terminal to get these
    
    ```
    $ react-native upgrade
    ```
    This will check your files against the latest template and perform the following:
    
    * If there is a new file in the template, it is simply created.
    * If a file in the template is identical to your file, it is skipped.
    * If a file is different in your project than the template, you will be prompted; you have options to keep your file or overwrite it with the template version.

##### Manual upgrade

If none of the above methods work, we could upgrade using manual steps. 

Refer React Native upgrade guide for manually upgrading.
https://react-native-community.github.io/upgrade-helper/

Reference - https://facebook.github.io/react-native/docs/upgrading

#### Q - What web application can be used to find the diff when upgrading?

React Native upgrade guide - https://react-native-community.github.io/upgrade-helper/

Reference - https://github.com/react-native-community/rn-diff-purge

---

## Third Party Libraries/ Tools

### MobileIron

#### Q - What is MobileIron?
- MobileIron is software that companies use to secure and manage business apps, documents, and other business content on mobile phones and tablets.
- MobileIron software includes an administration console for the IT department and an app that employees download onto their devices from the app store or Google Play.
- IT uses the MobileIron console to set security and management rules.
- The MobileIron app provides the IT department with information about the device and its security state.
- This includes things like carrier, country, device make and model, operating system (OS) version, phone number, and corporate email.

Reference - https://www.mobileiron.com/en/what-mobileiron
