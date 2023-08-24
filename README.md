
## Custom Drop Down
Create elegant and customizable dropdowns effortlessly with the Custom Drop Down package. This Flutter package enables you to easily implement dropdowns with custom styling, animations, and data sources to match your app's needs.

## Getting Started

If you're interested in the background story behind this package's development, you can read our article on Medium: [Creating Custom Dropdowns with OverlayPortal in Flutter](https://medium.com/snapp-x/creating-custom-dropdowns-with-overlayportal-in-flutter-4f09b217cfce).

To get started with the Custom Drop Down package, ensure you have Flutter installed and a basic understanding of how Flutter packages work. You can follow the instructions below to integrate the package into your project:

- Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  custom_drop_down: ^0.1.0  
```

- Run the following command to fetch the package:

```bash
flutter pub get
```

- Import the package in your Dart code:

```dart
import 'package:custom_drop_down/custom_drop_down.dart';
```



## Usage

Here's a simple example showcasing the usage of the Custom Drop Down package:

```dart
  final OverlayPortalController _controller = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return RawCustomDropDown(
      controller: _controller,
      buttonBuilder: (context, onTap) {
        return ButtonWidget(
          width: 500,
          onTap: onTap,
        );
      },
      menuBuilder: (context, width) {
        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: MenuWidget(
            width: width,
            onItemTap: () {
              _controller.hide();
            },
          ),
        );
      },
    );
  }
```

For a complete example, you can explore the code in the [example folder of the repository](https://github.com/Snapp-X/custom_drop_down/blob/main/example/lib/main.dart "example folder of the repository").

## Additional information

If you encounter any issues, have suggestions, or want to contribute to the package, feel free to open an issue or submit a pull request on the GitHub repository.

We value community feedback and aim to provide timely responses to any queries or concerns you may have.