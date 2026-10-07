ardware Management System --- Flutter Implementation

1. Project Overview

This project converts the Hardware Management System Figma design
into a production-ready Flutter application while preserving the Figma
UI as closely as possible.

Source design:
Figma --- Hardware Management System
https://www.figma.com/design/7Pmxmg8clQFQOM6ys0eKq8/Hardware-Managment-System?node-id=0-1&p=f&t=bLFQO0bqyRb50V8b-0

Primary goals

Pixel-accurate implementation of the Figma screens.

Preserve the exact visual hierarchy, spacing, typography, colors,
borders, radii, icons, and states.

Implement real Flutter interactions instead of static mockups.

Keep the code maintainable and reusable.

Make the UI responsive while preserving the intended Figma geometry.

Use local assets rather than temporary Figma URLs.

Validate every implemented screen against its Figma reference.

2. Technology

Recommended stack:

Flutter 3.x

Dart 3.x

Material 3 where appropriate

Responsive Flutter layouts

go_router or an equivalent typed navigation solution

flutter_riverpod for state management, unless the existing project
already uses another state-management solution

intl for formatting

flutter_svg for SVG assets

cached_network_image only for genuinely remote/dynamic images

Do not add packages unnecessarily. Prefer Flutter SDK widgets when they
can reproduce the design accurately.

3. Design Source

The Figma file is the single source of truth for visual implementation.

Do not redesign the UI.

Do not "improve" colors, spacing, typography, icons, borders, or layout
unless required to make the UI function correctly.

When Figma and an implementation assumption conflict:

Figma wins for visual appearance.

Flutter platform conventions win only where Figma does not specify
behavior.

Existing project architecture wins for code organization when it
does not change the visual result.

4. Figma Screens Observed

The design file contains multiple application screens and flows.
Examples include:

Stock Adjustment

Forgot Password

Add Product

Dashboard

Products

Orders

Reports

Profile

Authentication-related screens

Inventory/product forms

Purchase/order-related screens

Tables and summary sections

Bottom navigation states

The complete Figma file must be inspected before implementation. Do not
implement only the first visible frame and assume the rest of the file
follows the same structure.

5. Important Design Characteristics

The inspected Figma design uses:

Mobile-oriented viewport around 440 px wide on several screens.

Inter for most UI/body text.

Poppins SemiBold for selected headings.

Green primary branding.

Light green-tinted application surfaces.

White cards and form fields.

Rounded controls, commonly around 12 px.

Thin green/gray borders.

Bottom navigation on application screens.

Forms with consistent label/input spacing.

Tables that may be wider than the mobile viewport and therefore
require horizontal scrolling.

Icons supplied as vector/SVG assets.

Observed examples include:

Primary green: approximately #4CAF7D

Dark green text: approximately #003D25

Heading green: approximately #006C44

Main text: approximately #181D19

Secondary text: approximately #3E4942

Placeholder text: approximately #6B7280

Border: approximately #BDCABF

Light surface: approximately #F6FBF4

These values are references extracted from the inspected Figma context.
The implementation agent must verify exact values against the relevant
Figma nodes before finalizing.

6. Architecture

Use a feature-first structure.

Recommended:

lib/
├── app/
│   ├── app.dart
│   ├── router.dart
│   └── theme/
│       ├── app_colors.dart
│       ├── app_typography.dart
│       ├── app_spacing.dart
│       ├── app_radius.dart
│       └── app_theme.dart
│
├── core/
│   ├── constants/
│   ├── extensions/
│   ├── utils/
│   ├── widgets/
│   └── services/
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── dashboard/
│   ├── products/
│   ├── inventory/
│   ├── orders/
│   ├── reports/
│   ├── profile/
│   └── stock_adjustment/
│
├── shared/
│   ├── widgets/
│   ├── models/
│   └── components/
│
└── main.dart

If the existing Flutter project already has an architecture, preserve it
unless it prevents clean implementation.

7. Reusable UI Components

Create reusable widgets for repeated Figma patterns.

Examples:

