#!/bin/bash

# Set the path of the asset folder
assetFolder="$SRCROOT/Script-Generated-Code/Assets.xcassets"

# Set the path to the destination folder
destinationFolder="$SRCROOT/imageGenerated"

# Set the name of the swift file to store the programmatic images
swiftFile="ProgrammaticImages.swift"

setFunction=false

# Create the destination folder if it doesn't exist
if [ ! -d "$destinationFolder" ]; then
  mkdir "$destinationFolder"
fi

# Create the swift file if it doesn't exist
if [ ! -f "$destinationFolder/$swiftFile" ]; then
  touch "$destinationFolder/$swiftFile"
fi

# Check if struct Images already exists in the file
if ! grep -q "struct PSImages" "$destinationFolder/$swiftFile"; then
setFunction=true
# Add struct to swift file
# Add import statement to swift file
echo "import UIKit" >> "$destinationFolder/$swiftFile"
echo -e "import SwiftUI \n" >> "$destinationFolder/$swiftFile"

echo "struct PSImages {" >> "$destinationFolder/$swiftFile"

fi

# Loop through the images in the asset folder
for file in "$assetFolder"/*
do
    # Extract the file name and remove the file extension
    fileName=$(basename "$file" | cut -f 1 -d '.')

  # Check if the image already exists in the file
    if ! grep -q "let $fileName" "$destinationFolder/$swiftFile"; then
    # Create the SwiftUI image variable and add it to the swift file
    echo '   static let '$fileName'_Swift = Image(systemName: "'$fileName'")' >> "$destinationFolder/$swiftFile"

    # Create the UIKit image variable and add it to the swift file
    echo '   static let '$fileName'_UIKit = UIImage(named: "'$fileName'")' >> "$destinationFolder/$swiftFile"
    fi
done

# Check if struct Images already exists in the file
if  [ $setFunction = true ]; then
  echo "}" >> "$destinationFolder/$swiftFile"
fi

echo "All images have been processed and added to struct Images in $swiftFile in the destination folder"
