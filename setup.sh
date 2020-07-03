#!/usr/bin/env bash

#This file is based on https://github.com/apollographql/xcode-graphql/blob/main/setup.sh

# Show trace if option -o is used
if [[ $1 == "-o" ]]; then
    set -o xtrace
fi

# Warns user to run the script as root
if [ "$EUID" -ne 0 ]; then
    echo "⚠️  Please run as root."
    exit
fi

xcode_contents_dir=$(dirname "$(xcode-select -p)")

# Create plug-ins directory if it doesn't exist
plugins_dir=~/Library/Developer/Xcode/Plug-ins/
if [ ! -d "$plugins_dir" ]; then
    mkdir $plugins_dir
fi

# Copy the IDE Plugin to the plug-ins directory
cp -r LaTeX.ideplugin $plugins_dir

# Create Specifications directory if it doesn't exist
spec_dir="${xcode_contents_dir}/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications"
if [ ! -d "$spec_dir" ]; then
    mkdir $spec_dir
fi

# Copy the language specification to the specs directory
cp LaTeX.xclangspec $spec_dir

# Create the language metadata directory if it doesn't exist
metadata_dir="${xcode_contents_dir}/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata"
if [ ! -d "$metadata_dir" ]; then
    mkdir $metadata_dir
fi

# Copy the source code language plist to the metadata directory
cp Xcode.SourceCodeLanguage.LaTeX.plist $metadata_dir

echo 'Xcode syntax highlighting for LaTeX is now ready 🥳 Please restart Xcode and click "Load bundle" when an alert shows about LaTeX.ideplugin.'
