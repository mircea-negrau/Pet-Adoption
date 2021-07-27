# Pet Adoption

## Overview
- [1. Login](#login) 
- [2. Drawer](#drawer) 
- [3. Main View](#main-view) 
- [3.1 Adoption Page](#adoption-page) 
- [3.2 Pet Page](#pet-page)
- [3.3 Add Pet Page](#add-pet-page)  
- [3.4 Favorites Page](#favorites-page)  

### Login 
<img align="right" width="153" height="272" src="https://user-images.githubusercontent.com/74305289/127175775-35631c80-ca42-4534-9cd7-6dab00104d15.png">

  - [X] Firestore Authentication API
  - [X] Email login
  - [X] Google login using API
  - [ ] Facebook login 
  - [X] User remembered until signed out
  - [X] Automatic account creation for Google login
  - [ ] Email sign up 
  - [ ] Forgot password 
  - [X] Animated icon 
  - [X] Login form

https://user-images.githubusercontent.com/74305289/127185075-3310678e-0b0d-4648-b419-9aa363b211f8.mp4

### Drawer 
<img align="right" width="153" height="272" src="https://user-images.githubusercontent.com/74305289/127180670-8e287507-53dc-4164-8e54-2e0e11bc7ba4.png">

  - [X] User profile displayed
  - [X] Main View docked to the right
  - [X] Main View changing on selection
  - [X] Adoption page
  - [ ] Donation page
  - [X] Add pet page
  - [X] Favorites page
  - [ ] Messages page
  - [ ] Profile page 
  - [ ] Settings page
  - [X] Log out 

https://user-images.githubusercontent.com/74305289/127183982-da73c989-c7dd-4572-82c8-01cbf2163839.mp4

### Main View

<img align="right" width="153" height="272" src="https://user-images.githubusercontent.com/74305289/127182044-c0cc95d2-cd88-4533-a133-1abe73d9b72e.png">

Top Navigation Bar:
  - [X] Drawer button
  - [X] Geolocation automatically detected (City & Country) using Geolocator and Geocoder APIs
  - [X] Shimmer shown until Geolocation is fetched
  - [X] Popup Menu on User Avatar (Profile / Log out)

Body:
  - [X] According to the active page

https://user-images.githubusercontent.com/74305289/127184451-eaf62ebf-1f71-430f-a8d5-ca544e61df06.mp4

### Adoption Page

<img align="right" width="153" height="272" src="https://user-images.githubusercontent.com/74305289/127185715-eb4d814b-49ae-4441-82a2-f93a6b93edf5.png">

- [X] Show all pets
- [X] Pet Cards showing name, gender, breed, species, age 
- [ ] Pet Cards showing distance to current user
- [ ] Search bar
- [X] Pet Page opening on Pet Card tap
- [X] Pet details are neatly transitioned to their position upon tap using Hero widgets
- [X] Manual pets refresh by pull down
- [X] Filter by species (default is all)
- [X] Hide filter

https://user-images.githubusercontent.com/74305289/127186508-56a50746-defc-4c4e-afd2-95972c6fec44.mp4

### Pet Page

<img align="right" width="153" height="272" src="https://user-images.githubusercontent.com/74305289/127186958-f2f0b788-7294-4c71-80a9-4050c00287ba.png">

- [X] Animal picture 
- [X] Animal details (name, gender, breed, species, age and location)
- [X] Owner details (name, profile picture)
- [ ] Owner profile open on tap
- [X] Adoption post add date
- [X] Adoption description
- [X] Back button
- [ ] Share button
- [X] "Love" button adding pet to user's favorites
- [ ] Adopt button 

https://user-images.githubusercontent.com/74305289/127187644-9c8b016b-d245-4558-8f0a-887e9c92b27f.mp4

### Add Pet Page

<img align="right" width="153" height="272" src="https://user-images.githubusercontent.com/74305289/127190011-411080f9-e40c-4de6-bd54-c5623ea9981a.png">

- [X] Upload image from Photo Library
- [X] Upload image from Camera
- [X] Name pet
- [X] Name breed
- [X] Select species
- [X] Select gender
- [X] Set age in months/years
- [X] Add description
- [X] User details and upload date automatically set
- [X] Validation system (no field can be empty)
- [X] Empty button (clear all fields)
- [X] Publish button (add pet)

https://user-images.githubusercontent.com/74305289/127190588-fd3b3153-30da-4e45-adfa-657ea1caae96.mp4

### Favorites Page

<img align="right" width="153" height="272" src="https://user-images.githubusercontent.com/74305289/127190756-2d589f53-aa71-4698-b93a-068c9d46ecf0.png">

- [X] Manual refresh of favorites
- [X] Pet Page opens on tap
- [X] Only favorite pets are shown
- [X] Pet details are neatly transitioned to their position upon tap using Hero widgets
