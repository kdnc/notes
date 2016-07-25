# GWT-2.8.0-SNAPSHOT SuperDevMode in Jetbrains IDEA - Exception in GWT ResourceAccumulatorManager after saving file

<br />

## Table of Contents
**[Problem](#problem)** 			
**[Solution](#solution)** 			
**[References](#references)** 				

## Problem

I have tested again the current state of the SuperDevMode in Jetbrains IDEA (Version: 2016.1) The SuperDevMode seems to work in general but it takes very long until the CodeServer is started (1:30min).
But this is not maybe biggest problem. After the SuperDevMode/CodeServer is started each time when I
change and save a file in IDEA an exception occurs in the CodeServer:
    
	java.nio.file.NoSuchFileException: U:\ALL\dev\tc\_trunk\apps\aris\aris\common\server-remote-api\src\main\java\com\aris\modeling\common\serverremoteapi\cscommon\corearisdesigner\om\impl\ADesignerObjOcc.java___jb_old___

    at sun.nio.fs.WindowsException.translateToIOException(WindowsException.java:79)

    at sun.nio.fs.WindowsException.rethrowAsIOException(WindowsException.java:97)

    at sun.nio.fs.WindowsException.rethrowAsIOException(WindowsException.java:102)

    at sun.nio.fs.WindowsFileSystemProvider.isHidden(WindowsFileSystemProvider.java:466)

    at java.nio.file.Files.isHidden(Files.java:1483)

    at com.google.gwt.dev.resource.impl.ResourceAccumulator.onNewPath(ResourceAccumulator.java:138)

    at com.google.gwt.dev.resource.impl.ResourceAccumulator.refresh(ResourceAccumulator.java:127)

    at com.google.gwt.dev.resource.impl.ResourceAccumulator.refreshResources(ResourceAccumulator.java:65)

    at com.google.gwt.dev.resource.impl.ResourceAccumulatorManager.refreshResources(ResourceAccumulatorManager.java:128)

    at com.google.gwt.dev.resource.impl.ResourceAccumulatorManager$1.run(ResourceAccumulatorManager.java:91)



After this exception recompiling the modle doesn't work anymore. So I have to restart the CodeServer which takes again 1:30min.
    
## Solution

___jb_old___ files are temporary files created by IntelliJ when safe write is enabled. 

As a workaround disable safe write in following place.

Settings -> Appearance & Behavior -> System Settings -> Use "safe write"

## References

- [https://groups.google.com/forum/m/#!topic/google-web-toolkit/CNqNRmPATx8](https://groups.google.com/forum/m/#!topic/google-web-toolkit/CNqNRmPATx8)