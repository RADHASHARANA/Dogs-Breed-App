# Technical Documentation for Dogs-Breed-App
## Project Overview

Dogs-Breed-App is a Flutter application that provides information about various dog breeds. The app utilizes a BLoC architecture for state management and interacts with a backend API to fetch breed data.

## Architecture

### BLoC (Business Logic Component)
  The app uses a BLoC pattern to separate business logic from the UI. A DogBreedsCubit class manages the state of the app, including fetching breed data, sub-breeds, and images.
### Repository: 
  A DogBreedsRepo interface defines methods for interacting with the backend API.
### UI: 
  The UI is built using Flutter widgets and utilizes BlocBuilder to listen for state changes from the DogBreedsCubit.

## Data Flow

### UI Event: 
  The user interacts with the UI (e.g., taps on a breed).
### Event Handling: 
  The UI triggers an event (e.g., FetchDogBreeds, FetchDogSubBreeds, FetchDogImageDetails) in the DogBreedsCubit.
### State Update: 
  The DogBreedsCubit fetches data from the backend API using the DogBreedsRepo and updates the app state.
### UI Update: 
  The BlocBuilder in the UI listens for state changes and updates the UI accordingly.

## Key Components

### DogBreedsCubit:
   A BLoC class that Manages the state of the app, including fetching breed data, sub-breeds, and images.
   Emits state changes to the UI using emit().

### DogBreedsRepo:
   Defines methods for interacting with the backend API.
   Implements the actual API calls to fetch data.
### StatusHandler:
   A reusable widget that handles different states (initial, loading, success, error, empty) and displays appropriate UI.
### DogBreedsScreen:
   The main screen of the app, displaying a list of dog breeds.
### DogBreedDetailsScreen:
    Displays detailed information about a selected breed, including sub-breeds.
### DogImageScreen:
    Displays a full-screen image of a selected breed with a grayscale gradient background and interactive zoom/pan functionality.

## Dependencies

#### Flutter: 
    The core framework for building the UI.
#### BLoC: 
    A state management pattern for separating business logic from the UI.
#### dio: 
    A library for making HTTP requests to the backend API.

## Unit Testing
   The app includes unit tests for the DogBreedsCubit using mocktail to mock the DogBreedsRepo and verify state transitions.

Future Enhancements

Search Functionality: Allow users to search for specific breeds.
User Profiles: Implement user profiles to allow users to save their favorite breeds.
Offline Mode: Enable offline access to breed data.

## Conclusion

    Dogs-Breed-App is a well-structured and well-tested Flutter application that provides a comprehensive and engaging experience for dog lovers. The app utilizes a BLoC architecture for state management, interacts with a backend API, and handles image loading directly using Image.network with loading and error indicators.