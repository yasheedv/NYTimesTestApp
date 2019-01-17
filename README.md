# NYTimesTestApp

A simple app to hit the NY Times Most Popular Articles API and show a list of articles, that shows details when items on the list are tapped (a typical master/detail app). 

We'll be using the most viewed section of this API.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?api-key=sample-key

For testing this API, we used 
* all-sections for the section path component in the URL
* 7 for period

#Xcode - Version 10.1

#Language - Swift 4.2

## Overview

Covers the following
  * MVC design patter
  * Unit Tests
  * UI Tests
  * Scripts using Fastlane
      * Build the project from command-line
      * Run static code analysis
      * Run unit tests and code coverage

You can change the API details from Constants.swift

## Tools & Libraries used
  * [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects.
  * [Alamofire](https://github.com/Alamofire/Alamofire) - Alamofire is an HTTP networking library written in Swift.
  * [fastlane](https://github.com/fastlane/fastlane) - fastlane is an open source platform aimed at simplifying Android and iOS deployment
  * [SwiftLint](https://github.com/realm/SwiftLint) -  A tool to enforce Swift style and conventions.
  * [Scan](https://docs.fastlane.tools/actions/scan/) - The easiest way to run tests of your iOS and Mac app
  * [Slather](https://github.com/SlatherOrg/slathert) - Generate test coverage reports for Xcode projects 
  
## Installation
  Simply clone the project and run. If the build fails because of dependencies, please do pod install.
  You can build the project by using command + B or Product -> Build.
  You can run the project by using command + R or Product -> Run
  
## Fastlane Script Usage  
  ### Fastlane
  Fastlane is integrated to achieve the following tasks  
  * Building project from command-line
  * Run static code analysis
  * Run unit tests and code coverage
 
 #### Installation
 * Install fastlane using  *gem install fastlane*
 * For unit tests and code coverage 
    * Install scan using *gem install scan*
    * Install slather using *gem install slather*
 
 ### Usage
#### Building the project
  1. Update the fastfile using your Apple developer account details
      * Open fastfile located at ../fastlane/Fastfile
      * Update the value of *USER_NAME = "your username"* with your developer account user name    
        Eg:- *USER_NAME = "abc@apple.com"*
      * Update the value of *CODE_SIGNING_AUTHORITY = "Your team name and team Id"*  
        Eg:- *CODE_SIGNING_AUTHORITY = "iPhone Distribution: My Tech Team (URJ******)*"

  2. Executing fastlane build command
      * Open terminal
      * Go to the project directory
      * Run command *fastlane development*
      * Project will start building now.
      * After successful execution you can find the NYTimes.ipa in *../BUILD/* folder

#### Run static code analysis
* Open terminal
* Go to the project directory
* Run command *fastlane lint*
* After successful execution you can find the result in *../fastlane/linting_output/* folder
    
#### Run unit tests and code coverage
* Open terminal
* Go to the project directory
* Run command *fastlane tests*
* After successful execution the reports in the following location
   * Test Report - *../fastlane/test_output/report.html*
   * Code coverage report - *../fastlane/test_output/code_coverage/index.html*

## Code coverage report

<kbd >
<img src="https://i.postimg.cc/3RWKL5hB/Screen-Shot-2019-01-17-at-2-55-54-PM.png">
</kbd>

## Unit test report

<kbd >
<img src="https://i.postimg.cc/y6cN2K9Q/Screen-Shot-2019-01-17-at-2-56-16-PM.png">
</kbd>

