# Weather App

  
This Weather App is a simple Flutter application that allows users to enter a location and view the current weather information for that location.


## Features
- Search for weather information by entering a location.
- Display current weather conditions including temperature, humidity, and weather description.
- Intuitive and user-friendly interface.
- Responsive design for various screen sizes.

## Project Structure
The project follows a clean architecture with a clear separation of concerns. Here's an overview of the project structure:

**weatherapp-flutter/lib/**
- models/         # Data models representing weather data 
- providers/      # State management using provider package
- routes/         # Application routes and navigation
- screens/        # UI screens and pages
- services/       # Services for API calls and data handling
- utils/          # Utility functions and constants
- widgets/        # Reusable widgets
- main.dart       # Entry point of the application

### Installation
1.  Clone the repository:
`git clone https://github.com/codewithmesfin/weatherapp-flutter.git`
`cd weatherapp-flutter`

2. Add your OpenWeatherMap API and BASE_URL to .env file:
`WEATHER_APP_ID=`
`BASE_URL=`

3. Install dependencies:
`flutter pub get`

### Running the App

1.  Ensure a connected device or emulator is running.
2.  Run the application:
`flutter run`



## Contact

Mesfin - [@codewithmesfin](https://github.com/codewithmesfin)
Feel free to reach out if you have any questions or feedback!