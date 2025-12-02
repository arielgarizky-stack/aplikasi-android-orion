import 'package:flutter/material.dart';
import 'package:orionschematic/pages/detail_item.dart';
import 'package:orionschematic/pages/home_page.dart';

/* --------------- Brand Page (Enhanced) ----------------- */

class BrandPage extends StatelessWidget {
  final String deviceCategory;
  final List<Map<String, String>> brands;

  const BrandPage({
    required this.deviceCategory,
    required this.brands,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Brand $deviceCategory'),
        backgroundColor: isDark
            ? const Color(0xFF0A192F)
            : Colors.deepOrange,
        elevation: 1,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          if (constraints.maxWidth > 650) crossAxisCount = 3;
          if (constraints.maxWidth > 950) crossAxisCount = 4;

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.95,
            ),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return _BrandCard(
                name: brand['name']!,
                logo: brand['logo']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TypePage(
                        brandName: brand['name']!,
                        deviceCategory: deviceCategory,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _BrandCard extends StatefulWidget {
  final String name;
  final String logo;
  final VoidCallback onTap;

  const _BrandCard({
    required this.name,
    required this.logo,
    required this.onTap,
  });

  @override
  State<_BrandCard> createState() => _BrandCardState();
}

class _BrandCardState extends State<_BrandCard> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Listener(
      onPointerDown: (_) => setState(() => scale = 0.96),
      onPointerUp: (_) => setState(() => scale = 1),
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOut,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? Colors.white10 : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                if (!isDark)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(2, 3),
                  ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.logo,
                  width: 72,
                  height: 72,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 14),
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.5,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
