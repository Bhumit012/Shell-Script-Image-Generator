# Script-ImageGenerator

The process of generating code with scripts to streamline and automate the process involves creating and using shell scripts in a project. Here are the steps to get started:

## Getting started

Creating Scripts

Create a shell script with a .sh file extension (such as "/scripts/AddPSImages.sh"). This script generates images from the assets folder into SwiftUI and UIKit images.

Add the script to the root of the project. There is no need to import it into the project files in Xcode.

In the Xcode target, add the script in the "Build Phase" by adding a "run script" section through the "+" button.

In the "run script" section, add the path to the script, starting with $SRCROOT (which refers to the root of the project).

To use the scripts:

Go to the ProgrammaticImages.swift file and remove all of the code (this is where the code will be generated).

Build the project to automatically add all of the images to the file.

To update the file, add or remove images from the asset folder and build the project again.

By using this process, the library will be maintained and the storage will be optimized by reducing unnecessary images and highlighting images that are not in use by the app. This is just a small example using images, but the same process can be applied to colors and other resources.
