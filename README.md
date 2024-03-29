# Authentication Pages With Using Firebase

- Authentication pages are essential for a mobile application. In this project, I have created these pages using Firebase technology. I have developed Onboard, Login, Signup, and Forgot Password pages as Authentication Pages. 
- You can customize the texts, icons, images, and colors in this project according to your preferences. Additionally, you will be able to change the theme and language of the application on the Home Page. (***DARK-LIGT MODE & TURKISH-ENGLISH Support***)
- After integrating the 'flutter_base_project' => https://github.com/furkanagess/flutter_base_project into your project, this project includes the must-have Authentication pages of a mobile application. 
# Entegration Steps
  - 1-) Integrate 'flutter_base_project' into your project => https://github.com/furkanagess/flutter_base_project
  - 2-) Develop the Onboard Pages.
  - 3-) Setup Firebase Authentication.
  - 4-) Login Firebase Authentication.
  - 5-) Signup Firebase Authentication.
  - 6-) Forgot Password Authentication.
  - 7-) Develop Auth Streamer.
  - 8-) Develop the Home Page.
  - 9-) Dark Mode
  - 10-) Localization (EN-TR)

# Libraries and Technologies
  - Flutter Base Project => https://github.com/furkanagess/flutter_base_project
    - mobx => https://pub.dev/packages/mobx
    - flutter_mobx => https://pub.dev/packages/flutter_mobx
    - provider => https://pub.dev/packages/provider
    - mobx_codegen => https://pub.dev/packages/mobx_codegen
    - build_runner => https://pub.dev/packages/build_runner
    - easy_localization => https://pub.dev/packages/easy_localization 
    - shared_preferences => https://pub.dev/packages/shared_preferences
    - dio => https://pub.dev/packages/dio
    - json_serializable => https://pub.dev/packages/json_serializable
    
  - Firebase Authentication
    - firebase_auth => https://pub.dev/packages/firebase_auth
    - firebase_core => https://pub.dev/packages/firebase_core
    - cloud_firestore => https://pub.dev/packages/cloud_firestore
   
  - User Interface Utilites
    - flutter_svg => https://pub.dev/packages/flutter_svg
    - auto_size_text => https://pub.dev/packages/auto_size_text
    - quickalert => https://pub.dev/packages/quickalert
    
# Application Preview


https://user-images.githubusercontent.com/92018394/221650058-f385f687-1fa0-4ebd-b51f-bf606f36092d.mp4


    
# Light Mode (EN)    
![Adsız tasarım (6)](https://user-images.githubusercontent.com/92018394/221647040-d643f0ec-a127-47c4-88b6-970d9bec16bd.png)

# Dark Mode (TR)
![dark (1)](https://user-images.githubusercontent.com/92018394/221648795-127e412c-2408-4b2c-8c93-65fef589d08f.png)


  
# Onboard   
  - The Onboard Page, also known as the App Intro Page, is a screen that appears when a user opens a mobile app for the first time. It provides an introduction to the app and its features, and may include a series of screens with text, images, and animations that guide the user through the app's functionality. The purpose of the Onboard Page is to familiarize the user with the app's interface and help them get started with using it.
  ----
  - Circles That Dynamically Change Depending on Page Transition with Mobx State Management (***The sample code is below.***)


  ![viewModel (3)](https://user-images.githubusercontent.com/92018394/221279873-d68d23df-c2d5-4592-a76c-9a0789f5e1bb.png)
  
# Firebase Setup 
- 1-) Go to https://console.firebase.google.com/u/0/ and add project then give it a name for project. (Disable Google Analytics)
- 2-) When you access to home page click the Android Icon and enter your "android package name" (android/app/build.gradle) => defaultConfig
- 3-) Download the google-services.json add to (android/app) 
- 4-) Copy and Paste build.gradle configurations on your project file
- 5-) Add the firebase_core library to pubspec.yaml
- 6-) Change the main method like the sample below
- ![main](https://user-images.githubusercontent.com/92018394/221779346-4bfe946b-5d5a-4e83-9b14-57367b8da7f7.png)

## Login Page
   - The Login Page in mobile apps is the screen where the user enters their credentials, such as a username and password, to access the app's features and data that are restricted to authenticated users. 
       -----------
       - Firebase Entegration for Login Page with FirebaseAuthentication (***The sample code is below.***)
     ![viewModel (4)](https://user-images.githubusercontent.com/92018394/221283457-ff5d36cb-65f2-436e-b634-a128134eeafa.png)
       ---------
       - Password Visibility Control with Mobx State Management. (***The sample code is below.***)
       ![viewModel (5)](https://user-images.githubusercontent.com/92018394/221350825-918e0105-715c-47a1-98d1-6f4debde1893.png)
       ![viewModel (6)](https://user-images.githubusercontent.com/92018394/221368429-4fe3ae27-c1fc-40de-a33f-15114a71dbc9.png)

       
## Signup Page  
   - A signup page in a mobile app is a screen that allows users to create a new account or register for the app. The signup page usually collects information such as the user's name, email address, and password.
     ----------
     - Firebase Entegration for Signup Page with FirebaseAuthentication (***The sample code is below.***)
       ![viewModel (7)](https://user-images.githubusercontent.com/92018394/221368547-67a2a478-7519-4c24-9de3-dda75ff6d9e0.png)
       
## Forgot Password Page
   - A forgot password page in a mobile app is a screen that allows users to reset their password if they have forgotten it. This screen is typically accessed from the login page, where users are prompted to enter their email address or username and password to access the app.
     --------
     - Firebase Entegration for Forgot Password Page with FirebaseAuthentication (***The sample code is below.***)
       ![forgotPassword](https://user-images.githubusercontent.com/92018394/221368736-eba47076-c492-4b5b-8d13-eae98b1924e9.png)
       
## Authentication Streamer
   - When a user logs in or signs up for an app using Firebase Authentication, a series of authentication events are triggered, such as "user signed in" or "user signed out." The authentication streamer allows developers to create a stream that listens for these events and responds accordingly. For example, if a user signs out of the app, the authentication streamer can listen for the "user signed out" event and redirect the user back to the login screen. Or, if a user signs in successfully, the authentication streamer can trigger an action to load the user's data and preferences from the app's backend server.
     ------
     - (***The sample code is below.***)
       ![viewModel (8)](https://user-images.githubusercontent.com/92018394/221441563-cbbf3bc0-0c7a-4790-9cee-edd50163bdde.png)
       
## Dark Mode   
  - We first define two different enums named 'dark' and 'light' to hold theme values. We use these enums to change theme values. We use the 'themeNotifier' class to control the changes in these values. We change the theme values using the 'changeValue' function. We achieve the change between dark and light modes using the 'changeTheme' function.
   ------
   - (***The sample code is below.***)
    
     ![mode](https://user-images.githubusercontent.com/92018394/221653004-401c51cb-c6aa-4bf8-be37-565e639c2fa0.png)
     
## Language Support (Localization) 
  - Localization for mobile apps refers to the process of adapting an app's content to fit different languages and regions. The goal of localization is to make the app more accessible and engaging for users in different countries or regions.
  - To provide localization, we create two separate folders named 'en-US.json' and 'tr-TR.json'. After making any changes in these folders, we need to run 'scripts/lang.sh' in the terminal. Using Provider state management, we activate these languages in the main.dart folder.
   ------
   - (***The sample code is below.***)
    ![local](https://user-images.githubusercontent.com/92018394/221654224-379b74b0-9c8e-41e2-a6ea-fc3e78f5b9ee.png)




