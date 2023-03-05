A Flutter widget that replaces `FutureBuilder` and shows a loading indicator, error or empty message while the future is being resolved. It also supports a shimmer effect during the waiting period.

## Get Started

To use this package, add `kr_future_builder` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

```yaml
dependencies:
  kr_future_builder: ^1.0.1
```
Then, import the package:

```dart
import 'package:kr_future_builder/kr_future_builder.dart';
```
Or You can install packages from the command line:

```
flutter pub get
```
## Usage
### Basic usage:

```dart
//FutureBuilder
KrFutureBuilder<String>(
    future: future,
    builder: (data) => Text(data),
    onError: (error) => Text('Error: $error'),
    onEmpty: Text('No data'),
),

//StreamBuilder
KrStreamBuilder<String>(
    stream: stream,
    builder: (data) => Text(data),
    onError: (error) => Text('Error: $error'),
    onEmpty: Text('No data'),
),
```
### Custom usage:
```dart
KrFutureBuilder<List<String>>(
    future: future,
    shimmerSize: const Size(double.infinity, 60),
    baseColor: Colors.grey.withOpacity(0.2),
    highlightColor: Colors.grey.withOpacity(0.4),
    blocs: Row(
      children: [
        ShimmerBloc(size: const Size(50, 50), radius: 25),
        const SizedBox(width: 20),
        ShimmerBloc(size: const Size(100, 50), radius: 5),
      ],
    ),
    builder: (data) => ListView.builder(
      itemBuilder: (context, index) => Text(data[index]),
      itemCount: data.length,
    ),
    onError: (error) => Text('Error: $error'),
    onEmpty: Text('No data'),
    onLoading: const Center(child: CircularProgressIndicator()),
),
```
## Parameters
The KrFutureBuilder constructor takes the following parameters:

* future: the Future object to watch for changes.
* stream: the Stream object to watch for changes.
* builder: a callback function that receives the data resolved from the Future and returns a widget tree to build.
* onError: an optional callback function that receives an error object and returns a widget to display the error message.
* onEmpty: an optional widget to display if the Future resolves to null.
* onLoading: an optional widget to display while the Future is waiting for resolution.
* blocs: an optional widget tree that creates a shimmer effect while waiting for the Future to resolve. Use this property if you want to create a custom shimmer effect.
* shimmerSize: an optional Size object to set the size of the shimmer effect. Ignored if blocs is set.
* shimmerRadius: an optional radius to set the corners of the shimmer effect. Ignored if blocs is set.
* baseColor: an optional Color object to set the base color of the shimmer effect. Ignored if blocs is set.
* highlightColor: an optional Color object to set the highlight color of the shimmer effect. Ignored if blocs is set.

## Example
Sure, here is an example of how to use KrFutureBuilder:

```dart
import 'package:flutter/material.dart';
import 'package:kr_builder/kr_builder.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: KrFutureBuilder<String>(
          future: Future.delayed(Duration(seconds: 2), () => 'Hello World'),
          builder: (data) => Text(data),
          onLoading: CircularProgressIndicator(),
          onError: (error) => Text('Error: $error'),
          onEmpty: Text('No Data'),
          shimmerSize: Size(100, 50),
        ),
      ),
    );
  }
}
```

In this example, we are creating a KrFutureBuilder widget that returns a Text widget containing the string 'Hello World' after a 2-second delay. We are also providing optional onLoading, onError, and onEmpty widgets, as well as a shimmerSize value to add a shimmer effect while loading.

## License
This package is licensed under the BSD 3-Clause License. See the LICENSE file for details.