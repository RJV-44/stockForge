import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hardware_management_system/features/customers/presentation/pages/customer_details_page.dart';
import 'package:hardware_management_system/features/orders/presentation/pages/order_details_page.dart';
import 'package:hardware_management_system/features/orders/presentation/pages/orders_page.dart';
import 'package:hardware_management_system/features/orders/presentation/pages/sales_order_details_page.dart';
import 'package:hardware_management_system/features/inventory/presentation/pages/inventory_page.dart';
import 'package:hardware_management_system/features/reports/presentation/pages/invoice_details_page.dart';
import 'package:hardware_management_system/features/products/presentation/pages/products_page.dart';
import 'package:hardware_management_system/features/products/presentation/pages/product_details_page.dart';
import 'package:hardware_management_system/features/orders/presentation/pages/purchase_orders_page.dart';
import 'package:hardware_management_system/features/reports/presentation/pages/reports_page.dart';
import 'package:hardware_management_system/features/profile/presentation/pages/profile_page.dart';
import 'package:hardware_management_system/features/profile/presentation/pages/settings_page.dart';
import 'package:hardware_management_system/features/profile/presentation/pages/users_page.dart';
import 'package:hardware_management_system/features/profile/presentation/pages/roles_permissions_page.dart';
import 'package:hardware_management_system/features/suppliers/presentation/pages/suppliers_page.dart';
import 'package:hardware_management_system/features/suppliers/presentation/pages/supplier_details_page.dart';
import 'package:hardware_management_system/features/customers/presentation/pages/customers_page.dart';
import 'package:hardware_management_system/features/reports/presentation/pages/invoices_page.dart';

