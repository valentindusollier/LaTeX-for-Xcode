# LaTeX language support for Xcode

This adds syntax highlighting for LaTeX source files and basic templates to Xcode.

## Usage

Create a Xcode Project, go to macOS tab and select LaTeX Document. Build the project to compile the Tex file, the output will be showed in the Xcode PDF Viewer.

## Supported Xcode Versions

This version works with Xcode 11.

This plugin won't be supported by future versions of Xcode because it "will only attempt to load an .ideplugin if its Info.plist contains a UUID that matches the DVTPlugInCompatibilityUUID value in the Xcode's Info.plist. This UUID changes with each version of Xcode, so plugin authors need to keep adding UUIDs for each new Xcode that's released", README of [stencil-xclangspec](https://github.com/RobotsAndPencils/stencil-xclangspec) said. The key directories can also change in the future, as has been the case in the past. So, when a new version will be released, the project should be updated and each user will have to install again the project.

## Installation

The key directories changed across the latest versions of Xcode, so the installation may not work after an update. Please file an issue or make a pull request if it stops working in a new version.

### Easy installation

The fasted way to install is to run `setup.sh` file as root. To do so, go into the directory where the repository has been downloaded and run the following command in your terminal :

```
sudo ./setup.sh
```

Once the setup script has finished, restart Xcode and click "Load bundle" when an alert shows about LaTeX.ideplugin.

### Manual installation

On Xcode 11, you have to :

- Copy the `LaTeX.ideplugin` directory to `~/Library/Developer/Xcode/Plug-ins/` (if the directory doesn't exist, create it) :
```
 sudo cp -r LaTeX.ideplugin ~/Library/Developer/Xcode/Plug-ins/
```

- Copy the `LaTeX.xclangspec` file to `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications` :
```
 sudo cp LaTeX.xclangspec /Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications
```

- Copy the `Xcode.SourceCodeLanguage.LaTeX.plist` file to `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata` :
```
 sudo cp Xcode.SourceCodeLanguage.LaTeX.plist /Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata
```

- Copy the `LaTeX Document.xctemplate` directory to `~/Library/Developer/Xcode/Templates/Project Templates/LaTeX`  (if the directory doesn't exist, create it) :
```
 sudo cp -r LaTeX\ Document.xctemplate ~/Library/Developer/Xcode/Templates/Project\ Templates/LaTeX
```

- Copy the `LaTeX File.xctemplate` directory to `~/Library/Developer/Xcode/Templates/File Templates/LaTeX`  (if the directory doesn't exist, create it) :
```
 sudo cp -r LaTeX\ File.xctemplate ~/Library/Developer/Xcode/Templates/File\ Templates/LaTeX
```

Then, restart Xcode and click "Load bundle" when an alert shows about LaTeX.ideplugin.

## Resources

Here are all the resources which helped me to create this project :

- A similar [project](https://github.com/apollographql/xcode-graphql) for GraphQL was the starting-point of the project.
- [Another one](https://github.com/RobotsAndPencils/stencil-xclangspec) helped me to write "Supported Xcode Versions" section.
- [Tex with Xcode 4/5](http://math.huji.ac.il/~piz/Site/TeX%20%26%20XCode%205.html)
- All the built-in `xclangspec` files which are at `/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications`.
