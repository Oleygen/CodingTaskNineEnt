# CodingTaskNineEnt

## Submission Notes

* Run `pod install` from project dir and launch NineTestApp.xcworkspace
* In the project implemented simple example of MVVM architecture, using self-written Box class for data binding. All parts are located in appropriate virtual folders (Views, ViewModels, Model)

### 3rd party libraries
* SDWebImage has been used for async loading and caching images. 
* Quicktype.io has been used for autogenerating mapping object

 ### Unit Tests 
* testFileName checks is file with stub data exists in a project
* testMapping checks do we mapping data correctly

### UI Tests
* testFailFifthElementWithoutScroll search for 5th cell and should fail in a case we do not scroll collection
* testScrollToFifthElement search for 5th cell and should pass, because of swipe actions
* testSegueOnTap checks segue after tap by searching ProgressView element, which is located only on WebView screen

### Additional features:
*  I've add basic error handling in a case data fetch fails
*  ActivityIndicator for fetch processing
*  ProgressView for WebView content loading

