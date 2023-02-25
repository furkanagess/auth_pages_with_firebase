# Authentication Pages With Using Firebase

- After integrating the 'flutter_base_project' => https://github.com/furkanagess/flutter_base_project into your project, this project includes the must-have Authentication pages of a mobile application. 
- Authentication pages are the pages where the application introduction, registration, and login processes are provided when you first use an application and this project includes ***Onboard***, ***Login***, ***Signup***, and ***Forgot Password*** sections. 
- **The images, icons, and colors used in the pages are my preferences. After completing the necessary steps, you can change them as you wish.** 

# Entegration Steps
  - 1-) Integrate 'flutter_base_project' into your project => https://github.com/furkanagess/flutter_base_project
  - 2-) Develop the Onboard Pages.
  - 3-) Setup Firebase Authentication.
  - 4-) Login Firebase Authentication.
  - 5-) Signup Firebase Authentication.
  - 6-) Forgot Password Authentication.
  - 7-) Develop Auth Streamer.
  - 8-) Develop the Home Page.

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
  
# Onboard   
  - The Onboard Page, also known as the App Intro Page, is a screen that appears when a user opens a mobile app for the first time. It provides an introduction to the app and its features, and may include a series of screens with text, images, and animations that guide the user through the app's functionality. The purpose of the Onboard Page is to familiarize the user with the app's interface and help them get started with using it.
  ----
  - Circles That Dynamically Change Depending on Page Transition with Mobx State Management (***The sample code is below.***)


  ![viewModel (3)](https://user-images.githubusercontent.com/92018394/221279873-d68d23df-c2d5-4592-a76c-9a0789f5e1bb.png)
  
# Firebase Setup 
  - Firstly,
  
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

