# Quiz House

This is a flutter application/Game. UI of this app is responsive. MVVM pattern with services and repository is used for this app. Sqlite database is used for this app.

## Components Used

- Android Studio
- Different flutter packages
  - Provider (For state management of MVVM pattern)
  - carousel_slider (For carousel with auto sliding animation)
  - percent_indicator
  - sqflite (For sqlite database)
  - email_validator (For validating email)
  - crypto (For password encryption and decryption)
  - flutter_spinkit (For Loading screen)
  - flutter_launcher_icons (For custom Launcher icon add)
- Inkscape (For creating app icon)
    
## Features of This App

- [Register](#register)
- [Login](#login)
- [Home](#home)
  - [Challenge Room](#challenge-room)
  - [Ongoing Tournament](#ongoing-tournament)
  - [BCS](#bcs)
  - [Category](#category)
- [Playing Quiz](#playing-quiz)
- [Shop](#shop)
- [App exit alert](#app-exit-alert)
- [Logout](#logout)

## Features details with screenshots

### Register

For register all possible scenario is also implemented, for example giving email in wrong format etc.

<img src="ss/register.png" width="430" height="700">


### Login 

Here 'Forgot Password' feature is not implemented

<img src="ss/login.png" width="430" height="700">

### Home

<img align="left" src="ss/home1.png" width="430" height="700">
<img src="ss/home2.png" width="430" height="700">

#### AppBar
<img src="ss/appbar.png" width="800" height="200">

#### Player Status Bar
<img src="ss/playerStatus.png" width="800" height="200">

#### Challange Room

<img align="left" src="ss/challange.png" width="430" height="700">
<img src="ss/challange2.png" width="430" height="700">

#### Ongoing Tournament
<img align="left" src="ss/home1.png" width="430" height="700">
<img src="ss/tournament.png" width="430" height="700">

#### BCS
<img align="left" src="ss/home2.png" width="430" height="700">
<img align="left" src="ss/bcs1.png" width="430" height="700">
<img src="ss/bcs2.png" width="430" height="700">

#### Category
<img align="left" src="ss/home2.png" width="430" height="700">
<img src="ss/category.png" width="430" height="700">


### Playing Quiz

All possible scenario is implemented for playing quiz. For example, when an answer is selected you can't change the answer etc. When image is part of the question, image will also show up. But for now no question have an image.

<img src="ss/play1.png" width="430" height="700">

When time run out, correct answer is shown.

<img src="ss/play2.png" width="430" height="700">

What happens when answer is incorrect?

<img src="ss/play3.png" width="430" height="700">

What happens when answer is correct?

<img src="ss/play4.png" width="430" height="700">

What happens when player accidently press back button when playing quiz?

<img src="ss/play5.png" width="430" height="700">

### Shop

<img align="left" src="ss/shop1.png" width="430" height="700">
<img align="left" src="ss/shop2.png" width="430" height="700">
<img src="ss/shop3.png" width="430" height="700">

### App exit alert

<img src="ss/exit_alert_popUp.png" width="430" height="700">

### Logout

You can Logout

