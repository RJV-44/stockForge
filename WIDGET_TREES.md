# StockForge - Complete Widget Tree Architecture Documentation

This document provides a comprehensive structural guide to the Flutter widget trees for all **33 pages** in the **StockForge** Hardware Management System, organized by architectural layer and feature module.

---

## Table of Contents
1. [App Root & Routing Architecture](#app-root--routing-architecture)
2. [Shared Common Layout Components](#shared-common-layout-components)
3. [Splash & Authentication Module](#1-splash--authentication-module)
   - [SplashPage](#11-splashpage)
   - [LoginPage](#12-loginpage)
   - [ForgotPasswordPage](#13-forgotpasswordpage)
   - [OtpVerificationPage](#14-otpverificationpage)
   - [ResetPasswordPage](#15-resetpasswordpage)
4. [Dashboard Module](#2-dashboard-module)
   - [DashboardPage](#21-dashboardpage)
5. [Products Module](#3-products-module)
   - [ProductsPage](#31-productspage)
   - [AddProductPage](#32-addproductpage)
   - [EditProductPage](#33-editproductpage)
   - [ProductDetailsPage](#34-productdetailspage)
6. [Customers Module](#4-customers-module)
   - [CustomersPage](#41-customerspage)
   - [AddCustomerPage](#42-addcustomerpage)
   - [EditCustomerPage](#43-editcustomerpage)
   - [CustomerDetailsPage](#44-customerdetailspage)
7. [Suppliers Module](#5-suppliers-module)
   - [SuppliersPage](#51-supplierspage)
   - [AddSupplierPage](#52-addsupplierpage)
   - [SupplierDetailsPage](#53-supplierdetailspage)
8. [Inventory & Stock Adjustment Module](#6-inventory--stock-adjustment-module)
   - [InventoryPage](#61-inventorypage)
   - [StockDetailsPage](#62-stockdetailspage)
   - [StockAdjustmentPage](#63-stockadjustmentpage)
9. [Orders Module](#7-orders-module)
   - [OrdersPage (Sales Orders)](#71-orderspage-sales-orders)
   - [CreateOrderPage](#72-createorderpage)
   - [OrderDetailsPage (Edit Purchase Order)](#73-orderdetailspage-edit-purchase-order)
   - [PurchaseOrdersPage](#74-purchaseorderspage)
   - [SalesOrderDetailsPage](#75-salesorderdetailspage)
10. [Reports & Invoices Module](#8-reports--invoices-module)
    - [ReportsPage](#81-reportspage)
    - [ReportDetailsPage](#82-reportdetailspage)
    - [InvoicesPage](#83-invoicespage)
    - [InvoiceDetailsPage](#84-invoicedetailspage)
11. [Profile, Settings & User Access Module](#9-profile-settings--user-access-module)
    - [ProfilePage](#91-profilepage)
    - [SettingsPage](#92-settingspage)
    - [UsersPage](#93-userspage)
    - [RolesPermissionsPage](#94-rolespermissionspage)

---

## App Root & Routing Architecture

- **Entry Point**: [main.dart](file:///d:/flutter_projects/new/lib/main.dart) -> `HardwareManagementApp`
- **Application Class**: [app.dart](file:///d:/flutter_projects/new/lib/app/app.dart)
- **Router Configuration**: [app_router.dart](file:///d:/flutter_projects/new/lib/app/router/app_router.dart)
- **Route Constants**: [route_names.dart](file:///d:/flutter_projects/new/lib/app/router/route_names.dart)

```text
HardwareManagementApp
└── MaterialApp
    ├── title: AppConstants.appName ("StockForge")
    ├── theme: AppTheme.lightTheme
    ├── navigatorKey: NavigationService.navigatorKey
    ├── initialRoute: RouteNames.initial (SplashPage)
    └── onGenerateRoute: AppRouter.generateRoute
        └── MaterialPageRoute (Instantiates requested Page widget)
```

---

## Shared Common Layout Components

### 1. AppScaffold
- **File**: [app_scaffold.dart](file:///d:/flutter_projects/new/lib/shared/widgets/app_scaffold.dart)
```text
Scaffold (backgroundColor: white / custom)
├── [Optional] AppBar (elevation: 0, title, leading: backButton, actions, bottom: Divider)
├── body: SafeArea (top: false)
│   └── Center
│       └── ConstrainedBox (maxWidth: 500)
│           └── body (Page Content)
├── [Optional] floatingActionButton
└── [Optional] bottomNavigationBar: SafeArea (top: false) -> bottomNavigationBar
```

### 2. AppBottomNavigation
- **File**: [app_bottom_navigation.dart](file:///d:/flutter_projects/new/lib/shared/widgets/app_bottom_navigation.dart)
```text
Container (white background, top border divider)
└── Row (mainAxisAlignment: spaceAround)
    ├── _buildNavItem (Index 0: Dashboard - Icons.dashboard_outlined / Icons.dashboard)
    ├── _buildNavItem (Index 1: Products - Icons.inventory_2_outlined / Icons.inventory_2)
    ├── _buildNavItem (Index 2: Orders - Icons.shopping_bag_outlined / Icons.shopping_bag)
    ├── _buildNavItem (Index 3: Reports - Icons.bar_chart_outlined / Icons.bar_chart)
    └── _buildNavItem (Index 4: Profile - Icons.person_outline / Icons.person)
```

---

## 1. Splash & Authentication Module

### 1.1 SplashPage
- **File**: [splash_page.dart](file:///d:/flutter_projects/new/lib/features/splash/presentation/pages/splash_page.dart)
- **Route**: `RouteNames.splash` / `RouteNames.initial` (`/`)

```text
Scaffold (backgroundColor: Colors.white)
└── GestureDetector (onTap: _navigateToNext)
    └── SizedBox.expand
        └── SafeArea
            └── Column
                ├── Spacer (flex: 3)
                ├── FadeTransition (opacity: _fadeAnimation)
                │   └── ScaleTransition (scale: _scaleAnimation)
                │       └── Padding (horizontal: 32.0)
                │           └── Column (mainAxisSize: min)
                │               ├── Image.asset (stockforgeEmblem / fallback Container with Icons.hub_rounded)
                │               ├── SizedBox (height: 12)
                │               ├── RichText (TextSpans: "Stock" in Dark + "Forge" in Green)
                │               ├── SizedBox (height: 4)
                │               ├── Text ("Smart Hardware Supply Management")
                │               ├── SizedBox (height: 32)
                │               ├── Text ("Hardware Supply Business\nManagement System")
                │               ├── SizedBox (height: 14)
                │               └── Text ("Smart Inventory • Smarter Supply\nChain • Better Business")
                ├── Spacer (flex: 4)
                └── Padding (bottom: 24.0)
                    └── Text ("Version 1.0")
```

---

### 1.2 LoginPage
- **File**: [login_page.dart](file:///d:/flutter_projects/new/lib/features/auth/presentation/pages/login_page.dart)
- **Route**: `RouteNames.login` (`/login`)

```text
Scaffold (backgroundColor: Colors.white)
└── SafeArea
    └── Center
        └── SingleChildScrollView
            └── ConstrainedBox (maxWidth: 400)
                └── Form (_formKey)
                    └── Column (stretch)
                        ├── Center -> Image.asset (logo / fallback Column emblem)
                        ├── SizedBox (height: 36)
                        ├── Text ("Welcome to StockForge")
                        ├── SizedBox (height: 32)
                        ├── Text ("Email Address")
                        ├── SizedBox (height: 8)
                        ├── TextFormField (controller: _emailController, validator: Validators.email)
                        ├── SizedBox (height: 18)
                        ├── Text ("Password")
                        ├── SizedBox (height: 8)
                        ├── TextFormField (controller: _passwordController, obscureText, suffixIcon: toggle)
                        ├── SizedBox (height: 16)
                        ├── Row
                        │   ├── Expanded -> Row [Checkbox (_rememberMe), Text ("Remember Me")]
                        │   └── GestureDetector -> Text ("Forgot Password?")
                        ├── SizedBox (height: 24)
                        ├── SizedBox (height: 48)
                        │   └── ElevatedButton ("Sign In" / CircularProgressIndicator)
                        ├── SizedBox (height: 52)
                        └── Column (min)
                            ├── Text ("Need help?")
                            ├── Text ("Contact your administrator.")
                            └── Text ("Version 1.0")
```

---

### 1.3 ForgotPasswordPage
- **File**: [forgot_password_page.dart](file:///d:/flutter_projects/new/lib/features/auth/presentation/pages/forgot_password_page.dart)
- **Route**: `RouteNames.forgotPassword` (`/forgot-password`)

```text
Scaffold (backgroundColor: Colors.white)
├── AppBar (title: "Forgot Password", leading: IconButton(arrow_back))
└── SafeArea
    └── Center
        └── SingleChildScrollView
            └── ConstrainedBox (maxWidth: 400)
                └── Form (_formKey)
                    └── Column (stretch)
                        ├── Center -> Container (Circle, Primary Green) -> Icon (lock_outline_rounded)
                        ├── SizedBox (height: 24)
                        ├── Text ("Forgot Password")
                        ├── SizedBox (height: 12)
                        ├── Text ("Enter your registered email address...")
                        ├── SizedBox (height: 32)
                        ├── Text ("Email Address")
                        ├── SizedBox (height: 8)
                        ├── TextFormField (controller: _emailController, validator: Validators.email)
                        ├── SizedBox (height: 6)
                        ├── Text ("Use the email associated with your account.")
                        ├── SizedBox (height: 24)
                        ├── SizedBox (height: 48) -> ElevatedButton ("Send Verification Code")
                        ├── SizedBox (height: 24)
                        ├── Center -> InkWell -> Row [Icon (arrow_back_rounded), Text ("Back to Login")]
                        ├── SizedBox (height: 32)
                        └── Container (Card: "Need Assistance?")
                            └── Row [Icon (info), Expanded -> Column [Text ("Need Assistance?"), Text (...)]]
```

---

### 1.4 OtpVerificationPage
- **File**: [otp_verification_page.dart](file:///d:/flutter_projects/new/lib/features/auth/presentation/pages/otp_verification_page.dart)
- **Route**: `RouteNames.otpVerification` (`/otp-verification`)

```text
Scaffold (backgroundColor: Colors.white)
├── AppBar (title: "OTP Verification", leading: IconButton(arrow_back))
└── SafeArea
    └── Center
        └── SingleChildScrollView
            └── ConstrainedBox (maxWidth: 420)
                └── Column (stretch)
                    ├── Center -> Container (Circle) -> Icon (mark_email_read_outlined)
                    ├── SizedBox (height: 24)
                    ├── Text ("Enter Verification Code")
                    ├── SizedBox (height: 12)
                    ├── RichText ("We have sent a 6-digit verification code to " + email)
                    ├── SizedBox (height: 8)
                    ├── Center -> InkWell -> Text ("Change Email Address")
                    ├── SizedBox (height: 28)
                    ├── [Optional Banner] Container (Demo Mode OTP Auto-fill & auto-fill button)
                    ├── Row (mainAxisAlignment: spaceBetween)
                    │   └── 6x SizedBox (width: 48, height: 56)
                    │       └── KeyboardListener (handles backspace)
                    │           └── TextFormField (digit input, maxLength: 1, digitsOnly)
                    ├── [Optional Error] Row [Icon (error_outline), Text (_errorMessage)]
                    ├── SizedBox (height: 24)
                    ├── SizedBox (height: 48) -> ElevatedButton ("Verify Code")
                    ├── SizedBox (height: 20)
                    ├── Center -> Countdown Timer / Row [Text ("Didn't receive?"), InkWell ("Resend Code")]
                    ├── SizedBox (height: 24)
                    ├── Center -> InkWell -> Row [Icon (arrow_back_rounded), Text ("Back to Login")]
                    ├── SizedBox (height: 28)
                    └── Container (Need Assistance Card)
```

---

### 1.5 ResetPasswordPage
- **File**: [reset_password_page.dart](file:///d:/flutter_projects/new/lib/features/auth/presentation/pages/reset_password_page.dart)
- **Route**: `RouteNames.resetPassword` (`/reset-password`)

```text
Scaffold (backgroundColor: Colors.white)
├── AppBar (title: "Reset Password", leading: IconButton(arrow_back))
└── SafeArea
    └── Center
        └── SingleChildScrollView
            └── ConstrainedBox (maxWidth: 400)
                └── Form (_formKey)
                    └── Column (stretch)
                        ├── Center -> Container (Circle) -> Icon (lock_reset_rounded)
                        ├── SizedBox (height: 24)
                        ├── Text ("Create New Password")
                        ├── SizedBox (height: 12)
                        ├── Text ("Set a new password for... / Your new password must be...")
                        ├── SizedBox (height: 32)
                        ├── Text ("New Password")
                        ├── SizedBox (height: 8)
                        ├── TextFormField (controller: _passwordController, obscureText, suffixIcon)
                        ├── SizedBox (height: 18)
                        ├── Text ("Confirm New Password")
                        ├── SizedBox (height: 8)
                        ├── TextFormField (controller: _confirmPasswordController, obscureText, suffixIcon)
                        ├── SizedBox (height: 28)
                        ├── SizedBox (height: 48) -> ElevatedButton ("Reset Password")
                        ├── SizedBox (height: 24)
                        ├── Center -> InkWell -> Row [Icon (arrow_back_rounded), Text ("Back to Login")]
                        ├── SizedBox (height: 32)
                        └── Container (Security Reminder Card)
```

---

## 2. Dashboard Module

### 2.1 DashboardPage
- **File**: [dashboard_page.dart](file:///d:/flutter_projects/new/lib/features/dashboard/presentation/pages/dashboard_page.dart)
- **Route**: `RouteNames.dashboard` (`/dashboard`)

```text
Scaffold (backgroundColor: #F9FBF9)
├── SafeArea
│   └── Column
│       ├── Container (_buildTopHeader)
│       │   └── Row
│       │       ├── CircleAvatar (AssetConstants.userAvatar)
│       │       ├── SizedBox (width: 10)
│       │       ├── Column [Text ("Good Morning,"), Text ("Khush Dobariya")]
│       │       ├── Spacer
│       │       ├── IconButton (Icons.search_rounded -> ProductsPage)
│       │       └── IconButton (Icons.notifications_none_rounded)
│       └── Expanded
│           └── ListView (padding: 16, 4, 16, 20)
│               ├── Column (_buildOverviewCards)
│               │   ├── Row
│               │   │   ├── Expanded -> StatCard ("Purchase Management", value: "24")
│               │   │   └── Expanded -> StatCard ("Customers", value: "1,248")
│               │   └── Row
│               │       ├── Expanded -> StatCard ("Invoices", value: "356")
│               │       └── Expanded -> StatCard ("Suppliers", value: "86")
│               ├── SizedBox (height: 18)
│               ├── Column (_buildLowStockAlertsSection)
│               │   ├── Row [Text ("Low Stock Alerts"), GestureDetector -> Text ("View All")]
│               │   ├── LowStockCard ("Galvanized Steel Pipe 2\"", stock: 12, min: 50)
│               │   └── LowStockCard ("Industrial Drill Bit Set", stock: 8, min: 25)
│               ├── SizedBox (height: 18)
│               ├── Column (_buildSalesOverviewSection)
│               │   ├── Text ("Sales Overview")
│               │   └── Container (height: 140) -> CustomPaint (_SalesChartPainter)
│               ├── SizedBox (height: 18)
│               └── Column (_buildRecentOrdersSection)
│                   ├── Text ("Recent Orders")
│                   ├── RecentOrderCard ("ORD-8821", Metro Buildcon Ltd., ₹12,450, Completed)
│                   ├── RecentOrderCard ("ORD-8822", RK Infrastructure, ₹4,200, Pending)
│                   └── RecentOrderCard ("ORD-8823", Sunshine Hardware, ₹8,760, Processing)
└── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
```

---

## 3. Products Module

### 3.1 ProductsPage
- **File**: [products_page.dart](file:///d:/flutter_projects/new/lib/features/products/presentation/pages/products_page.dart)
- **Route**: `RouteNames.products` (`/products`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Products", leading: IconButton(arrow_back), actions: [IconButton(search)])
├── floatingActionButton: FloatingActionButton (Icon: add -> AddProductPage)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 1)
└── SafeArea
    └── ListView
        ├── Container (_buildSearchInput) -> TextField (controller: _searchController)
        ├── SizedBox (height: 12)
        ├── InkWell (_buildFilterButton) -> Row [Icon (filter_list_rounded), Text ("Filter")]
        ├── SizedBox (height: 16)
        └── List of Product Cards (_buildProductCard)
            └── Container
                └── Column
                    ├── Row [Expanded -> Text (Product Name), Container (Status Badge)]
                    ├── Text (Category)
                    ├── SizedBox (height: 14)
                    ├── Row [Column (Price), Column (Stock)]
                    ├── SizedBox (height: 16)
                    └── Row
                        ├── Expanded -> ElevatedButton ("View" -> ProductDetailsPage)
                        └── Expanded -> OutlinedButton ("Edit" -> EditProductPage)
```

---

### 3.2 AddProductPage
- **File**: [add_product_page.dart](file:///d:/flutter_projects/new/lib/features/products/presentation/pages/add_product_page.dart)
- **Route**: `RouteNames.addProduct` (`/add-product`)

```text
AppScaffold (title: "Add Product")
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 1)
└── body: SingleChildScrollView
    └── Form (_formKey)
        └── Column (stretch)
            ├── FieldLabel ("Product Name *") & TextFormField (_nameController)
            ├── FieldLabel ("Category *") & DropdownButtonFormField (_selectedCategory)
            ├── FieldLabel ("Brand *") & TextFormField (_brandController)
            ├── FieldLabel ("SKU *") & TextFormField (_skuController)
            ├── Row
            │   ├── Expanded -> Column [FieldLabel ("Purchase Price *"), TextFormField]
            │   └── Expanded -> Column [FieldLabel ("Selling Price *"), TextFormField]
            ├── FieldLabel ("Stock Quantity *") & TextFormField (_stockController)
            ├── FieldLabel ("Supplier *") & DropdownButtonFormField (_selectedSupplier)
            ├── FieldLabel ("Description") & TextFormField (_descriptionController, maxLines: 3)
            ├── SizedBox (height: 24)
            ├── SizedBox (height: 48) -> ElevatedButton ("Save Product")
            ├── SizedBox (height: 12)
            └── SizedBox (height: 48) -> OutlinedButton ("Cancel")
```

---

### 3.3 EditProductPage
- **File**: [edit_product_page.dart](file:///d:/flutter_projects/new/lib/features/products/presentation/pages/edit_product_page.dart)
- **Route**: `RouteNames.editProduct` (`/edit-product`)

```text
Scaffold
├── AppBar (title: "Edit Product")
└── SingleChildScrollView
    └── ProductForm
        └── Form (_formKey)
            └── Column (stretch)
                ├── AppTextField ("Product Name *", controller: _nameController)
                ├── AppDropdown ("Category *", value: _selectedCategory)
                ├── Row
                │   ├── Expanded -> AppTextField ("Brand *", controller: _brandController)
                │   └── Expanded -> AppTextField ("SKU / Barcode *", controller: _skuController)
                ├── Row
                │   ├── Expanded -> AppTextField ("Purchase Price ($) *", controller: _purchasePriceController)
                │   └── Expanded -> AppTextField ("Selling Price ($) *", controller: _sellingPriceController)
                ├── AppTextField ("Stock Quantity *", controller: _stockController)
                ├── SizedBox (height: 24)
                └── AppButton ("Save Product", onPressed: onSubmit)
```

---

### 3.4 ProductDetailsPage
- **File**: [product_details_page.dart](file:///d:/flutter_projects/new/lib/features/products/presentation/pages/product_details_page.dart)
- **Route**: `RouteNames.productDetails` (`/product-details`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Product Details", leading: IconButton)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 1)
└── SafeArea
    └── ListView
        ├── Container (Purchase Order Information Card)
        │   └── Column
        │       ├── Row [Column (PO ID: "#PO-1024"), Container ("Completed" badge)]
        │       ├── Divider
        │       ├── Text ("Supplier Name"), Text ("Global Hardware Solutions")
        │       ├── Row [Column ("Order Date"), Column ("Expected Delivery")]
        │       ├── Divider
        │       ├── Row [Text ("Total Amount"), Text ("$4,250.00")]
        │       └── Text ("Notes"), Text ("Priority delivery requested...")
        ├── SizedBox (height: 16)
        ├── Container (Ordered Products Card)
        │   └── Column
        │       ├── Text ("Ordered Products")
        │       ├── OrderItem ("Heavy Duty Drill", "Qty: 10 × $250.00", "$2,500.00")
        │       ├── OrderItem ("Steel Fasteners Box", "Qty: 50 × $35.00", "$1,750.00")
        │       ├── Dashed Divider (Row of 40 small containers)
        │       ├── Row [Text ("Total Quantity"), Text ("60")]
        │       └── Row [Text ("Grand Total"), Text ("$4,250.00")]
        ├── SizedBox (height: 20)
        ├── SizedBox (height: 48) -> ElevatedButton ("Edit Purchase Order" -> OrderDetailsPage)
        ├── SizedBox (height: 10)
        ├── SizedBox (height: 48) -> OutlinedButton ("Delete Purchase Order")
        └── SizedBox (height: 10) -> OutlinedButton ("Back")
```

---

## 4. Customers Module

### 4.1 CustomersPage
- **File**: [customers_page.dart](file:///d:/flutter_projects/new/lib/features/customers/presentation/pages/customers_page.dart)
- **Route**: `RouteNames.customers` (`/customers`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Customers", leading: IconButton, actions: [IconButton(search)])
├── floatingActionButton: FloatingActionButton (Icon: add -> AddCustomerPage)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── SafeArea
    └── ListView
        ├── Container (Search Bar) -> TextField (controller: _searchController)
        ├── SizedBox (height: 14)
        ├── Container (Filter Button) -> Row [Icon (filter_list_rounded), Text ("Filter")]
        ├── SizedBox (height: 16)
        └── Customer Cards List (_buildCustomerCard)
            └── Container
                └── Column
                    ├── Text (Customer Name: "Global Hardware Supplies Ltd")
                    ├── Row [Icon (phone_outlined), Text (Phone)]
                    ├── Row [Icon (mail_outline_rounded), Text (Email)]
                    ├── Row [Icon (location_on_outlined), Text (Location)]
                    ├── Divider
                    └── Row
                        ├── Expanded -> ElevatedButton ("View" -> CustomerDetailsPage)
                        └── Expanded -> ElevatedButton ("Edit" -> EditCustomerPage)
```

---

### 4.2 AddCustomerPage
- **File**: [add_customer_page.dart](file:///d:/flutter_projects/new/lib/features/customers/presentation/pages/add_customer_page.dart)
- **Route**: `RouteNames.addCustomer` (`/add-customer`)

```text
AppScaffold (title: "Add Customer")
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── body: SingleChildScrollView
    └── Form (_formKey)
        └── Column (stretch)
            ├── FieldLabel ("Customer Name *") & TextFormField (_nameController)
            ├── FieldLabel ("Phone Number *") & TextFormField (_phoneController)
            ├── FieldLabel ("Email Address *") & TextFormField (_emailController)
            ├── FieldLabel ("GST Number") & TextFormField (_gstController)
            ├── FieldLabel ("Address *") & TextFormField (_addressController, maxLines: 3)
            ├── FieldLabel ("City *") & TextFormField (_cityController)
            ├── Row
            │   ├── Expanded -> Column [FieldLabel ("State *"), DropdownButtonFormField (_selectedState)]
            │   └── Expanded -> Column [FieldLabel ("Pincode *"), TextFormField (_pincodeController)]
            ├── SizedBox (height: 24)
            ├── SizedBox (height: 48) -> ElevatedButton ("Save Customer")
            ├── SizedBox (height: 12)
            └── SizedBox (height: 48) -> OutlinedButton ("Cancel")
```

---

### 4.3 EditCustomerPage
- **File**: [edit_customer_page.dart](file:///d:/flutter_projects/new/lib/features/customers/presentation/pages/edit_customer_page.dart)
- **Route**: `RouteNames.editCustomer` (`/edit-customer`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Edit Customer", leading: IconButton)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── SafeArea
    └── SingleChildScrollView
        └── Form (_formKey)
            └── Column (stretch)
                ├── FieldLabel ("Customer Name *") & TextFormField (_nameController)
                ├── FieldLabel ("Phone Number *") & TextFormField (_phoneController)
                ├── FieldLabel ("Email Address *") & TextFormField (_emailController)
                ├── FieldLabel ("GST Number / Tax ID") & TextFormField (_gstController)
                ├── FieldLabel ("Address *") & TextFormField (_addressController, maxLines: 3)
                ├── FieldLabel ("City *") & TextFormField (_cityController)
                ├── Row
                │   ├── Expanded -> Column [FieldLabel ("State *"), DropdownButtonFormField (_selectedState)]
                │   └── Expanded -> Column [FieldLabel ("Pincode / ZIP *"), TextFormField (_pincodeController)]
                ├── SizedBox (height: 24)
                ├── SizedBox (height: 48) -> ElevatedButton ("Update Customer")
                ├── SizedBox (height: 12)
                └── SizedBox (height: 48) -> OutlinedButton ("Cancel")
```

---

### 4.4 CustomerDetailsPage
- **File**: [customer_details_page.dart](file:///d:/flutter_projects/new/lib/features/customers/presentation/pages/customer_details_page.dart)
- **Route**: `RouteNames.customerDetails` (`/customer-details`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Customer Details", leading: IconButton)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── SafeArea
    └── ListView
        ├── Container (Customer Details Card)
        │   └── Column
        │       ├── DetailRow ("Customer Name") & Divider
        │       ├── DetailRow ("Phone Number") & Divider
        │       ├── DetailRow ("Email Address") & Divider
        │       ├── DetailRow ("GST Number") & Divider
        │       ├── DetailRow ("Address") & Divider
        │       └── Row [DetailRow(City), Vertical Divider, DetailRow(State), Vertical Divider, DetailRow(Pincode)]
        ├── SizedBox (height: 16)
        ├── Container (Recent Orders Card)
        │   └── Column
        │       ├── Text ("Recent Orders")
        │       ├── OrderRow ("#ORD-9921", "10/24/2023", "Delivered")
        │       ├── Divider
        │       └── OrderRow ("#ORD-9845", "10/20/2023", "Delivered")
        ├── SizedBox (height: 16)
        ├── Container (Recent Invoices Card)
        │   └── Column
        │       ├── Text ("Recent Invoices")
        │       ├── InvoiceRow ("#INV-8842", "10/25/2023", "$1,250.00")
        │       ├── Divider
        │       └── InvoiceRow ("#INV-8810", "10/22/2023", "$840.50")
        ├── SizedBox (height: 24)
        ├── SizedBox (height: 48) -> ElevatedButton.icon ("Edit Customer" -> EditCustomerPage)
        ├── SizedBox (height: 12)
        ├── SizedBox (height: 48) -> OutlinedButton.icon ("Delete Customer")
        └── SizedBox (height: 12) -> OutlinedButton ("Back")
```

---

## 5. Suppliers Module

### 5.1 SuppliersPage
- **File**: [suppliers_page.dart](file:///d:/flutter_projects/new/lib/features/suppliers/presentation/pages/suppliers_page.dart)
- **Route**: `RouteNames.suppliers` (`/suppliers`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Suppliers", leading: IconButton, actions: [IconButton(search)])
├── floatingActionButton: FloatingActionButton (Icon: add -> AddSupplierPage)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── SafeArea
    └── ListView
        ├── Container (Search Bar) -> TextField (controller: _searchController)
        ├── SizedBox (height: 16)
        └── Supplier Cards List (_buildSupplierCard)
            └── Container
                └── Column
                    ├── Row [Expanded -> Text (Supplier Name), [Optional] Icon]
                    ├── [Optional] Container ("PREFERRED" Badge)
                    ├── Row [Icon (phone_outlined), Text (Phone)]
                    ├── Row [Icon (mail_outline_rounded), Text (Email)]
                    ├── Row [Icon (location_on_outlined), Text (Location)]
                    ├── Divider
                    └── Row
                        ├── Expanded -> ElevatedButton ("View" -> SupplierDetailsPage)
                        └── Expanded -> ElevatedButton ("Edit" -> AddSupplierPage)
```

---

### 5.2 AddSupplierPage
- **File**: [add_supplier_page.dart](file:///d:/flutter_projects/new/lib/features/suppliers/presentation/pages/add_supplier_page.dart)
- **Route**: `RouteNames.addSupplier` (`/add-supplier`)

```text
AppScaffold (title: "Add Supplier", actions: [User initials badge "JS"])
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── body: SingleChildScrollView
    └── Form (_formKey)
        └── Column (stretch)
            ├── FieldLabel ("Supplier Name *") & TextFormField (_nameController)
            ├── FieldLabel ("Contact Person *") & TextFormField (_contactPersonController)
            ├── FieldLabel ("Phone Number *") & TextFormField (_phoneController)
            ├── FieldLabel ("Email Address *") & TextFormField (_emailController)
            ├── FieldLabel ("GST Number") & TextFormField (_gstController)
            ├── FieldLabel ("Address *") & TextFormField (_addressController, maxLines: 3)
            ├── FieldLabel ("City *") & TextFormField (_cityController)
            ├── FieldLabel ("State *") & DropdownButtonFormField (_selectedState)
            ├── FieldLabel ("Pincode *") & TextFormField (_pincodeController)
            ├── SizedBox (height: 24)
            ├── SizedBox (height: 48) -> ElevatedButton ("Save Supplier")
            ├── SizedBox (height: 12)
            └── SizedBox (height: 48) -> OutlinedButton ("Cancel")
```

---

### 5.3 SupplierDetailsPage
- **File**: [supplier_details_page.dart](file:///d:/flutter_projects/new/lib/features/suppliers/presentation/pages/supplier_details_page.dart)
- **Route**: `RouteNames.supplierDetails` (`/supplier-details`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Supplier Details", actions: [IconButton(edit), IconButton(more_vert)])
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── SafeArea
    └── ListView
        ├── Container (Summary Header Card)
        │   └── Column
        │       ├── Text ("Global Hardware Supplies")
        │       ├── Container ("ACTIVE" badge)
        │       ├── Row [Icon (badge), Text ("SUP-2024-089")]
        │       └── Row [Icon (hub), Text ("Hardware & Fasteners")]
        ├── SizedBox (height: 14)
        ├── Container (Contact Information Card)
        │   └── Column
        │       ├── Row [Icon (contact_phone), Text ("Contact Information")]
        │       ├── ContactItem (Person: "John Doe")
        │       ├── ContactItem (Mobile: "+1 555-0123")
        │       ├── ContactItem (Email: "john@globalhardware.com")
        │       ├── ContactItem (Website: "www.globalhardware.com")
        │       └── ContactItem (Address: "123 Industrial Way...")
        ├── SizedBox (height: 14)
        ├── Container (Business Information Card)
        │   └── Column
        │       ├── Row [Icon (business_center), Text ("Business Information")]
        │       ├── Row [GridBox ("GST Number"), GridBox ("PAN")]
        │       ├── Row [GridBox ("Payment Terms"), GridBox ("Delivery Time")]
        │       └── Row [GridBox ("Preferred Payment"), Expanded (empty)]
        ├── SizedBox (height: 16)
        ├── Row [Text ("Products Supplied"), InkWell ("View Inventory" -> InventoryPage)]
        ├── SizedBox (height: 12)
        ├── Row
        │   ├── Expanded -> ProductSuppliedCard ("Steel Rods (12mm)", 500 Units, "$10.00")
        │   └── Expanded -> ProductSuppliedCard ("Industrial Hex Bo...", 1,200 Units, "$0.45")
        ├── SizedBox (height: 16)
        ├── Container (Performance Summary Card)
        │   └── Column
        │       ├── Text ("Performance Summary")
        │       ├── Row [GridBox ("Total POs": 42), GridBox ("Products": 156)]
        │       ├── GridBox ("Total Purchased": "$284,500")
        │       └── GridBox ("Last Order": "Oct 22, 2023")
        ├── SizedBox (height: 16)
        ├── Text ("Recent Orders")
        ├── SizedBox (height: 12)
        ├── OrderCard ("PO-8821", "Oct 20 • $1,200", "PENDING")
        ├── OrderCard ("PO-8750", "Oct 12 • $5,400", "DELIVERED")
        └── OrderCard ("PO-8690", "Oct 05 • $2,100", "DELIVERED")
```

---

## 6. Inventory & Stock Adjustment Module

### 6.1 InventoryPage
- **File**: [inventory_page.dart](file:///d:/flutter_projects/new/lib/features/inventory/presentation/pages/inventory_page.dart)
- **Route**: `RouteNames.inventory` (`/inventory`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Inventory", actions: [Stack(Bell + Badge Dot), CircleAvatar])
├── floatingActionButton: FloatingActionButton (Icon: add -> StockAdjustmentPage)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── SafeArea
    └── ListView
        ├── Container (Search Bar) -> TextField (controller: _searchController)
        ├── SizedBox (height: 16)
        └── List of Inventory Item Cards (_buildInventoryCard)
            └── Container
                └── Column
                    ├── Row [Column (Title, Subtitle), Container (Status Badge)]
                    ├── Row [Column ("Available Stock"), Column ("Minimum Stock")]
                    └── SizedBox (height: 44)
                        └── OutlinedButton ("Update Stock" -> StockDetailsPage)
```

---

### 6.2 StockDetailsPage
- **File**: [stock_details_page.dart](file:///d:/flutter_projects/new/lib/features/inventory/presentation/pages/stock_details_page.dart)
- **Route**: `RouteNames.stockDetails` (`/stock-details`)

```text
Scaffold
├── AppBar (title: "Warehouse Stock Details")
└── ListView
    ├── AppCard (Depot Summary Card)
    │   └── Column
    │       ├── Row [Text ("Main Depot (Zone A)"), Container ("Operational")]
    │       ├── Text ("Location: Bay 4, Logistics Boulevard")
    │       ├── Divider
    │       ├── InfoRow ("Total Stock Units", "1,420 units")
    │       ├── InfoRow ("Available Units", "1,340 units")
    │       ├── InfoRow ("Reserved / In Transit", "80 units")
    │       └── InfoRow ("Low Stock Items", "14 SKUs", isAlert: true)
    ├── SizedBox (height: 16)
    ├── Text ("Inventory Distribution by Aisle")
    ├── SizedBox (height: 10)
    ├── AppCard (Aisle 1 - Power Tools, 320 items, 92% full)
    ├── AppCard (Aisle 2 - Hand Tools & Fasteners, 640 items, 78% full)
    ├── AppCard (Aisle 3 - Plumbing & Electrical, 460 items, 84% full)
    ├── SizedBox (height: 24)
    └── AppButton ("Perform Stock Adjustment" -> StockAdjustmentPage)
```

---

### 6.3 StockAdjustmentPage
- **File**: [stock_adjustment_page.dart](file:///d:/flutter_projects/new/lib/features/stock_adjustment/presentation/pages/stock_adjustment_page.dart)
- **Route**: `RouteNames.stockAdjustment` (`/stock-adjustment`)

```text
Scaffold
├── AppBar (title: "Stock Adjustment")
└── SingleChildScrollView
    └── Form (_formKey)
        └── Column (stretch)
            ├── ProductSelector (_selectedProduct)
            ├── SizedBox (height: 14)
            ├── WarehouseSelector (_selectedWarehouse)
            ├── SizedBox (height: 14)
            ├── AppDropdown ("Adjustment Type *", items: Add, Deduct, Damaged, Audit)
            ├── SizedBox (height: 14)
            ├── QuantityField (controller: _qtyController)
            ├── SizedBox (height: 14)
            ├── AdjustmentReasonField (controller: _reasonController)
            ├── SizedBox (height: 24)
            └── AppButton ("Apply Adjustment", onPressed: _handleSubmit)
```

---

## 7. Orders Module

### 7.1 OrdersPage (Sales Orders)
- **File**: [orders_page.dart](file:///d:/flutter_projects/new/lib/features/orders/presentation/pages/orders_page.dart)
- **Route**: `RouteNames.orders` (`/orders`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Sales Orders", leading: IconButton, actions: [IconButton(search)])
├── floatingActionButton: FloatingActionButton (Icon: add -> CreateOrderPage)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 2)
└── SafeArea
    └── ListView
        ├── Container (_buildSearchInput) -> TextField (controller: _searchController)
        ├── SizedBox (height: 12)
        ├── InkWell (_buildFilterButton) -> Row [Icon (filter_list_rounded), Text ("Filter")]
        ├── SizedBox (height: 16)
        └── List of Sales Order Cards (_buildOrderCard)
            └── Container
                └── Column
                    ├── Row [Text (Order ID: "#SO-2001"), Container (Status Badge)]
                    ├── Text (Customer Name: "Acme Construction")
                    ├── Text (Date: "10/30/2023")
                    ├── Text (Amount: "$1,250.00")
                    └── Row
                        ├── Expanded -> ElevatedButton ("View" -> SalesOrderDetailsPage)
                        └── Expanded -> OutlinedButton ("Edit" -> OrderDetailsPage)
```

---

### 7.2 CreateOrderPage
- **File**: [create_order_page.dart](file:///d:/flutter_projects/new/lib/features/orders/presentation/pages/create_order_page.dart)
- **Route**: `RouteNames.createOrder` (`/create-order`)

```text
AppScaffold (title: "Create Purchase Order", actions: [User avatar container])
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 2)
└── body: SingleChildScrollView
    └── Form (_formKey)
        └── Column (stretch)
            ├── FieldLabel ("Supplier *") & DropdownButtonFormField (_selectedSupplier)
            ├── Row
            │   ├── Expanded -> Column [FieldLabel ("Order Date *"), TextFormField (_orderDateController)]
            │   └── Expanded -> Column [FieldLabel ("Delivery Date *"), TextFormField (_deliveryDateController)]
            ├── FieldLabel ("Product *") & DropdownButtonFormField (_selectedProduct)
            ├── Row
            │   ├── Expanded -> Column [FieldLabel ("Quantity *"), TextFormField (_quantityController)]
            │   └── Expanded -> Column [FieldLabel ("Unit Price ($) *"), TextFormField (_unitPriceController)]
            ├── FieldLabel ("Notes") & TextFormField (_notesController, maxLines: 4)
            ├── SizedBox (height: 24)
            ├── SizedBox (height: 48) -> ElevatedButton.icon ("Save Purchase Order")
            ├── SizedBox (height: 12)
            └── SizedBox (height: 48) -> OutlinedButton ("Cancel")
```

---

### 7.3 OrderDetailsPage (Edit Purchase Order)
- **File**: [order_details_page.dart](file:///d:/flutter_projects/new/lib/features/orders/presentation/pages/order_details_page.dart)
- **Route**: `RouteNames.orderDetails` (`/order-details`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Edit Purchase Order", actions: [IconButton(save), IconButton(more_vert)])
├── bottomNavigationBar: Container (white background, top border)
│   └── SafeArea (top: false)
│       └── Row
│           ├── TextButton ("Cancel")
│           ├── Spacer
│           ├── ElevatedButton ("Save Draft")
│           └── ElevatedButton.icon ("Save Changes")
└── SafeArea
    └── ListView
        ├── Container (PO Details Card)
        │   └── Column
        │       ├── Text ("PO NUMBER"), Text ("PO-2024-8991")
        │       ├── Row [Badge ("Approved"), Badge ("Partially Paid")]
        │       ├── Divider
        │       ├── Label ("Supplier *") & DropdownButtonFormField (_selectedSupplier)
        │       ├── Label ("Issue Date *") & TextFormField (_issueDateController)
        │       └── Label ("Expected Delivery") & TextFormField (_expectedDeliveryController)
        ├── SizedBox (height: 16)
        ├── Container (Line Items Card)
        │   └── Column
        │       ├── Row [Text ("Line Items"), GestureDetector ("Add Item")]
        │       ├── Container (Table Header: PRODUCT, SKU)
        │       └── ListView.separated (_lineItems)
        ├── SizedBox (height: 16)
        └── Container (Order Summary Card)
            └── Column
                ├── Text ("Order Summary")
                ├── SummaryRow ("Items Subtotal (20)", "$2,186.00")
                ├── SummaryRow ("Discount (5%)", "-$109.30")
                ├── SummaryRow ("Tax (8.5%)", "$176.51")
                ├── SummaryRow ("Shipping", "$250.00")
                └── Row [Text ("Grand Total"), Text ("$2,503.21")]
```

---

### 7.4 PurchaseOrdersPage
- **File**: [purchase_orders_page.dart](file:///d:/flutter_projects/new/lib/features/orders/presentation/pages/purchase_orders_page.dart)
- **Route**: `RouteNames.purchaseOrders` (`/purchase-orders`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Purchase Orders", leading: IconButton, actions: [IconButton(search)])
├── floatingActionButton: FloatingActionButton (Icon: add -> CreateOrderPage)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 2)
└── SafeArea
    └── ListView
        ├── Row [Expanded (_buildSearchInput), FilterButton]
        ├── SizedBox (height: 16)
        └── List of Purchase Order Cards (_buildOrderCard)
            └── Container
                └── Column
                    ├── Row [Text (PO ID: "#PO-1024"), Container (Status Badge)]
                    ├── Text (Supplier Name: "Global Hardware Solutions")
                    ├── Row [Column ("Order Date"), Column ("Total Amount")]
                    ├── Divider
                    └── Row
                        ├── Expanded -> ElevatedButton ("View" -> ProductDetailsPage)
                        └── Expanded -> OutlinedButton ("Edit" -> OrderDetailsPage)
```

---

### 7.5 SalesOrderDetailsPage
- **File**: [sales_order_details_page.dart](file:///d:/flutter_projects/new/lib/features/orders/presentation/pages/sales_order_details_page.dart)
- **Route**: `RouteNames.salesOrderDetails` (`/sales-order-details`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Sales Order Details", actions: [CircleAvatar(userAvatar)])
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 2)
└── SafeArea
    └── ListView
        ├── Container (Order Information Card)
        │   └── Column
        │       ├── Row [Column (ID: "#SO-2001"), Container ("Pending" badge)]
        │       ├── Divider
        │       ├── Text ("Customer Name"), Text ("Acme Construction Co.")
        │       ├── Row [Column ("Order Date"), Column ("Delivery Date")]
        │       ├── Text ("Delivery Address"), Text ("123 Industrial Way...")
        │       ├── Divider
        │       ├── Text ("Notes"), Text ("Customer requested afternoon delivery.")
        │       └── Row [Text ("Total Amount"), Text ("$1,250.00")]
        ├── SizedBox (height: 16)
        ├── Container (Ordered Products Card)
        │   └── Column
        │       ├── Text ("Ordered Products")
        │       ├── ProductRow ("Heavy Duty Drill", "Qty: 2", "$500.00")
        │       ├── Divider
        │       ├── ProductRow ("Steel Fasteners Box", "Qty: 5", "$250.00")
        │       └── Container (Summary Box: Total Quantity: 7, Grand Total: $1,250.00)
        ├── SizedBox (height: 20)
        ├── SizedBox (height: 48) -> ElevatedButton.icon ("Edit Sales Order" -> OrderDetailsPage)
        ├── SizedBox (height: 10)
        ├── SizedBox (height: 48) -> OutlinedButton.icon ("Delete Sales Order")
        ├── SizedBox (height: 10)
        ├── SizedBox (height: 48) -> OutlinedButton.icon ("Back")
        └── SizedBox (height: 10) -> OutlinedButton ("Invoice" -> InvoiceDetailsPage)
```

---

## 8. Reports & Invoices Module

### 8.1 ReportsPage
- **File**: [reports_page.dart](file:///d:/flutter_projects/new/lib/features/reports/presentation/pages/reports_page.dart)
- **Route**: `RouteNames.reports` (`/reports`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Reports", leading: IconButton, actions: [IconButton(search)])
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 3)
└── SafeArea
    └── ListView
        ├── Container (_buildSearchInput) -> TextField (controller: _searchController)
        ├── SizedBox (height: 16)
        └── List of 7 Report Cards (_buildReportCard)
            └── Container
                └── Column
                    ├── Row [Container (Icon Badge), Expanded -> Column [Text (Title), Text (Description)]]
                    └── Align (right) -> GestureDetector -> Text ("View Report")
```

---

### 8.2 ReportDetailsPage
- **File**: [report_details_page.dart](file:///d:/flutter_projects/new/lib/features/reports/presentation/pages/report_details_page.dart)
- **Route**: `RouteNames.reportDetails` (`/report-details`)

```text
Scaffold
├── AppBar (title: "Detailed Revenue Report", actions: [IconButton(download_rounded)])
└── ListView
    ├── Row
    │   ├── Expanded -> MetricCard ("Gross Revenue", "$42,850.00")
    │   └── Expanded -> MetricCard ("Net Margin", "28.4%")
    ├── SizedBox (height: 20)
    ├── Text ("Sales Breakdown by Category")
    ├── ReportTable
    ├── SizedBox (height: 20)
    ├── Text ("Top Performing Items")
    └── AppCard
        └── Column
            ├── TopItem ("1. DeWalt Cordless Drill 20V", "184 units", "$27,598.16")
            ├── Divider
            ├── TopItem ("2. Stanley Claw Hammer 16oz", "342 units", "$6,327.00")
            ├── Divider
            └── TopItem ("3. Bosch Laser Measure 65ft", "92 units", "$4,508.00")
```

---

### 8.3 InvoicesPage
- **File**: [invoices_page.dart](file:///d:/flutter_projects/new/lib/features/reports/presentation/pages/invoices_page.dart)
- **Route**: `RouteNames.invoices` (`/invoices`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Invoices", leading: IconButton, actions: [IconButton(search)])
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 2)
└── SafeArea
    └── ListView
        ├── Row [Expanded (TextField "Search Invoice"), Container (tune IconButton)]
        ├── SizedBox (height: 16)
        └── List of Invoice Cards (_buildInvoiceCard)
            └── Container
                └── Column
                    ├── Row [Text (Invoice ID: "#INV-5001"), Container (Status Badge)]
                    ├── Text (Customer Name: "Acme Construction")
                    ├── Row [Text (Date: "10/30/2023"), Text (Amount: "$1,250.00")]
                    ├── Divider
                    └── Row
                        ├── Expanded -> ElevatedButton ("View" -> InvoiceDetailsPage)
                        └── Expanded -> ElevatedButton.icon ("Download")
```

---

### 8.4 InvoiceDetailsPage
- **File**: [invoice_details_page.dart](file:///d:/flutter_projects/new/lib/features/reports/presentation/pages/invoice_details_page.dart)
- **Route**: `RouteNames.invoiceDetails` (`/invoice-details`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Invoice Details", leading: IconButton, actions: [IconButton(search)])
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 2)
└── SafeArea
    └── ListView
        ├── Container (Invoice Information Card)
        │   └── Column
        │       ├── Row [Text ("INVOICE INFORMATION"), Container ("Unpaid")]
        │       ├── Row [Column ("Invoice Number"), Column ("Date")]
        │       └── Column ("Sales Order ID": "SO-8921")
        ├── SizedBox (height: 16)
        ├── Container (Customer Information Card)
        │   └── Column
        │       ├── Text ("CUSTOMER INFORMATION")
        │       ├── Row [Icon (apartment), Text ("Industrial Builds Ltd")]
        │       ├── Row [Icon (phone), Text ("+1 (555) 123-4567")]
        │       └── Row [Icon (mail), Text ("procurement@industrialbuilds.com")]
        ├── SizedBox (height: 16)
        ├── Container (Purchased Products Card)
        │   └── Column
        │       ├── Text ("PURCHASED PRODUCTS")
        │       ├── ProductItem ("Steel Rods (12mm)", "Qty: 100 • $10.00", "$1,000.00")
        │       ├── Divider
        │       ├── ProductItem ("Heavy Duty Fasteners", "Qty: 500 • $0.50", "$250.00")
        │       ├── Divider
        │       └── ProductItem ("Concrete Anchors", "Qty: 200 • $2.25", "$450.00")
        ├── SizedBox (height: 16)
        ├── Container (Payment Summary Card)
        │   └── Column
        │       ├── Text ("PAYMENT SUMMARY")
        │       ├── SummaryLine ("Subtotal", "$1,700.00")
        │       ├── SummaryLine ("Tax (8%)", "$136.00")
        │       ├── SummaryLine ("Discount", "-$0.00")
        │       ├── Divider
        │       └── Row [Text ("Grand Total"), Text ("$1,836.00")]
        ├── SizedBox (height: 24)
        ├── SizedBox (height: 48) -> ElevatedButton.icon ("Mark as Paid")
        └── SizedBox (height: 12) -> OutlinedButton.icon ("Download Invoice")
```

---

## 9. Profile, Settings & User Access Module

### 9.1 ProfilePage
- **File**: [profile_page.dart](file:///d:/flutter_projects/new/lib/features/profile/presentation/pages/profile_page.dart)
- **Route**: `RouteNames.profile` (`/profile`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "My Profile", actions: [IconButton(settings_outlined -> SettingsPage)])
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 4)
└── SafeArea
    └── ListView
        ├── Container (Profile Header Card)
        │   └── Column [CircleAvatar (userAvatar), Text ("Rajvi Lunagariya"), Text ("Procurement Lead")]
        ├── SizedBox (height: 16)
        ├── Field ("Full Name", controller: _nameController)
        ├── Field ("Email Address", controller: _emailController)
        ├── Field ("Phone Number", controller: _phoneController)
        ├── Field ("Company Name", controller: _companyController)
        ├── SizedBox (height: 16)
        ├── Container (Security Card)
        │   └── Column
        │       ├── Row [Icon (shield_outlined), Text ("Security")]
        │       ├── Field ("Current Password", controller: _currentPasswordController, obscureText: true)
        │       ├── Field ("New Password", controller: _newPasswordController, obscureText: true)
        │       └── Field ("Confirm New Password", controller: _confirmPasswordController, obscureText: true)
        ├── SizedBox (height: 20)
        ├── SizedBox (height: 48) -> ElevatedButton ("Save Changes")
        ├── SizedBox (height: 10) -> OutlinedButton ("Change Password")
        └── SizedBox (height: 10) -> OutlinedButton.icon ("Logout" -> LoginPage)
```

---

### 9.2 SettingsPage
- **File**: [settings_page.dart](file:///d:/flutter_projects/new/lib/features/profile/presentation/pages/settings_page.dart)
- **Route**: `RouteNames.settings` (`/settings`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Settings", leading: IconButton)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 4)
└── SafeArea
    └── ListView
        ├── Container (Card: General)
        │   └── Column
        │       ├── DropdownField ("Language", value: _selectedLanguage)
        │       └── DropdownField ("Default Currency", value: _selectedCurrency)
        ├── SizedBox (height: 14)
        ├── Container (Card: Notifications)
        │   └── Column
        │       ├── SwitchRow ("Order Notifications", value: _orderNotifications)
        │       ├── SwitchRow ("Delivery Notifications", value: _deliveryNotifications)
        │       └── SwitchRow ("Inventory Alerts", value: _inventoryAlerts)
        ├── SizedBox (height: 14)
        ├── Container (Card: Application)
        │   └── Column
        │       ├── Row [Text ("App Version"), Text ("v2.4.0")]
        │       ├── NavigationRow ("Privacy Policy")
        │       └── NavigationRow ("Terms & Conditions")
        ├── SizedBox (height: 14)
        ├── Container (Card: Account)
        │   └── OutlinedButton.icon ("Logout" -> LoginPage)
        ├── SizedBox (height: 20)
        └── SizedBox (height: 48) -> ElevatedButton ("Save Settings")
```

---

### 9.3 UsersPage
- **File**: [users_page.dart](file:///d:/flutter_projects/new/lib/features/profile/presentation/pages/users_page.dart)
- **Route**: `RouteNames.users` (`/users`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Users", actions: [IconButton(search)])
├── floatingActionButton: FloatingActionButton (Icon: person_add -> RolesPermissionsPage)
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── SafeArea
    └── ListView
        ├── Container (Search Bar) -> TextField (controller: _searchController)
        ├── SizedBox (height: 14)
        ├── InkWell (_showFilterModal) -> Row [Icon (filter_list_rounded), Text ("Filter")]
        │   └── [Triggers Modal] showModalBottomSheet -> Wrap [ChoiceChip ("All", "Admin", "Manager", "Staff")]
        ├── SizedBox (height: 16)
        └── User Cards List (_buildUserCard)
            └── Container
                └── Column
                    ├── Row [Text (User Name), Container (Role Badge)]
                    ├── Text (Email)
                    ├── Row [Icon (phone_outlined), Text (Phone)]
                    ├── Divider
                    └── Row
                        ├── InkWell ("View" -> RolesPermissionsPage)
                        └── InkWell ("Edit" -> RolesPermissionsPage)
```

---

### 9.4 RolesPermissionsPage
- **File**: [roles_permissions_page.dart](file:///d:/flutter_projects/new/lib/features/profile/presentation/pages/roles_permissions_page.dart)
- **Route**: `RouteNames.rolesPermissions` (`/roles-permissions`)

```text
Scaffold (backgroundColor: #F6FBF4)
├── AppBar (title: "Roles & Permissions", actions: [IconButton(search)])
├── bottomNavigationBar: AppBottomNavigation (currentIndex: 0)
└── SafeArea
    └── ListView
        ├── Text ("Select Role")
        ├── SizedBox (height: 8)
        ├── Container (Role Dropdown: Admin, Manager, Staff, Viewer)
        ├── SizedBox (height: 16)
        ├── Container (Permissions Card)
        │   └── Column
        │       ├── Padding -> Row [Icon (shield_outlined), Text ("Permissions")]
        │       ├── Divider
        │       └── ListView.separated (11 Permissions with Checkboxes)
        │           └── InkWell (onTap: toggle)
        │               └── Row [Text (Permission Name), Checkbox (value: isChecked)]
        ├── SizedBox (height: 24)
        ├── SizedBox (height: 50) -> ElevatedButton.icon ("Save Permissions")
        └── SizedBox (height: 12) -> OutlinedButton ("Cancel")
```
