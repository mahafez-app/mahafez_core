# 📦 Mahafez Core (`mahafez_core`)

[![Architecture Layer](https://img.shields.io/badge/Layer-Core%20%2F%20Platform%20(L1)-blue.svg)]()
[![Platform](https://img.shields.io/badge/SDK-Pure%20Dart-0175C2.svg)]()
[![License](https://img.shields.io/badge/License-Private-lightgrey.svg)]()

> Part of the **Mahafez Platform Architecture**. Provides the pure Dart technical foundation: error models, functional results, clean UseCase contracts, phone parsing, and pure enums.

---

## 📐 Architecture Classification
* **Layer:** **Layer 1 (Core / Platform)**
* **Dependencies:** Pure Dart SDK + `equatable`. **Zero Flutter framework dependencies.**
* **Strict Rule:** Contains **ZERO** business logic and **ZERO** presentation components.

---

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  mahafez_core:
    git:
      url: https://github.com/mahafez-app/mahafez_core.git
      ref: v1.0.0
```

---

## 📖 Public API & Usage

```dart
import 'package:mahafez_core/mahafez_core.dart';

// 1. Result & Failure handling
Result<int> calculate() {
  return const Success(100);
}

// 2. Egyptian Phone Normalization
final normalized = EgyptianPhoneNumber.normalize('+201030096242'); // '01030096242'
final provider = EgyptianPhoneNumber.primaryProvider(normalized); // WalletProvider.vodafoneCash

// 3. Pure Enums
final type = TransactionType.fromString('receive');
```
