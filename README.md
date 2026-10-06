# mahafez_core

Layer 1 pure Dart foundation for the Mahafez platform.

## Responsibility

This package contains framework-independent shared contracts and value utilities: `Result` and failure types, use-case contracts, transaction and wallet-provider enums, Egyptian phone number utilities, and text validators. It has no Flutter dependency and must not depend on services, products or the app.

## Use

```yaml
dependencies:
  mahafez_core:
    git:
      url: https://github.com/mahafez-app/mahafez_core.git
      ref: v1.0.1
```

```dart
import 'package:mahafez_core/mahafez_core.dart';

final result = Success<int>(42);
final normalized = EgyptianPhoneNumber.normalize('+201030096242');
```

Check the barrel `lib/mahafez_core.dart` for the supported exports. Product-specific entities and presentation concerns belong in products, not here.
