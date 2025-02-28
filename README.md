# Split Bill - iOS App

## Overview

Split Bill is a user-friendly iOS application that helps users split expenses easily. Built using **UIKit and Storyboard**, it follows the **Model-View-Controller (MVC)** design pattern for better maintainability. The app allows users to input the bill amount, choose a tip percentage, specify the number of users, and determine the payment status.

## Features

- 💰 Enter bill amount

- 🏷 Select tip percentage

- 👥 Choose number of users

- 🔄 Segue-based navigation for smooth screen transitions

- 🎨 Clean UI with Storyboard

## Tech Stack

- **Language**: Swift
- **Framework**: UIKit
- **Architecture**: MVC
- **UI Design**: Storyboard

## Features Breakdown

### **Bill Calculation**

- Users enter the bill amount.
- Select a tip percentage.
- Specify the number of users.
- Calculates individual shares including the tip.

### **Segue Navigation**

- Uses `performSegue(withIdentifier:sender:)` to transition to the result screen.
- Passes calculated values using `prepare(for:sender:)` method.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/w/ildanalifr/split-bill-ios.git
   ```
2. Open `SplitBill.xcodeproj` in Xcode.
3. Run the app on a simulator or a real device.

## Contributing

Feel free to contribute by opening issues or submitting pull requests. 😊

## License

This project is licensed under the MIT License.
