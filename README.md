# Xcode syntax highlighting for LaTeX

This adds syntax highlighting for LaTeX source files to Xcode.

## Supported Xcode Versions

This version works for Xcode 11.

This plugin won't be supported by future version of Xcode because it "will only attempt to load an .ideplugin if its Info.plist contains a UUID that matches the DVTPlugInCompatibilityUUID value in the Xcode's Info.plist. This UUID changes with each version of Xcode, so plugin authors need to keep adding UUIDs for each new Xcode that's released", README of [stencil-xclangspec](https://github.com/RobotsAndPencils/stencil-xclangspec) said. The key directories can also change in the furture, as has been the case in the past. So, when a new version will be released, the project should be updated and each user will have to install again the project.

## Installation

The key directories changed across the latest version of Xcode, so the installation may not work after an update. Please file an issue or make a pull request if it stops working in a new version.

### Easy installation

The fasted way to install is to run `setup.sh` file as root. To do so, go into the directory where the repository has been downloaded and run the following command in your terminal :

```
sudo ./setup.sh
```

Once the setup script has finished, restart Xcode and click "Load bundle" when an alert shows about LaTeX.ideplugin.

### Manual installation

On Xcode 11, you have to :

- Copy the `LaTeX.ideplugin` directory to `~/Library/Developer/Xcode/Plug-ins/` :
```
 cp -r GraphQL.ideplugin ~/Library/Developer/Xcode/Plug-ins/
```

- Copy the `LaTeX.xclangspec` file to `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications` :
```
 sudo cp GraphQL.xclangspec /Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications
```

- Copy the `Xcode.SourceCodeLanguage.LaTeX.plist` file to `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata` :
```
 sudo cp GraphQL.xclangspec /Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata
```

Then, restart Xcode and click "Load bundle" when an alert shows about LaTeX.ideplugin.

## Resources

Here are all the resources which helps me to create this project :

- A similar [project](https://github.com/apollographql/xcode-graphql) for GraphQL is the starting-point of the project.
- [Another one](https://github.com/RobotsAndPencils/stencil-xclangspec) helps me to write "Supported Xcode Versions" section.
- All the built-in `xclangspec` files which are at `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications`.
