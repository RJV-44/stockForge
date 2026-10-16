# StockForge - Widget Reference Guide

This document provides a comprehensive catalog of all Flutter widgets used across **StockForge**, detailing the file location, widget class, widget type, purpose, and key properties/usage.

---

## Table of Contents
1. [Core & Reusable UI Widgets](#1-core--reusable-ui-widgets)
2. [Shared Layout & Scaffold Widgets](#2-shared-layout--scaffold-widgets)
3. [Feature Widgets](#3-feature-widgets)
   - [Dashboard](#dashboard)
   - [Products](#products)
   - [Orders](#orders)
   - [Stock Adjustment](#stock-adjustment)
   - [Reports](#reports)
   - [Profile & Settings](#profile--settings)
4. [Page / Screen Widgets](#4-page--screen-widgets)
   - [Authentication & Splash](#authentication--splash)
   - [Dashboard & Inventory](#dashboard--inventory)
   - [Products Management](#products-management)
   - [Orders Management](#orders-management)
   - [Suppliers Management](#suppliers-management)
   - [Customers Management](#customers-management)
   - [Stock Adjustment](#stock-adjustment-1)
   - [Reports & Invoices](#reports--invoices)
   - [Profile, Users & Settings](#profile-users--settings)
5. [Summary Architecture Matrix](#5-summary-architecture-matrix)

---

## 1. Core & Reusable UI Widgets
Location: `lib/core/widgets/`

| Widget Name | Type | File Path | Purpose & Description | Key Props / Parameters |
| :--- | :--- | :--- | :--- | :--- |
| **`AppButton`** | `StatelessWidget` | [app_button.dart](file:///D:/stockForge/lib/core/widgets/app_button.dart) | Standardized primary or outlined action button with loading spinner state and optional leading icon. | `text`, `onPressed`, `isLoading`, `isOutlined`, `icon` |
| **`AppCard`** | `StatelessWidget` | [app_card.dart](file:///D:/stockForge/lib/core/widgets/app_card.dart) | Base surface container styled with border radius, custom border, subtle elevation shadow, and optional tap callback. | `child`, `padding`, `onTap` |
| **`AppDropdown<T>`** | `StatelessWidget` | [app_dropdown.dart](file:///D:/stockForge/lib/core/widgets/app_dropdown.dart) | Form dropdown field wrapper with an optional field label, validator support, and custom border decoration. | `label`, `hint`, `value`, `items`, `onChanged`, `validator` |
| **`AppTextField`** | `StatelessWidget` | [app_text_field.dart](file:///D:/stockForge/lib/core/widgets/app_text_field.dart) | Form text input supporting obscuring (passwords), multi-line text, validation error styling, and prefix/suffix widgets. | `label`, `hint`, `controller`, `obscureText`, `keyboardType`, `validator`, `prefixIcon`, `suffixIcon`, `maxLines` |
| **`AppLoader`** | `StatelessWidget` | [app_loader.dart](file:///D:/stockForge/lib/core/widgets/app_loader.dart) | Centered circular loading indicator with brand styling and an optional status/loading message text. | `message` |
| **`AppError`** | `StatelessWidget` | [app_error.dart](file:///D:/stockForge/lib/core/widgets/app_error.dart) | Error state presentation showing an error icon, error message, and an optional retry action button. | `message`, `onRetry` |
| **`AppEmptyState`** | `StatelessWidget` | [app_empty_state.dart](file:///D:/stockForge/lib/core/widgets/app_empty_state.dart) | Generic placeholder view displayed when lists or sections have no data; includes icon, title, description, and action button. | `title`, `description`, `icon`, `action` |

---

## 2. Shared Layout & Scaffold Widgets
Location: `lib/shared/widgets/`

| Widget Name | Type | File Path | Purpose & Description | Key Props / Parameters |
| :--- | :--- | :--- | :--- | :--- |
| **`AppScaffold`** | `StatelessWidget` | [app_scaffold.dart](file:///D:/stockForge/lib/shared/widgets/app_scaffold.dart) | Unified application page shell containing an `AppBar`, body content, floating action button, navigation drawer, and bottom navigation bar. | `title`, `body`, `actions`, `leading`, `floatingActionButton`, `bottomNavigationBar`, `drawer`, `showAppBar`, `backgroundColor`, `titleColor` |
| **`AppTopBar`** | `StatelessWidget` | [app_top_bar.dart](file:///D:/stockForge/lib/shared/widgets/app_top_bar.dart) | Custom implementation of `PreferredSizeWidget` providing a standardized top application header bar. | `title`, `actions`, `leading` |
| **`AppBottomNavigation`** | `StatelessWidget` | [app_bottom_navigation.dart](file:///D:/stockForge/lib/shared/widgets/app_bottom_navigation.dart) | Bottom navigation bar displaying main root module destinations (Dashboard, Inventory, Orders, Reports, Profile). | `currentIndex`, `onTap` |
| **`DataTableCard`** | `StatelessWidget` | [data_table_card.dart](file:///D:/stockForge/lib/shared/widgets/data_table_card.dart) | Horizontally scrollable data table enclosed inside an `AppCard`, standardizing data grid presentations. | `columns`, `rows` |
| **`FormLabel`** | `StatelessWidget` | [form_label.dart](file:///D:/stockForge/lib/shared/widgets/form_label.dart) | Standard form field text label with support for red asterisk required indicator (`*`). | `text`, `isRequired` |
| **`SectionHeader`** | `StatelessWidget` | [section_header.dart](file:///D:/stockForge/lib/shared/widgets/section_header.dart) | Section headline row displaying a bold title with an optional trailing action widget (e.g., "See All" button). | `title`, `action` |
| **`SummaryCard`** | `StatelessWidget` | [summary_card.dart](file:///D:/stockForge/lib/shared/widgets/summary_card.dart) | Quick statistic card featuring an icon badge, title label, and formatted value. | `title`, `value`, `icon`, `iconColor` |

---

## 3. Feature Widgets
Location: `lib/features/<feature>/presentation/widgets/`

### Dashboard
*Location: `lib/features/dashboard/presentation/widgets/`*

| Widget Name | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`DashboardHeader`** | `StatelessWidget` | [dashboard_header.dart](file:///D:/stockForge/lib/features/dashboard/presentation/widgets/dashboard_header.dart) | Renders user greeting, company/warehouse title, avatar, and quick alert/notification indicators. |
| **`StatisticsCard`** | `StatelessWidget` | [statistics_card.dart](file:///D:/stockForge/lib/features/dashboard/presentation/widgets/statistics_card.dart) | Key KPI metrics card showing statistics, trend indicators (e.g. +12% this week), custom color coding, and tap interactions. |
| **`SalesSummary`** | `StatelessWidget` | [sales_summary.dart](file:///D:/stockForge/lib/features/dashboard/presentation/widgets/sales_summary.dart) | Overview card summarizing weekly sales metrics: Total Revenue, Items Sold, and Pending Orders. |
| **`RecentOrders`** | `StatelessWidget` | [recent_orders.dart](file:///D:/stockForge/lib/features/dashboard/presentation/widgets/recent_orders.dart) | Displays a list of latest orders with customer name, order total, and progress badge. |

### Products
*Location: `lib/features/products/presentation/widgets/`*

| Widget Name | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`ProductCard`** | `StatelessWidget` | [product_card.dart](file:///D:/stockForge/lib/features/products/presentation/widgets/product_card.dart) | Item card displaying hardware product details: thumbnail placeholder, name, SKU, category tag, price, and stock levels. |
| **`ProductSearch`** | `StatelessWidget` | [product_search.dart](file:///D:/stockForge/lib/features/products/presentation/widgets/product_search.dart) | Dedicated search input field for real-time hardware item filtering by name, SKU, or barcode. |
| **`ProductFilter`** | `StatelessWidget` | [product_filter.dart](file:///D:/stockForge/lib/features/products/presentation/widgets/product_filter.dart) | Horizontal chip selector for categorizing products (e.g., Power Tools, Hand Tools, Fasteners, Plumbing, Electrical). |
| **`ProductForm`** | `StatefulWidget` | [product_form.dart](file:///D:/stockForge/lib/features/products/presentation/widgets/product_form.dart) | Comprehensive input form for creating or editing hardware items (name, category, brand, SKU, purchase price, selling price, stock). |

### Orders
*Location: `lib/features/orders/presentation/widgets/`*

| Widget Name | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`OrderCard`** | `StatelessWidget` | [order_card.dart](file:///D:/stockForge/lib/features/orders/presentation/widgets/order_card.dart) | Displays summary card for an individual order with customer name, date, total amount, and status badge. |
| **`OrderStatusBadge`** | `StatelessWidget` | [order_status_badge.dart](file:///D:/stockForge/lib/features/orders/presentation/widgets/order_status_badge.dart) | Color-coded status badge indicator (Completed, Delivered, Processing, Pending, Cancelled). |
| **`OrderTable`** | `StatelessWidget` | [order_table.dart](file:///D:/stockForge/lib/features/orders/presentation/widgets/order_table.dart) | Tabular view of purchase or sales orders rendered with columns for Order ID, Date, Customer, Items count, Total, and Status. |

### Stock Adjustment
*Location: `lib/features/stock_adjustment/presentation/widgets/`*

| Widget Name | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`ProductSelector`** | `StatelessWidget` | [product_selector.dart](file:///D:/stockForge/lib/features/stock_adjustment/presentation/widgets/product_selector.dart) | Dropdown selector to choose the hardware product for stock count reconciliation. |
| **`WarehouseSelector`** | `StatelessWidget` | [warehouse_selector.dart](file:///D:/stockForge/lib/features/stock_adjustment/presentation/widgets/warehouse_selector.dart) | Dropdown selector allowing warehouse location selection (e.g., Main Depot Zone A, Distribution Center Zone B). |
| **`QuantityField`** | `StatelessWidget` | [quantity_field.dart](file:///D:/stockForge/lib/features/stock_adjustment/presentation/widgets/quantity_field.dart) | Numeric text field supporting positive or negative values (`+/-`) for stock addition or deduction. |
| **`AdjustmentReasonField`** | `StatelessWidget` | [adjustment_reason_field.dart](file:///D:/stockForge/lib/features/stock_adjustment/presentation/widgets/adjustment_reason_field.dart) | Multi-line text field validating adjustment reasons (e.g., cycle count correction, damaged goods, received shipment). |

### Reports
*Location: `lib/features/reports/presentation/widgets/`*

| Widget Name | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`ReportCard`** | `StatelessWidget` | [report_card.dart](file:///D:/stockForge/lib/features/reports/presentation/widgets/report_card.dart) | Interactive navigation card for available report categories (Sales, Inventory Valuation, Low Stock alerts, etc.). |
| **`ReportFilter`** | `StatelessWidget` | [report_filter.dart](file:///D:/stockForge/lib/features/reports/presentation/widgets/report_filter.dart) | Filter chips for time intervals (Today, This Week, This Month, Custom Range). |
| **`ReportTable`** | `StatelessWidget` | [report_table.dart](file:///D:/stockForge/lib/features/reports/presentation/widgets/report_table.dart) | Data table summarizing category-wise sales, units sold, average price, and gross profit. |

### Profile & Settings
*Location: `lib/features/profile/presentation/widgets/`*

| Widget Name | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`ProfileHeader`** | `StatelessWidget` | [profile_header.dart](file:///D:/stockForge/lib/features/profile/presentation/widgets/profile_header.dart) | Displays user avatar circle, full name, email address, and assigned system role (e.g. Admin, Manager). |
| **`ProfileMenuItem`** | `StatelessWidget` | [profile_menu_item.dart](file:///D:/stockForge/lib/features/profile/presentation/widgets/profile_menu_item.dart) | Standard list tile with leading icon, title label, and chevron arrow for profile navigation items. |
| **`SettingsItem`** | `StatelessWidget` | [settings_item.dart](file:///D:/stockForge/lib/features/profile/presentation/widgets/settings_item.dart) | Row item layout pairing setting labels with trailing switch toggles or selectors. |

---

## 4. Page / Screen Widgets
Location: `lib/features/<feature>/presentation/pages/`

### Authentication & Splash
| Page Widget | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`SplashPage`** | `StatefulWidget` | [splash_page.dart](file:///D:/stockForge/lib/features/splash/presentation/pages/splash_page.dart) | Splash screen handling initial app startup, theme initialization, and authentication route check. |
| **`LoginPage`** | `StatefulWidget` | [login_page.dart](file:///D:/stockForge/lib/features/auth/presentation/pages/login_page.dart) | User login interface with email, password credentials, and navigation to password reset. |
| **`ForgotPasswordPage`** | `StatefulWidget` | [forgot_password_page.dart](file:///D:/stockForge/lib/features/auth/presentation/pages/forgot_password_page.dart) | Password recovery request screen triggering OTP dispatch to registered user email. |
| **`OtpVerificationPage`** | `StatefulWidget` | [otp_verification_page.dart](file:///D:/stockForge/lib/features/auth/presentation/pages/otp_verification_page.dart) | 6-digit OTP code verification interface with countdown timer and resend option. |
| **`ResetPasswordPage`** | `StatefulWidget` | [reset_password_page.dart](file:///D:/stockForge/lib/features/auth/presentation/pages/reset_password_page.dart) | Allows users to enter and confirm their new password after successful OTP verification. |

### Dashboard & Inventory
| Page Widget | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`DashboardPage`** | `StatefulWidget` | [dashboard_page.dart](file:///D:/stockForge/lib/features/dashboard/presentation/pages/dashboard_page.dart) | Main executive dashboard summarizing sales, low stock alerts, quick actions, and recent activity. |
| **`InventoryPage`** | `StatefulWidget` | [inventory_page.dart](file:///D:/stockForge/lib/features/inventory/presentation/pages/inventory_page.dart) | Real-time warehouse inventory browser showing stock levels, reorder thresholds, and warehouse allocations. |
| **`StockDetailsPage`** | `StatelessWidget` | [stock_details_page.dart](file:///D:/stockForge/lib/features/inventory/presentation/pages/stock_details_page.dart) | Detailed stock audit screen displaying warehouse-specific quantities, batch numbers, and stock movement logs. |

### Products Management
| Page Widget | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`ProductsPage`** | `StatefulWidget` | [products_page.dart](file:///D:/stockForge/lib/features/products/presentation/pages/products_page.dart) | Product catalog listing screen with category chips, search filters, and FAB to add new items. |
| **`ProductDetailsPage`** | `StatefulWidget` | [product_details_page.dart](file:///D:/stockForge/lib/features/products/presentation/pages/product_details_page.dart) | Single product view showing specifications, price margins, supplier information, and stock history. |
| **`AddProductPage`** | `StatefulWidget` | [add_product_page.dart](file:///D:/stockForge/lib/features/products/presentation/pages/add_product_page.dart) | Screen for registering a new hardware product into the catalog. |
| **`EditProductPage`** | `StatelessWidget` | [edit_product_page.dart](file:///D:/stockForge/lib/features/products/presentation/pages/edit_product_page.dart) | Screen for updating pricing, SKU, description, and details of an existing product. |

### Orders Management
| Page Widget | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`OrdersPage`** | `StatefulWidget` | [orders_page.dart](file:///D:/stockForge/lib/features/orders/presentation/pages/orders_page.dart) | Overview of sales and customer orders with status filter tabs and search. |
| **`PurchaseOrdersPage`** | `StatefulWidget` | [purchase_orders_page.dart](file:///D:/stockForge/lib/features/orders/presentation/pages/purchase_orders_page.dart) | Dedicated list of purchase orders issued to hardware vendors and suppliers. |
| **`CreateOrderPage`** | `StatefulWidget` | [create_order_page.dart](file:///D:/stockForge/lib/features/orders/presentation/pages/create_order_page.dart) | Multi-item order creation form for customers with line items, quantity, tax, and discount calculation. |
| **`OrderDetailsPage`** | `StatefulWidget` | [order_details_page.dart](file:///D:/stockForge/lib/features/orders/presentation/pages/order_details_page.dart) | General order details view with itemized summary, tracking timeline, and payment status. |
| **`SalesOrderDetailsPage`** | `StatefulWidget` | [sales_order_details_page.dart](file:///D:/stockForge/lib/features/orders/presentation/pages/sales_order_details_page.dart) | Detailed sales order invoice preview and fulfillment workflow management. |

### Suppliers Management
| Page Widget | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`SuppliersPage`** | `StatefulWidget` | [suppliers_page.dart](file:///D:/stockForge/lib/features/suppliers/presentation/pages/suppliers_page.dart) | List of hardware suppliers, contact persons, payment terms, and active catalogs. |
| **`SupplierDetailsPage`** | `StatefulWidget` | [supplier_details_page.dart](file:///D:/stockForge/lib/features/suppliers/presentation/pages/supplier_details_page.dart) | Supplier profile showing past purchase orders, contact details, and performance metrics. |
| **`AddSupplierPage`** | `StatefulWidget` | [add_supplier_page.dart](file:///D:/stockForge/lib/features/suppliers/presentation/pages/add_supplier_page.dart) | Form for adding a new vendor/supplier (company name, GST/Tax ID, address, phone). |

### Customers Management
| Page Widget | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`CustomersPage`** | `StatefulWidget` | [customers_page.dart](file:///D:/stockForge/lib/features/customers/presentation/pages/customers_page.dart) | Customer directory showing commercial accounts, contact info, and total revenue spent. |
| **`CustomerDetailsPage`** | `StatefulWidget` | [customer_details_page.dart](file:///D:/stockForge/lib/features/customers/presentation/pages/customer_details_page.dart) | Customer view with order history, credit balance, and contact information. |
| **`AddCustomerPage`** | `StatefulWidget` | [add_customer_page.dart](file:///D:/stockForge/lib/features/customers/presentation/pages/add_customer_page.dart) | Form to register a new retail or wholesale client. |
| **`EditCustomerPage`** | `StatefulWidget` | [edit_customer_page.dart](file:///D:/stockForge/lib/features/customers/presentation/pages/edit_customer_page.dart) | Screen to update client information, billing address, and credit limits. |

### Stock Adjustment
| Page Widget | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`StockAdjustmentPage`** | `StatefulWidget` | [stock_adjustment_page.dart](file:///D:/stockForge/lib/features/stock_adjustment/presentation/pages/stock_adjustment_page.dart) | Manual stock count adjustment interface allowing warehouse managers to log damaged, lost, or received inventory. |

### Reports & Invoices
| Page Widget | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`ReportsPage`** | `StatefulWidget` | [reports_page.dart](file:///D:/stockForge/lib/features/reports/presentation/pages/reports_page.dart) | Reports hub providing access to sales performance, profit margins, inventory turnover, and tax analytics. |
| **`ReportDetailsPage`** | `StatelessWidget` | [report_details_page.dart](file:///D:/stockForge/lib/features/reports/presentation/pages/report_details_page.dart) | Detailed breakdown of a specific generated report with export and printing options. |
| **`InvoicesPage`** | `StatefulWidget` | [invoices_page.dart](file:///D:/stockForge/lib/features/reports/presentation/pages/invoices_page.dart) | Searchable listing of all generated customer billing invoices with payment status filters. |
| **`InvoiceDetailsPage`** | `StatefulWidget` | [invoice_details_page.dart](file:///D:/stockForge/lib/features/reports/presentation/pages/invoice_details_page.dart) | Formal invoice preview with itemized tax invoice layout, download, and share actions. |

### Profile, Users & Settings
| Page Widget | Type | File Path | Purpose & Description |
| :--- | :--- | :--- | :--- |
| **`ProfilePage`** | `StatefulWidget` | [profile_page.dart](file:///D:/stockForge/lib/features/profile/presentation/pages/profile_page.dart) | User profile screen with account info, settings links, security preferences, and logout. |
| **`UsersPage`** | `StatefulWidget` | [users_page.dart](file:///D:/stockForge/lib/features/profile/presentation/pages/users_page.dart) | User management portal to view team members, add staff, and toggle user active states. |
| **`RolesPermissionsPage`** | `StatefulWidget` | [roles_permissions_page.dart](file:///D:/stockForge/lib/features/profile/presentation/pages/roles_permissions_page.dart) | Access control configuration defining permissions for Admin, Inventory Manager, Sales Staff, and Cashier. |
| **`SettingsPage`** | `StatefulWidget` | [settings_page.dart](file:///D:/stockForge/lib/features/profile/presentation/pages/settings_page.dart) | Application configuration page for currency, theme mode, notification preferences, and backup settings. |

---

## 5. Summary Architecture Matrix

```
StockForge Architecture
├── Core Widgets (lib/core/widgets/)
│   ├── AppButton            ──> Primary & Outlined Button
│   ├── AppCard              ──> Surface card container
│   ├── AppDropdown          ──> Form dropdown select
│   ├── AppTextField         ──> Text & Password inputs
│   ├── AppLoader            ──> Progress spinners
│   ├── AppError             ──> Error handling & retry
│   └── AppEmptyState        ──> Empty list placeholders
│
├── Shared Widgets (lib/shared/widgets/)
│   ├── AppScaffold          ──> Unified page layout shell
│   ├── AppTopBar            ──> Reusable AppBar
│   ├── AppBottomNavigation  ──> 5-tab main bottom bar
│   ├── DataTableCard        ──> Horizontal data tables
│   ├── FormLabel            ──> Required field labels
│   ├── SectionHeader        ──> Section title + action
│   └── SummaryCard          ──> Stat highlight card
│
└── Feature Widgets (lib/features/*/presentation/widgets/)
    ├── Dashboard            ──> Header, Sales summary, Orders, Stats
    ├── Products             ──> Product card, Filters, Form, Search
    ├── Orders               ──> Order card, Status badge, Order table
    ├── Stock Adjustment     ──> Product & Warehouse picker, Quantity, Reason
    ├── Reports              ──> Report card, Date filters, Report table
    └── Profile              ──> Profile header, Menu items, Settings item
```
