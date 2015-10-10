TVML, Google App Engine, and Go

This sample shows how TVML elements can be served from a Google App Engine app
that uses the Go runtime. The TVML app is written with Objective-C and a minimal 
amount of Javascript that is served from App Engine.

The TVML pages and graphical assets are taken from Apple's TVMLCatalog sample
app and are the property of Apple, Inc. See the APPLE.txt file for more details
about that.

Everything else was created by me and is released into the public domain
for coding purposes and under the CC BY-NC-SA 4.0
(http://creativecommons.org/licenses/by-nc-sa/4.0/) for instructional materials.

Tim Burks
Palo Alto, CA

TO GET STARTED

1. Install the latest Google App Engine SDK for Go and an appropriate version of Xcode.

2. In the "site" directory, type "goapp serve" to start the server.

3. Run the TV app in the Xcode project.

TO GO BIG

4. Register a new app on Google App Engine.

5. Update the app id in site/app.yaml and site/main.go (near the bottom).

6. Set BASE_URL in AppDelegate.m to point to your new app.

7. Deploy your app by running "goapp serve" from the "site" directory.

8. Run the TV app on your Apple TV!

