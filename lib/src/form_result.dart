// Copyright 2023 Eray Erdin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

class FormResult<T> {
  FormResult._(this.value, this.message);

  factory FormResult.valid(T value) {
    return FormResult._(value, null);
  }

  factory FormResult.invalid(String message) {
    return FormResult._(null, message);
  }

  final T? value;
  final String? message;

  bool get isValid => value != null;

  @override
  String toString() =>
      isValid ? 'FormResult.valid($value)' : 'FormResult.invalid($message)';
}