AppScaffold
AppTopBar
AppBottomNavigation
PrimaryButton
SecondaryButton
AppTextField
AppDropdownField
AppTextArea
AppCard
SectionHeader
FormLabel
ProductSelector
WarehouseSelector
QuantityField
PriceField
DataTableCard
SummaryRow
EmptyState
LoadingState
ErrorState

Do not duplicate the same visual component across screens.

If a Figma component is reused with different text/data, make the
Flutter widget configurable.

8. Design Tokens

Centralize design values.

Example:

class AppColors {
  static const primary = Color(0xFF4CAF7D);
  static const darkGreen = Color(0xFF003D25);
  static const headingGreen = Color(0xFF006C44);
  static const text = Color(0xFF181D19);
  static const secondaryText = Color(0xFF3E4942);
  static const placeholder = Color(0xFF6B7280);
  static const border = Color(0xFFBDCABF);
  static const surface = Color(0xFFF6FBF4);
  static const white = Colors.white;
}

Verify every token against Figma before treating these examples as
final.

Use constants for:

Colors

Font families

Font sizes

Font weights

Line heights

Spacing

Border widths

Border radii

Elevation/shadows

Component heights

Avoid scattered magic numbers.

9. Typography

Load the exact fonts if they are not already available.

Primary fonts observed:

Inter

Poppins

Do not substitute Roboto, Arial, or another font when the correct font
is available.

Typography must preserve:

Font family

Weight

Size

Line height

Letter spacing

Alignment

Text casing

Color

10. Assets

All static Figma assets must be downloaded into the Flutter project.

Recommended:

assets/
├── images/
├── icons/
├── logos/
└── fonts/

Register assets in pubspec.yaml.

Do not leave temporary Figma asset URLs in production code.

Do not redraw a supplied icon using a random Material icon if an exact
Figma asset exists.

Do not stretch SVGs incorrectly. Preserve their intrinsic aspect ratio.

11. Responsive Behavior

The Figma design is strongly mobile-oriented.

Use Flutter layout primitives such as:

SafeArea

LayoutBuilder

MediaQuery

Expanded

Flexible

ConstrainedBox

SingleChildScrollView

CustomScrollView

Avoid hardcoding the entire UI to one device width.

However, do not use responsive behavior as an excuse to change the Figma
design.

For mobile widths close to 440 px, reproduce the Figma dimensions as
accurately as possible.

For narrower devices:

preserve horizontal padding,

prevent text overflow,

allow content to scroll where the design requires it,

keep controls usable.

For wider devices:

preserve the intended content max-width,

do not unnecessarily stretch mobile form controls across the entire
screen.

12. Navigation

Implement real navigation between screens.

Recommended routes should be named clearly, for example:

/login
/forgot-password
/dashboard
/products
/products/add
/products/:id
/orders
/orders/:id
/reports
/profile
/stock-adjustment

Use the actual screen inventory discovered from the Figma file.

Bottom navigation should preserve the Figma active/inactive states.

Back buttons should perform actual navigation.

13. Forms

Forms must be interactive.

Implement:

text input

dropdown selection

number input

multiline input

validation

focus states

keyboard behavior

submit actions

disabled states where applicable

Examples from the inspected design:

Product

Warehouse

Adjustment Type

Quantity

Reason

Product Name

Category

Brand

SKU

Purchase Price

Selling Price

Stock Quantity

Do not use fake non-interactive containers where a real Flutter input is
expected.

14. Tables

Some Figma tables are wider than the mobile card/container.

Implement these using horizontal scrolling when necessary:

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: ...
)

Preserve:

column order

column widths

row heights

cell padding

header styling

input controls

action buttons

separators

horizontal alignment

Do not squash a wide table into unreadable columns just to avoid
scrolling.

15. Bottom Navigation

The inspected Figma design includes a five-item bottom navigation:

Dashboard
Products
Orders
Reports
Profile

The active item uses the green active treatment and dark green label.

Inactive items use the neutral icon/text treatment.

Implement the active state based on the current route.

Do not hardcode the active tab independently from navigation state.

16. State Management

UI state must be separated from visual components.

Examples:

AuthState
ProductState
InventoryState
OrderState
ReportState
ProfileState
StockAdjustmentState

