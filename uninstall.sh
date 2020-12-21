#!/usr/bin/env bash

# Show trace if option -o is used
if [[ $1 == "-o" ]]; then
    set -o xtrace
fi

# Warns user to run the script as root
if [ "$EUID" -ne 0 ]; then
    echo "⚠️  Please run as root."
    exit 1
fi

xcode_contents_dir="/Applications/Xcode.app/Contents"

# Remove the IDE Plugin from the plug-ins directory
rm -rf $plugins_dir/LaTeX.ideplugin

# Remove the language specification from the specs directory
spec_dir="${xcode_contents_dir}/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications"
rm $spec_dir/LaTeX.xclangspec

# Remove the source code language plist from the metadata directory
metadata_dir="${xcode_contents_dir}/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata"
rm $metadata_dir/Xcode.SourceCodeLanguage.LaTeX.plist

# Remove the xctemplate file from the project templates directory
project_templates_dir=~/Library/Developer/Xcode/Templates/Project\ Templates/LaTeX
rm -rf "$project_templates_dir/LaTeX Document.xctemplate"

# Remove the xctemplate file from the file templates directory
file_templates_dir=~/Library/Developer/Xcode/Templates/File\ Templates/LaTeX
rm -rf "$file_templates_dir/LaTeX File.xctemplate"

echo "LaTeX-for-Xcode is now uninstalled..."
