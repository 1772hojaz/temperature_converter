# temperature_converter
change celsius to fahrenheit

# Temperature Conversion App

## Purpose

The Temperature Conversion app is designed to provide users with a simple and intuitive way to convert temperatures between Fahrenheit and Celsius. The app allows for easy input of temperature values, selection of conversion types, and maintains a history of conversions for user reference. It aims to serve as a practical tool for anyone needing quick temperature conversions.

## Features

- Select between Fahrenheit-to-Celsius and Celsius-to-Fahrenheit conversions.
- Input an initial temperature value.
- Calculate and display the converted temperature with results formatted to two decimal places.
- Maintain a history of past conversions.
- Consistent layout and functionality across portrait and landscape orientations.

## Architecture

The app is built using Flutter, a UI toolkit for creating natively compiled applications for mobile, web, and desktop from a single codebase. The main components of the architecture include:

1. **Main Application**:
   - The entry point of the app is defined in `main.dart`, which sets up the `MaterialApp` and specifies the home screen.

2. **State Management**:
   - The app utilizes a StatefulWidget to manage the input state, handle temperature conversion logic, and update the UI accordingly.

3. **Widgets**:
   - **TemperatureConversionScreen**: This screen contains the main UI elements for temperature input, conversion selection, and history display.
   - **HistoryList**: A custom widget that displays the conversion history in a list format.

## Critical Components

### 1. main.dart

This file serves as the entry point for the app. It initializes the `MyApp` class, which creates the `MaterialApp` and sets the home screen.

```dart
void main() {
  runApp(MyApp());
}```

### 2. TemperatureConversionScreen

This is a `StatefulWidget` responsible for managing the input and conversion logic. It includes:

- **Form Handling**: Uses a `GlobalKey<FormState>` to validate and save user input. This ensures that the user inputs a valid temperature value before performing the conversion.
  
- **Conversion Type Selection**: A switch is provided to toggle between Fahrenheit-to-Celsius and Celsius-to-Fahrenheit conversions, ensuring that only one conversion type is selected at any given time.

- **User Feedback**: Displays a Snackbar with the converted value after the conversion is performed.

### 3. Conversion Logic

The conversion formulas are implemented in the `_temperatureConversion` method, which handles the actual calculation based on the selected conversion type:

```dart
double _temperatureConversion(double temperature) {
  return _isFahrenheitToCelsius
      ? (temperature - 32) * 5 / 9
      : temperature * 9 / 5 + 32;
}```

### 4. History Management

The app maintains a history of conversions in a list, displayed in the `HistoryList` widget. Each entry includes:

- **Conversion Type**: Indicates whether the conversion was from Fahrenheit to Celsius or from Celsius to Fahrenheit (e.g., "F to C" or "C to F").
- **Original Temperature Value**: The temperature value that the user inputted.
- **Converted Result**: The resulting temperature after conversion, formatted to two decimal places.

The history list is dynamically updated each time a conversion is performed. This allows users to easily reference their previous calculations and enhances the overall usability of the app. The `HistoryList` widget uses a `ListView` to present the history in a clean and organized manner, making it straightforward for users to track their conversion history.