For initial implementation, mocked repositories/data are acceptable if
no backend is provided.

Keep repository interfaces separate so a real API can be integrated
later.

17. Data Layer

Recommended structure:

presentation
    ↓
controller/provider
    ↓
repository
    ↓
data source

Example:

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> createProduct(Product product);
}

Do not put API/database code directly inside widgets.

18. Error, Loading, and Empty States

Even if these states are not explicitly shown in Figma, implement them
cleanly where dynamic data is involved.

Important:

Loading must not cause major layout shifts.

Error messages must follow the application's visual language.

Empty states should be consistent with the design system.

Do not invent large UI sections that are not needed.

19. Accessibility

Preserve the visual design while adding:

semantic labels for icons

accessible button names

sufficient touch targets

keyboard navigation where relevant

meaningful form labels

Do not remove accessibility simply to match a screenshot.

20. Performance

Avoid:

unnecessary rebuilds

huge widget trees inside build

loading the same image repeatedly

unnecessary network calls

unbounded lists when ListView.builder is appropriate

Prefer:

const widgets

lazy lists

cached assets

immutable models

small reusable widgets

21. Pixel-Accuracy Process

Every screen should follow this workflow:

Step 1 --- Inspect

Inspect the exact Figma node.

Collect:

frame size

hierarchy

spacing

typography

colors

borders

shadows

radii

assets

component variants

text content

Step 2 --- Implement

Build the Flutter screen using reusable components.

Step 3 --- Render

Run the Flutter application at the target viewport.

Step 4 --- Compare

Compare the rendered Flutter screen against the Figma screenshot.

Step 5 --- Correct

Fix:

x/y alignment

padding

gaps

text size

line height

font weight

colors

border thickness

corner radius

icon size

image scale

component dimensions

Step 6 --- Repeat

Do not stop at "looks close".

The goal is a visually faithful implementation.

22. Verification Checklist

For every screen verify:

Correct background

Correct top bar

Correct title

Correct back/menu icons

Correct content width

Correct horizontal padding

Correct vertical spacing

Correct font family

Correct font size

Correct font weight

Correct line height

Correct text color

Correct border color

Correct border width

Correct border radius

Correct icon asset

Correct image asset

Correct button height

Correct button radius

Correct button typography

Correct input height

Correct dropdown appearance

Correct bottom navigation

Correct active state

No overflow

No unexpected scrolling

No clipped text

No incorrect asset stretching

23. Testing

Minimum tests:

Unit tests

Test:

validators

formatters

models

repository behavior

business rules

Widget tests

Test:

buttons

inputs

dropdowns

navigation

validation

active bottom navigation state

Golden/screenshot tests

Use golden tests for the most important screens where practical.

Suggested golden targets:

login
forgot_password
dashboard
products
add_product
orders
reports
stock_adjustment
profile

24. Flutter Commands

Install dependencies:

flutter pub get

Run:

flutter run

Analyze:

flutter analyze

Format:

dart format .

Test:

flutter test

Build Android:

flutter build apk --release

Build iOS:

flutter build ios --release

25. pubspec.yaml Assets

Example:

flutter:
  uses-material-design: true

  assets:
    - assets/images/
    - assets/icons/
    - assets/logos/

  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-SemiBold.ttf
          weight: 600

    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-SemiBold.ttf
          weight: 600

Adjust paths to match the actual downloaded assets.

26. Definition of Done

The implementation is complete only when:

Every required Figma screen has a Flutter equivalent.

Navigation between screens works.

Interactive controls are functional.

Static assets are local.

Fonts are correct.

Figma colors and typography are respected.

Responsive behavior works on supported widths.

No debug placeholders remain.

flutter analyze passes.

Tests pass.

Important screens have been visually compared against Figma.

Major pixel-level differences have been corrected.

No temporary Figma URLs remain in source code.

The project is maintainable and organized by feature.

27. Implementation Rule

Do not approximate the design when the Figma source provides exact
information.

If a measurement, color, font, icon, or asset exists in Figma, use that
value.

If behavior is not defined by Figma, implement the simplest
production-ready Flutter behavior that does not alter the visual design.
