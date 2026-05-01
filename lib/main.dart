import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/product_provider.dart';

void main() {
  runApp(const TokoPintarApp());
}

class TokoPintarApp extends StatelessWidget {
  const TokoPintarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'TokoPintar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF8F9FA), // Very light grey
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0D6EFD), // Professional Blue
            primary: const Color(0xFF0D6EFD),
            surface: Colors.white,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: const Color(0xFF212529),
            displayColor: const Color(0xFF212529),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Color(0xFF212529)),
            titleTextStyle: GoogleFonts.poppins(
              color: const Color(0xFF212529),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 4,
            shadowColor: Colors.black.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        home: const HomeScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        },
      ),
    );
  }
}