void main() {
  testWidgets('CustomerDetailsPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: CustomerDetailsPage()),
    );

    // Title
    expect(find.text('Customer Details'), findsOneWidget);

    // Customer details
    expect(find.text('Global Hardware Supplies Ltd'), findsOneWidget);
    expect(find.text('+1 (555) 123-4567'), findsOneWidget);
    expect(find.text('contact@globalhw.com'), findsOneWidget);
    expect(find.text('22AAAAA0000A1Z5'), findsOneWidget);
    expect(find.text('123 Industrial Way, Suite 400'), findsOneWidget);
    expect(find.text('Chicago'), findsOneWidget);
    expect(find.text('Illinois'), findsOneWidget);
    expect(find.text('60601'), findsOneWidget);

    // Recent orders
    expect(find.text('Recent Orders'), findsOneWidget);
    expect(find.text('#ORD-9921'), findsOneWidget);
    expect(find.text('#ORD-9845'), findsOneWidget);
    expect(find.text('Delivered'), findsNWidgets(2));

    // Recent invoices
    expect(find.text('Recent Invoices'), findsOneWidget);
    expect(find.text('#INV-8842'), findsOneWidget);
    expect(find.text('#INV-8810'), findsOneWidget);
    expect(find.text('\$1,250.00'), findsOneWidget);
    expect(find.text('\$840.50'), findsOneWidget);

    // Action buttons
    expect(find.text('Edit Customer'), findsOneWidget);
    expect(find.text('Delete Customer'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
  });

  testWidgets('OrderDetailsPage renders Edit Purchase Order components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: OrderDetailsPage()),
    );

    // Header
    expect(find.text('Edit Purchase Order'), findsOneWidget);
    expect(find.text('PO-2024-8991'), findsOneWidget);
    expect(find.text('Approved'), findsOneWidget);
    expect(find.text('Partially Paid'), findsOneWidget);

    // Line items
    expect(find.text('Line Items'), findsOneWidget);
    expect(find.text('Add Item'), findsOneWidget);
    expect(find.text('Industrial Steel Bearings (Model X)'), findsOneWidget);
    expect(find.text('BRG-X-109'), findsOneWidget);
    expect(find.text('Heavy Duty Lubricant 5Gal'), findsOneWidget);
    expect(find.text('LUB-HD-5G'), findsOneWidget);

    // Summary
    expect(find.text('Order Summary'), findsOneWidget);
    expect(find.text('\$2,186.00'), findsOneWidget);
    expect(find.text('-\$109.30'), findsOneWidget);
    expect(find.text('\$2,503.21'), findsOneWidget);

    // Actions
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Save\nDraft'), findsOneWidget);
    expect(find.text('Save\nChanges'), findsOneWidget);
  });

  testWidgets('InventoryPage renders inventory list and cards correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: InventoryPage()),
    );

    // Header & Search
    expect(find.text('Inventory'), findsOneWidget);
    expect(find.text('Search Inventory'), findsOneWidget);

    // Items
    expect(find.text('Industrial Steel Beam'), findsOneWidget);
    expect(find.text('IN STOCK'), findsNWidgets(2));
    expect(find.text('1,240 Units'), findsOneWidget);

    expect(find.text('Concrete Anchor Bolts'), findsOneWidget);
    expect(find.text('LOW STOCK'), findsOneWidget);
    expect(find.text('45 Units'), findsOneWidget);

    expect(find.text('PVC Conduit Pipes'), findsOneWidget);
    expect(find.text('OUT OF STOCK'), findsOneWidget);
    expect(find.text('0 Units'), findsOneWidget);

    expect(find.text('Copper Wiring (Coil)'), findsOneWidget);
    expect(find.text('88 Coils'), findsOneWidget);

    expect(find.text('Update Stock'), findsNWidgets(4));
  });

  testWidgets('InvoiceDetailsPage renders invoice information correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: InvoiceDetailsPage()),
    );

    // Title
    expect(find.text('Invoice Details'), findsOneWidget);

    // Invoice info
    expect(find.text('INVOICE INFORMATION'), findsOneWidget);
    expect(find.text('Unpaid'), findsOneWidget);
    expect(find.text('INV-2023-001'), findsOneWidget);
    expect(find.text('Oct 24, 2023'), findsOneWidget);
    expect(find.text('SO-8921'), findsOneWidget);

    // Customer info
    expect(find.text('CUSTOMER INFORMATION'), findsOneWidget);
    expect(find.text('Industrial Builds Ltd'), findsOneWidget);
    expect(find.text('+1 (555) 123-4567'), findsOneWidget);
    expect(find.text('procurement@industrialbuilds.com'), findsOneWidget);

    // Products
    expect(find.text('PURCHASED PRODUCTS'), findsOneWidget);
    expect(find.text('Steel Rods (12mm)'), findsOneWidget);
    expect(find.text('\$1,000.00'), findsOneWidget);
    expect(find.text('Heavy Duty Fasteners'), findsOneWidget);
    expect(find.text('\$250.00'), findsOneWidget);
    expect(find.text('Concrete Anchors'), findsOneWidget);
    expect(find.text('\$450.00'), findsOneWidget);

    // Payment summary
    expect(find.text('PAYMENT SUMMARY'), findsOneWidget);
    expect(find.text('\$1,700.00'), findsOneWidget);
    expect(find.text('\$136.00'), findsOneWidget);
    expect(find.text('-\$0.00'), findsOneWidget);
    expect(find.text('Grand Total'), findsOneWidget);
    expect(find.text('\$1,836.00'), findsOneWidget);

    // Action buttons
    expect(find.text('Mark as Paid'), findsOneWidget);
    expect(find.text('Download Invoice'), findsOneWidget);
  });

  testWidgets('ProductsPage renders minimal-product Figma list correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: ProductsPage()),
    );

    // Title & Search
    expect(find.text('Products'), findsNWidgets(2));
    expect(find.text('Search Product'), findsOneWidget);
    expect(find.text('Filter'), findsOneWidget);

    // Product cards
    expect(find.text('Precision Drill Set'), findsOneWidget);
    expect(find.text('Power Tools'), findsOneWidget);
    expect(find.text('\$189.00'), findsOneWidget);
    expect(find.text('42 units'), findsOneWidget);

    expect(find.text('Heavy Duty Shelving'), findsOneWidget);
    expect(find.text('Low Stock'), findsOneWidget);
    expect(find.text('\$345.50'), findsOneWidget);
    expect(find.text('5 units'), findsOneWidget);

    expect(find.text('Industrial Air Compressor'), findsOneWidget);
    expect(find.text('Out of Stock'), findsOneWidget);
    expect(find.text('\$1,299.00'), findsOneWidget);
    expect(find.text('0 units'), findsOneWidget);

    expect(find.text('Metric Bolt Assortment'), findsOneWidget);
    expect(find.text('In Stock'), findsNWidgets(2));
    expect(find.text('\$45.99'), findsOneWidget);
    expect(find.text('150 units'), findsOneWidget);

    // View & Edit buttons
    expect(find.text('View'), findsNWidgets(4));
    expect(find.text('Edit'), findsNWidgets(4));
  });

  testWidgets('OrdersPage renders Sales Orders Figma components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: OrdersPage()),
    );

    // Header
    expect(find.text('Sales Orders'), findsOneWidget);
    expect(find.text('Search Sales Order'), findsOneWidget);
    expect(find.text('Filter'), findsOneWidget);

    // Orders
    expect(find.text('#SO-2001'), findsOneWidget);
    expect(find.text('Acme Construction'), findsOneWidget);
    expect(find.text('\$1,250.00'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);

    expect(find.text('#SO-1998'), findsOneWidget);
    expect(find.text('Lakeside Realty'), findsOneWidget);
    expect(find.text('\$890.50'), findsOneWidget);
    expect(find.text('Confirmed'), findsOneWidget);

    expect(find.text('#SO-1995'), findsOneWidget);
    expect(find.text('Urban Tech Hub'), findsOneWidget);
    expect(find.text('\$3,420.00'), findsOneWidget);

    expect(find.text('#SO-1992'), findsOneWidget);
    expect(find.text('Riverfront Lodge'), findsOneWidget);
    expect(find.text('\$540.25'), findsOneWidget);
    expect(find.text('Delivered'), findsNWidgets(2));

    expect(find.text('View'), findsNWidgets(4));
    expect(find.text('Edit'), findsNWidgets(4));
  });

  testWidgets('SalesOrderDetailsPage renders Sales Order Details Figma correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: SalesOrderDetailsPage()),
    );

    // Header
    expect(find.text('Sales Order Details'), findsOneWidget);

    // Card 1
    expect(find.text('SALES ORDER ID'), findsOneWidget);
    expect(find.text('#SO-2001'), findsOneWidget);
    expect(find.text('Pending'), findsOneWidget);
    expect(find.text('Customer Name'), findsOneWidget);
    expect(find.text('Acme Construction Co.'), findsOneWidget);
    expect(find.text('10/30/2023'), findsOneWidget);
    expect(find.text('11/05/2023'), findsOneWidget);
    expect(find.text('123 Industrial Way, North Basin, CA 90210'), findsOneWidget);
    expect(find.text('Customer requested afternoon delivery.'), findsOneWidget);
    expect(find.text('\$1,250.00'), findsNWidgets(2));

    // Card 2
    expect(find.text('Ordered Products'), findsOneWidget);
    expect(find.text('Heavy Duty Drill'), findsOneWidget);
    expect(find.text('Qty: 2'), findsOneWidget);
    expect(find.text('\$500.00'), findsOneWidget);
    expect(find.text('Steel Fasteners Box'), findsOneWidget);
    expect(find.text('Qty: 5'), findsOneWidget);
    expect(find.text('\$250.00'), findsOneWidget);
    expect(find.text('Total Quantity'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);

    // Actions
    expect(find.text('Edit Sales Order'), findsOneWidget);
    expect(find.text('Delete Sales Order'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
    expect(find.text('Invoice'), findsOneWidget);
  });

  testWidgets('ProductDetailsPage renders PO-1024 Figma components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: ProductDetailsPage()),
    );

    // Title
    expect(find.text('Product Details'), findsOneWidget);

    // Card 1
    expect(find.text('Purchase Order ID'), findsOneWidget);
    expect(find.text('#PO-1024'), findsOneWidget);
    expect(find.text('Completed'), findsOneWidget);
    expect(find.text('Supplier Name'), findsOneWidget);
    expect(find.text('Global Hardware Solutions'), findsOneWidget);
    expect(find.text('10/26/2023'), findsOneWidget);
    expect(find.text('11/05/2023'), findsOneWidget);
    expect(find.text('\$4,250.00'), findsNWidgets(2));
    expect(find.text('Priority delivery requested for warehouse restocking.'), findsOneWidget);

    // Card 2
    expect(find.text('Ordered Products'), findsOneWidget);
    expect(find.text('Heavy Duty Drill'), findsOneWidget);
    expect(find.text('Qty: 10 × \$250.00'), findsOneWidget);
    expect(find.text('\$2,500.00'), findsOneWidget);
    expect(find.text('Steel Fasteners Box'), findsOneWidget);
    expect(find.text('Qty: 50 × \$35.00'), findsOneWidget);
    expect(find.text('\$1,750.00'), findsOneWidget);
    expect(find.text('Total Quantity'), findsOneWidget);
    expect(find.text('60'), findsOneWidget);

    // Actions
    expect(find.text('Edit Purchase Order'), findsOneWidget);
    expect(find.text('Delete Purchase Order'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
  });

  testWidgets('PurchaseOrdersPage renders Purchase Orders Figma components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: PurchaseOrdersPage()),
    );

    // Header & Filter
    expect(find.text('Purchase Orders'), findsOneWidget);
    expect(find.text('Search Purchase Order'), findsOneWidget);
    expect(find.text('Filter'), findsOneWidget);

    // Cards
    expect(find.text('#PO-1024'), findsOneWidget);
    expect(find.text('Global Hardware Solutions'), findsOneWidget);
    expect(find.text('Completed'), findsOneWidget);
    expect(find.text('\$4,250.00'), findsOneWidget);

    expect(find.text('#PO-1025'), findsOneWidget);
    expect(find.text('Titan Tooling Corp'), findsOneWidget);
    expect(find.text('\$1,890.25'), findsOneWidget);

    expect(find.text('#PO-1026'), findsOneWidget);
    expect(find.text('Steel & Alloy Imports'), findsOneWidget);
    expect(find.text('Approved'), findsOneWidget);
    expect(find.text('\$12,400.00'), findsOneWidget);

    expect(find.text('#PO-1027'), findsOneWidget);
    expect(find.text('Midwest Fasteners'), findsOneWidget);
    expect(find.text('\$645.50'), findsOneWidget);

    expect(find.text('View'), findsNWidgets(4));
    expect(find.text('Edit'), findsNWidgets(4));
  });

  testWidgets('ReportsPage renders 7 report cards correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: ReportsPage()),
    );

    // Header & Search
    expect(find.text('Reports'), findsNWidgets(2));
    expect(find.text('Search Report'), findsOneWidget);

    // Report cards
    expect(find.text('Sales Report'), findsOneWidget);
    expect(find.text('Purchase Report'), findsOneWidget);
    expect(find.text('Inventory Report'), findsOneWidget);
    expect(find.text('Supplier Report'), findsOneWidget);
    expect(find.text('Customer Report'), findsOneWidget);
    expect(find.text('Delivery Report'), findsOneWidget);
    expect(find.text('Invoice Report'), findsOneWidget);
    expect(find.text('View Report'), findsNWidgets(7));
  });

  testWidgets('ProfilePage renders user profile and security fields correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: ProfilePage()),
    );

    // Header & Info
    expect(find.text('My Profile'), findsOneWidget);
    expect(find.text('Rajvi Lunagariya'), findsOneWidget);
    expect(find.text('Procurement Lead'), findsOneWidget);

    // Form labels
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Company Name'), findsOneWidget);

    // Security
    expect(find.text('Security'), findsOneWidget);
    expect(find.text('Current Password'), findsOneWidget);
    expect(find.text('New Password'), findsOneWidget);
    expect(find.text('Confirm New Password'), findsOneWidget);

    // Actions
    expect(find.text('Save Changes'), findsOneWidget);
    expect(find.text('Change Password'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('SettingsPage renders General, Notifications, Application, and Account sections', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: SettingsPage()),
    );

    // Title
    expect(find.text('Settings'), findsOneWidget);

    // Sections
    expect(find.text('General'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English (US)'), findsOneWidget);
    expect(find.text('Default Currency'), findsOneWidget);
    expect(find.text('Doller'), findsOneWidget);

    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Order Notifications'), findsOneWidget);
    expect(find.text('Delivery Notifications'), findsOneWidget);
    expect(find.text('Inventory Alerts'), findsOneWidget);

    expect(find.text('Application'), findsOneWidget);
    expect(find.text('App Version'), findsOneWidget);
    expect(find.text('v2.4.0'), findsOneWidget);
    expect(find.text('Privacy Policy'), findsOneWidget);
    expect(find.text('Terms & Conditions'), findsOneWidget);

    expect(find.text('Account'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
    expect(find.text('Save Settings'), findsOneWidget);
  });

  testWidgets('UsersPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MaterialApp(home: UsersPage()));

    expect(find.text('Users'), findsOneWidget);
    expect(find.text('Search User'), findsOneWidget);
    expect(find.text('Filter'), findsOneWidget);

    expect(find.text('Eleanor Vance'), findsOneWidget);
    expect(find.text('Admin'), findsOneWidget);
    expect(find.text('Julian Thorne'), findsOneWidget);
    expect(find.text('Manager'), findsOneWidget);
    expect(find.text('Marcus Chen'), findsOneWidget);
    expect(find.text('Sarah Miller'), findsOneWidget);
    expect(find.text('Leo Rodriguez'), findsOneWidget);
    expect(find.text('Staff'), findsNWidgets(3));

    expect(find.byIcon(Icons.person_add_alt_1_rounded), findsOneWidget);
  });

  testWidgets('SuppliersPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MaterialApp(home: SuppliersPage()));

    expect(find.text('Suppliers'), findsOneWidget);
    expect(find.text('Search Supplier'), findsOneWidget);
    expect(find.text('Global Hardware Solutions'), findsOneWidget);
    expect(find.text('PREFERRED'), findsOneWidget);
    expect(find.text('Apex Industrial Parts'), findsOneWidget);
    expect(find.text('Steel Works & Co'), findsOneWidget);
    expect(find.text('Precision Fasteners'), findsOneWidget);
    expect(find.text('Metro Electricals'), findsOneWidget);

    expect(find.text('View'), findsNWidgets(5));
    expect(find.text('Edit'), findsNWidgets(5));
  });

  testWidgets('SupplierDetailsPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MaterialApp(home: SupplierDetailsPage()));

    expect(find.text('Supplier Details'), findsOneWidget);
    expect(find.text('Global Hardware Supplies'), findsOneWidget);
    expect(find.text('ACTIVE'), findsOneWidget);
    expect(find.text('SUP-2024-089'), findsOneWidget);
    expect(find.text('Hardware & Fasteners'), findsOneWidget);

    expect(find.text('Contact Information'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('+1 555-0123'), findsOneWidget);
    expect(find.text('john@globalhardware.com'), findsOneWidget);

    expect(find.text('Business Information'), findsOneWidget);
    expect(find.text('Net 30'), findsOneWidget);
    expect(find.text('3-5 Days'), findsOneWidget);
    expect(find.text('Bank Transfer'), findsOneWidget);

    expect(find.text('Products Supplied'), findsOneWidget);
    expect(find.text('View Inventory'), findsOneWidget);
    expect(find.text('Steel Rods (12mm)'), findsOneWidget);

    expect(find.text('Performance Summary'), findsOneWidget);
    expect(find.text('\$284,500'), findsOneWidget);

    expect(find.text('Recent Orders'), findsOneWidget);
    expect(find.text('PO-8821'), findsOneWidget);
  });

  testWidgets('RolesPermissionsPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MaterialApp(home: RolesPermissionsPage()));

    expect(find.text('Roles & Permissions'), findsOneWidget);
    expect(find.text('Select Role'), findsOneWidget);
    expect(find.text('Admin'), findsOneWidget);

    expect(find.text('Permissions'), findsOneWidget);
    expect(find.text('Manage Products'), findsOneWidget);
    expect(find.text('Manage Inventory'), findsOneWidget);
    expect(find.text('Manage Suppliers'), findsOneWidget);
    expect(find.text('Manage Customers'), findsOneWidget);
    expect(find.text('Manage Purchase Orders'), findsOneWidget);
    expect(find.text('Manage Sales Orders'), findsOneWidget);
    expect(find.text('Manage Invoices'), findsOneWidget);
    expect(find.text('Manage Deliveries'), findsOneWidget);
    expect(find.text('View Reports'), findsOneWidget);
    expect(find.text('Manage Users'), findsOneWidget);
    expect(find.text('Manage Settings'), findsOneWidget);

    expect(find.text('Save Permissions'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });

  testWidgets('CustomersPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MaterialApp(home: CustomersPage()));

    expect(find.text('Customers'), findsOneWidget);
    expect(find.text('Search Customer'), findsOneWidget);
    expect(find.text('Filter'), findsOneWidget);
    expect(find.text('Global Hardware Supplies Ltd'), findsOneWidget);
    expect(find.text('Acme Construction Co.'), findsOneWidget);
    expect(find.text('Precision Tools & Co.'), findsOneWidget);
    expect(find.text('Metropolis Supply Group'), findsOneWidget);

    expect(find.text('View'), findsNWidgets(4));
    expect(find.text('Edit'), findsNWidgets(4));
  });

  testWidgets('InvoicesPage renders Figma design components correctly', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(440, 1400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MaterialApp(home: InvoicesPage()));

    expect(find.text('Invoices'), findsOneWidget);
    expect(find.text('Search Invoice'), findsOneWidget);
    expect(find.text('#INV-5001'), findsOneWidget);
    expect(find.text('Acme Construction'), findsOneWidget);
    expect(find.text('#INV-5002'), findsOneWidget);
    expect(find.text('BuildRight Co.'), findsOneWidget);
    expect(find.text('#INV-4998'), findsOneWidget);
    expect(find.text('Smith & Sons'), findsOneWidget);
    expect(find.text('#INV-5003'), findsOneWidget);
    expect(find.text('Iron Works Ltd.'), findsOneWidget);

    expect(find.text('Paid'), findsNWidgets(2));
    expect(find.text('Pending'), findsOneWidget);
    expect(find.text('Overdue'), findsOneWidget);

    expect(find.text('View'), findsNWidgets(4));
    expect(find.text('Download'), findsNWidgets(4));
  });
}

