import 'package:flutter/material.dart';
import 'route_names.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/otp_verification_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/products/presentation/pages/products_page.dart';
import '../../features/products/presentation/pages/add_product_page.dart';
import '../../features/products/presentation/pages/edit_product_page.dart';
import '../../features/products/presentation/pages/product_details_page.dart';
import '../../features/customers/presentation/pages/add_customer_page.dart';
import '../../features/customers/presentation/pages/edit_customer_page.dart';
import '../../features/customers/presentation/pages/customer_details_page.dart';
import '../../features/customers/presentation/pages/customers_page.dart';
import '../../features/suppliers/presentation/pages/add_supplier_page.dart';
import '../../features/inventory/presentation/pages/inventory_page.dart';
import '../../features/inventory/presentation/pages/stock_details_page.dart';
import '../../features/stock_adjustment/presentation/pages/stock_adjustment_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/orders/presentation/pages/order_details_page.dart';
import '../../features/orders/presentation/pages/sales_order_details_page.dart';
import '../../features/orders/presentation/pages/purchase_orders_page.dart';
import '../../features/orders/presentation/pages/create_order_page.dart';
import '../../features/reports/presentation/pages/reports_page.dart';
import '../../features/reports/presentation/pages/report_details_page.dart';
import '../../features/reports/presentation/pages/invoice_details_page.dart';
import '../../features/reports/presentation/pages/invoices_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/settings_page.dart';
import '../../features/profile/presentation/pages/users_page.dart';
import '../../features/profile/presentation/pages/roles_permissions_page.dart';
import '../../features/suppliers/presentation/pages/suppliers_page.dart';
import '../../features/suppliers/presentation/pages/supplier_details_page.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initial:
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RouteNames.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case RouteNames.otpVerification:
        final email = (settings.arguments is String) ? settings.arguments as String : '';
        return MaterialPageRoute(
          builder: (_) => OtpVerificationPage(email: email),
        );
      case RouteNames.resetPassword:
        final email = (settings.arguments is String) ? settings.arguments as String : null;
        return MaterialPageRoute(
          builder: (_) => ResetPasswordPage(email: email),
        );
      case RouteNames.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case RouteNames.products:
        return MaterialPageRoute(builder: (_) => const ProductsPage());
      case RouteNames.addProduct:
        return MaterialPageRoute(builder: (_) => const AddProductPage());
      case RouteNames.editProduct:
        return MaterialPageRoute(builder: (_) => const EditProductPage());
      case RouteNames.productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsPage());
      case RouteNames.addCustomer:
        return MaterialPageRoute(builder: (_) => const AddCustomerPage());
      case RouteNames.editCustomer:
        final customer = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => EditCustomerPage(customer: customer),
        );
      case RouteNames.customerDetails:
        return MaterialPageRoute(builder: (_) => const CustomerDetailsPage());
      case RouteNames.addSupplier:
        return MaterialPageRoute(builder: (_) => const AddSupplierPage());
      case RouteNames.inventory:
        return MaterialPageRoute(builder: (_) => const InventoryPage());
      case RouteNames.stockDetails:
        return MaterialPageRoute(builder: (_) => const StockDetailsPage());
      case RouteNames.stockAdjustment:
        return MaterialPageRoute(builder: (_) => const StockAdjustmentPage());
      case RouteNames.orders:
        return MaterialPageRoute(builder: (_) => const OrdersPage());
      case RouteNames.orderDetails:
        return MaterialPageRoute(builder: (_) => const OrderDetailsPage());
      case RouteNames.salesOrderDetails:
        return MaterialPageRoute(builder: (_) => const SalesOrderDetailsPage());
      case RouteNames.purchaseOrders:
        return MaterialPageRoute(builder: (_) => const PurchaseOrdersPage());
      case RouteNames.createOrder:
        return MaterialPageRoute(builder: (_) => const CreateOrderPage());
      case RouteNames.reports:
        return MaterialPageRoute(builder: (_) => const ReportsPage());
      case RouteNames.reportDetails:
        return MaterialPageRoute(builder: (_) => const ReportDetailsPage());
      case RouteNames.invoiceDetails:
        return MaterialPageRoute(builder: (_) => const InvoiceDetailsPage());
      case RouteNames.profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case RouteNames.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case RouteNames.users:
        return MaterialPageRoute(builder: (_) => const UsersPage());
      case RouteNames.customers:
        return MaterialPageRoute(builder: (_) => const CustomersPage());
      case RouteNames.suppliers:
        return MaterialPageRoute(builder: (_) => const SuppliersPage());
      case RouteNames.supplierDetails:
        return MaterialPageRoute(builder: (_) => const SupplierDetailsPage());
      case RouteNames.invoices:
        return MaterialPageRoute(builder: (_) => const InvoicesPage());
      case RouteNames.rolesPermissions:
        return MaterialPageRoute(builder: (_) => const RolesPermissionsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
