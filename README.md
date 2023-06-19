# Streaming Forms

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: Apache License 2.0][license_badge]][license_link]

A form package providing Dart streams.

Check out [this demo](https://erayerdin.github.io/streaming_forms/) to see it in action. Refer to the [wiki](https://github.com/erayerdin/streaming_forms/wiki) to learn more or check out [examples](examples/) directory to see code samples.

## Rationale

The most popular and stable form package for Flutter is definitely [flutter_form_builder](https://pub.dev/packages/flutter_form_builder). However, it's design is event-driven. It solves the issue with mainly `onChanged` and similar callbacks.

This design has an inherent issue: It doesn't incorporate with modern stream-driven approach.

Since it doesn't get along well with streams, it will especially lead to various issues when you want to especially use a state management solution (mainly [Bloc](https://bloclibrary.dev)). That's because modern state management is mainly built upon streams.

I opened up [this issue](https://github.com/flutter-form-builder-ecosystem/flutter_form_builder/issues/1155) to explain that the library needs to incorporate with streams because I mainly wanted to integrate `flutter_form_builder` with `bloc` at that time as I was working on a project.

Not only that, I've also tried to [implement it myself](https://github.com/flutter-form-builder-ecosystem/flutter_form_builder/pull/1162). Then I have realized that the whole package needed to be refactored from the very beginning, which is a heavy take on an existing and considerably-large project such as `flutter_form_builder`.

At the same time, I was looking for a 3rd-party solution that works well with streams, but there wasn't any good existing solution out there. For example, there's [flutter_form_bloc](https://pub.dev/packages/flutter_form_bloc), but it messes with raw material design that Flutter provides, which breaks visual consistency.

That's why I have created `streaming_forms`. A Flutter form package that specifically plays well with streams, so that you can listen to events asynchronously.

## Where It is and Where It's Heading

Currently, the package is in its alpha phase. There will be some design decisions on the API. The current goals are these:

 - Work with asynchronous events provided by streams instead of event handler callbacks so that the devs can use it with their state management solution
 - Add upon, but not change, the built-in form solutions of Flutter so that the users familiar with it can migrate easily or create forms without extra required knowledge
 - Add a built-in validation logic
 - Work with Bloc

## Installation 💻

**❗ In order to start using this package you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `streaming_forms` to your `pubspec.yaml`:

```yaml
dependencies:
  streaming_forms:
```

Install it:

```sh
flutter packages get
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[license_badge]: https://img.shields.io/badge/license-Apache%20License%202.0-blue.svg
[license_link]: https://www.tldrlegal.com/license/apache-license-2-0-apache-2-0
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
