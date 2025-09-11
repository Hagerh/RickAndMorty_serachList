# Rick and Morty Search List  

A Flutter application that fetches and displays characters from the **Rick and Morty API**, with a built-in search feature to filter characters by name.  

The project demonstrates **clean architecture**, **state management with BLoC/Cubit**, and **modular folder organization**.  

---

## Features  
- Fetch all Rick and Morty characters from API  
- Display characters in a grid view with images and names  
- Search characters dynamically by name  
- State management using **Cubit (flutter_bloc)**  
- Clean and scalable project structure  

---
 
## Project Architecture
lib/
├── business/
│   ├── bloc/
│   └── cubit/
├── constants/
│   ├── my_colors.dart
│   └── strings.dart
├── data/
│   ├── apis/
│   ├── models/
│   └── repository/
├── presentation/
│   ├── screens/
│   │   ├── characters.dart
│   │   └── characters_details.dart
│   └── widgets/
│       └── Character.item.dart
├── app_router.dart
└── main.dart

---

## State Management  

This project uses **Cubit** from the `flutter_bloc` package:  

- **CharactersCubit** → Handles fetching and managing the list of characters.  
- **CharactersState** → Represents different states:  
  - `CharactersInitial`  
  - `CharactersLoaded` (data successfully fetched)  
  - `CharactersError` (if something goes wrong)  

The **UI** listens to Cubit state updates using `BlocBuilder`, ensuring separation of **business logic** and **presentation layer**.  

---

## UI  

- **Characters Screen**:  
  - Displays all characters in a responsive `GridView`.  
  - Includes a search bar in the `AppBar` for filtering results.  
  - Uses `CharacterItem` widget for reusable card-style layout.  

---
## screenshots
| Characters Grid                                     | Search Filter                                   |
| --------------------------------------------------- | ----------------------------------------------- |
|(<img width="347" height="811" alt="Screenshot 2025-09-10 at 10 10 26 AM" src="https://github.com/user-attachments/assets/1fadcf72-50c4-4861-90c9-ddd1122a339d" />) |(<img width="348" height="815" alt="Screenshot 2025-09-10 at 1 05 27 PM" src="https://github.com/user-attachments/assets/0ce69f33-ca42-4854-a621-2d45dc73a684" />)|





