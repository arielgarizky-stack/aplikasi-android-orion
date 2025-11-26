import 'package:flutter/material.dart';
import 'package:orionschematic/data_loader.dart';
import 'package:orionschematic/pages/home_page.dart';
import 'package:orionschematic/pages/detail_item.dart';




class FindICPage extends StatefulWidget {
  const FindICPage({super.key});

  @override
  State<FindICPage> createState() => _FindICPageState();
}

class _FindICPageState extends State<FindICPage> {
  final TextEditingController _q = TextEditingController();
  List<String> all = [];
  bool loading = true;

  String? _openedItem;

  @override
  void initState() {
    super.initState();
    _loadAll();
  }

  Future<void> _loadAll() async {
    await Future.delayed(const Duration(milliseconds: 200));

    List<String> result = [];

    for (final category in allTypeData.entries) {
      for (final brand in category.value.entries) {
        for (final model in brand.value) {
          result.add("${brand.key} $model");
        }
      }
    }

    setState(() {
      all = result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final query = _q.text.trim().toLowerCase();
    final results = query.isEmpty
        ? all.take(30).toList()
        : all.where((e) => e.toLowerCase().contains(query)).toList();

    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find IC / Model / Brand'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _q,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Contoh: Samsung J2 Prime, iPhone 4s...',
                suffixIcon: _q.text.isEmpty
                    ? null
                    : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => setState(() => _q.clear()),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: results.isEmpty
                  ? const Center(child: Text('Tidak ditemukan'))
                  : ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, i) {
                  final item = results[i];
                  final isOpen = _openedItem == item;

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _openedItem = isOpen ? null : item;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: theme.brightness == Brightness.dark
                                ? Colors.white10
                                : Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 6,
                                offset: const Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Icon(
                                isOpen
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                              ),
                            ],
                          ),
                        ),
                      ),

                      AnimatedCrossFade(
                        crossFadeState: isOpen
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 220),
                        firstChild: Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 8),
                          child: Column(
                            children: [
                              ListTile(
                                dense: true,
                                leading: const Icon(Icons.grid_view_rounded, size: 22),
                                title: const Text('Layout'),
                                minLeadingWidth: 0,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TypeDetailPage(
                                          brandName: item,                // ini ganti nembak brand
                                          componentName: "$item - Layout", // ini judul/tampilan
                                        ),
                                      ),
                                    );
                                  }

                              ),
                              ListTile(
                                dense: true,
                                leading: const Icon(Icons.bolt_rounded, size: 22),
                                title: const Text('Schematic'),
                                minLeadingWidth: 0,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TypeDetailPage(
                                          brandName: item,                // ini ganti nembak brand
                                          componentName: "$item - schematic", // ini judul/tampilan
                                        ),
                                      ),
                                    );
                                  }

                              ),
                            ],
                          ),
                        ),
                        secondChild: const SizedBox.shrink(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}