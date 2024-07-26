# User Documentation for Dogs-Breed-App
## Introduction

Dogs-Breed-App is a comprehensive mobile application designed to help dog lovers explore the fascinating world of dog breeds. With its user-friendly interface and rich information, the app provides a delightful experience for anyone interested in learning about different dog breeds.

## Key Features

### Browse Dog Breeds: 
    Discover a wide range of dog breeds categorized by their alphabetical order.
### View Sub-Breeds: 
    Some breeds have sub-breeds, which you can explore to learn about their unique characteristics.
### See Breed Images: 
    View stunning images of each breed to get a visual understanding of their appearance.
### Interactive Image Viewer: 
    Zoom and pan the breed images for a closer look.

### Launch the App: 
    Open the Dogs-Breed-App on your mobile device.
### Browse Breeds: 
     Scroll through the list of dog breeds categorized alphabetically.
### Explore Details: 
    Tap on a breed to view its detailed information.
### View Sub-Breeds: 
    If a breed has sub-breeds, you can tap on them to learn more.
#### View Images: 
    Tap on the image icon to view a full-screen image of the breed.
### Zoom and Pan:
    Use the interactive image viewer to zoom and pan the image for a closer look.

## Benefits
### Comprehensive Information: 
    Access detailed information about a wide range of dog breeds.
### Interactive Experience: 
    Zoom and pan images for a closer look.
### User-Friendly Interface: 
    Easy to navigate and use.


# Technical Documentation for Dogs-Breed-App
## Project Overview

Dogs-Breed-App is a Flutter application that provides information about various dog breeds. The app utilizes a BLoC architecture for state management and interacts with a backend API to fetch breed data.

## Architecture

### BLoC (Business Logic Component): 
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
    Manages the state of the app, including fetching breed data, sub-breeds, and images.
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

### Flutter: 
    The core framework for building the UI.
### BLoC: 
    A state management pattern for separating business logic from the UI.
### cached_network_image: 
    A package for efficiently caching and displaying network images.
### dio: 
    A library for making HTTP requests to the backend API.

## Testing
    The app includes unit tests for the DogBreedsCubit using mocktail to mock the DogBreedsRepo and verify state transitions.


## Conclusion
    Dogs-Breed-App is a well-structured and well-tested Flutter application that provides a comprehensive and engaging experience for dog lovers. The app utilizes a BLoC architecture for state management, interacts with a backend API, and leverages the cached_network_image package for efficient image loading.

    
<video controls src="DogBreedsAppDemo.mp4" title="DogBreedsAppDemo"></video>