import 'package:flutter/material.dart';
import 'package:orionschematic/pages/about_page.dart';
import 'package:orionschematic/pages/brand_page.dart';
import 'package:orionschematic/pages/howto_use_page.dart';
import 'package:orionschematic/pages/banner_detail.dart';
import 'package:orionschematic/pages/folder_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // ⬅️ untuk jsonDecode
import 'profile_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';




/* ---------------- HOME PAGE (Futuristic) ---------------- */
class HomePageFuturistic extends StatefulWidget {
  const HomePageFuturistic({super.key, required this.onLogout});



  final VoidCallback onLogout; // pastikan ini ada

  @override
  State<HomePageFuturistic> createState() => _HomePageFuturisticState();
}

class _HomePageFuturisticState extends State<HomePageFuturistic> {
  final List<Map<String, dynamic>> videoList = [
    {
      'title':
      '𝐍𝐄𝐖 𝐁𝐈𝐓𝐌𝐀𝐏 𝐌𝐔𝐋𝐓𝐈𝐋𝐀𝐘𝐄𝐑 – 𝐢𝐏𝐡𝐨𝐧𝐞 𝟏𝟕 𝐏𝐫𝐨',
      'thumbnail': 'assets/videos/image.jpeg',
      'url': 'https://youtu.be/iYyB9Vc2Jr4?si=mAEDL4HpEsR9NBJK',
    },
    {
      'title': 'GUIDLINES CONTROL LOGIC',
      'thumbnail': 'assets/videos/image2.jpeg',
      'url': 'https://youtu.be/TBDc9oQ2J9s?si=A6W-yYCO9AWqc3uc',
    },
    {
      'title': '30 menit trik swap board semua mesin',
      'thumbnail': 'assets/videos/image3.jpeg',
      'url': 'https://youtu.be/s5yKU9yE7Fg?si=yNRrGLTzm8ORjWlw',
    },
    {
      'title': 'MENCARI PERSAMAAN IC',
      'thumbnail': 'assets/videos/image4.jpeg',
      'url': 'https://youtu.be/xQ7i4DvyETE?si=WKBPQNeyAFio91mt',
    },
  ];
  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      final Map<String, dynamic> user = jsonDecode(userData); // ✅ sekarang aman
      setState(() {
        userName = user['name'];
        userEmail = user['email'];
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> listGawai = [
      {
        'jenis': 'Detail Single Chip Pinout',
        'icon': Icons.bolt,
        'brands': [
          {'name': 'Detail Single Chip Pinout', 'logo': 'assets/brands/chip.jpeg'},
        ]
      },

      {
        'jenis': 'Document & Datasheet',
        'icon': Icons.description,
        'brands': [
          {'name': 'doc & data', 'logo': 'assets/brands/dokumen.jpg'},
        ]
      },

      {
        'jenis': 'Drone & Quadcopter',
        'icon': Icons.flight,
        'brands': [
          {'name': 'DJI', 'logo': 'assets/brands/DJI.png'},
        ]
      },

      {

        'jenis': 'Gadget & Wearables',
        'icon': Icons.watch,
        'brands': [
          {'name': 'produk gadget & wearables', 'logo': 'assets/brands/gadgetwearables.jpg'},
        ]
      },

      {
        'jenis': 'Graphics Card & Game Console',
        'icon': Icons.sports_esports,
        'brands': [
          {'name': 'Nvidia', 'logo': 'assets/brands/nvidia.jpg'},
          {'name': 'PlayStation', 'logo': 'assets/brands/playstation.jpg'},
        ]
      },

      {
        'jenis': 'Laptop & Notebook',
        'icon': Icons.laptop_mac,
        'brands': [
          {'name': 'Acer', 'logo': 'assets/brands/acer.png'},
          {'name': 'AlienWare', 'logo': 'assets/brands/alienware.png'},
          {'name': 'Apple', 'logo': 'assets/brands/apple.png'},
          {'name': 'Asus', 'logo': 'assets/brands/asus.jpg'},
          {'name': 'Axioo', 'logo': 'assets/brands/axioo.png'},
          {'name': 'BenQ', 'logo': 'assets/brands/benq.png'},
          {'name': 'Compaq', 'logo': 'assets/brands/compaq.png'},
          {'name': 'Dell', 'logo': 'assets/brands/dell.png'},
          {'name': 'Ecs', 'logo': 'assets/brands/ecs.png'},
          {'name': 'Fujitsu', 'logo': 'assets/brands/fujitsu.png'},
          {'name': 'Gigabyte', 'logo': 'assets/brands/gigabyte.png'},
          {'name': 'Huawei', 'logo': 'assets/brands/huawei.jpg'},
          {'name': 'Lenovo', 'logo': 'assets/brands/lenovo.png'},
          {'name': 'Samsung', 'logo': 'assets/brands/samsung.png'},
          {'name': 'Toshiba', 'logo': 'assets/brands/toshiba.png'},
          {'name': 'Vaio', 'logo': 'assets/brands/vaio.png'},
          {'name': 'Xiaomi', 'logo': 'assets/brands/xiaomi.png'},
        ],
      },

      {
        'jenis': 'Smartphone',
        'icon': Icons.phone_android,
        'brands': [
          {'name': 'Alcatel', 'logo': 'assets/brands/alcatel.png'},
          {'name': 'Apple', 'logo': 'assets/brands/apple.png'},
          {'name': 'Asus', 'logo': 'assets/brands/asus.jpg'},
          {'name': 'Black Shark', 'logo': 'assets/brands/blackshark.jpg'},
          {'name': 'Blackberry', 'logo': 'assets/brands/blackberry.jpg'},
          {'name': 'BLU', 'logo': 'assets/brands/blu.jpg'},
          {'name': 'Coolpad', 'logo': 'assets/brands/coolpad.png'},
          {'name': 'Gionee', 'logo': 'assets/brands/gionee.png'},
          {'name': 'Google', 'logo': 'assets/brands/google.jpg'},
          {'name': 'Honor', 'logo': 'assets/brands/honor.jpg'},
          {'name': 'Hotwav', 'logo': 'assets/brands/hotwav.png'},
          {'name': 'Huawei', 'logo': 'assets/brands/huawei.jpg'},
          {'name': 'Infinix', 'logo': 'assets/brands/infinix.png'},
          {'name': 'Infocus', 'logo': 'assets/brands/infocus.png'},
          {'name': 'IQOO', 'logo': 'assets/brands/iqoo.jpg'},
          {'name': 'Itel', 'logo': 'assets/brands/itel.png'},
          {'name': 'JIO', 'logo': 'assets/brands/jio.png'},
          {'name': 'Lava', 'logo': 'assets/brands/lava.jpg'},
          {'name': 'Lenovo', 'logo': 'assets/brands/lenovo.png'},
          {'name': 'LG', 'logo': 'assets/brands/lg.png'},
          {'name': 'Maxtron', 'logo': 'assets/brands/maxtron.jpg'},
          {'name': 'Meizu', 'logo': 'assets/brands/meizu.png'},
          {'name': 'micromax', 'logo': 'assets/brands/micromax.png'},
          {'name': 'Motorola', 'logo': 'assets/brands/motorola.png'},
          {'name': 'Neffos', 'logo': 'assets/brands/neffos.png'},
          {'name': 'Nokia', 'logo': 'assets/brands/nokia.jpg'},
          {'name': 'OnePlus', 'logo': 'assets/brands/oneplus.png'},
          {'name': 'Oppo', 'logo': 'assets/brands/oppo.png'},
          {'name': 'Realme', 'logo': 'assets/brands/realme.png'},
          {'name': 'Samsung', 'logo': 'assets/brands/samsung.png'},
          {'name': 'Sharp', 'logo': 'assets/brands/sharp.png'},
          {'name': 'Sony', 'logo': 'assets/brands/sony.jpg'},
          {'name': 'Tecno', 'logo': 'assets/brands/tecno.jpg'},
          {'name': 'Umidigi', 'logo': 'assets/brands/umidigi.png'},
          {'name': 'Vivo', 'logo': 'assets/brands/vivo.png'},
          {'name': 'Xiaomi', 'logo': 'assets/brands/xiaomi.png'},
          {'name': 'ZTE', 'logo': 'assets/brands/zte.png'},
        ],
      },

      {
        'jenis': 'Tablet & Phablet',
        'icon': Icons.tablet,
        'brands': [
          {'name': 'Apple', 'logo': 'assets/brands/apple.png'},
          {'name': 'Asus', 'logo': 'assets/brands/asus.jpg'},
          {'name': 'Huawei', 'logo': 'assets/brands/huawei.jpg'},  // diperbaiki
          {'name': 'Lenovo', 'logo': 'assets/brands/lenovo.png'},
          {'name': 'LG', 'logo': 'assets/brands/lg.png'},
          {'name': 'Samsung', 'logo': 'assets/brands/samsung.png'},
          {'name': 'Xiaomi', 'logo': 'assets/brands/xiaomi.png'},
        ],
      },
    ];

    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFF0A192F),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0A192F), Color(0xFF112D4E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 90,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'ORION MENU',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),


            // profil
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfilePage(),
                  ),
                );
              },
            ),



            // 🔹 Menu Home
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),


            // 🔹 Menu About
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text('About', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );

              },
            ),

            const Divider(color: Colors.white54, thickness: 0.5),


            // Menu exclusive
            Text(
              'Exclusive Item',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _folderTile(context, 'Convert Item\'s', [
              'Convert Bootlogo',
              'Convert Firmware',
              'Tools & Tips',
            ]),
            _folderTile(context, 'EMMC Identity', [
              'Fix EMMC',
              'Read/Write Identity',
            ]),
            _folderTile(context, 'Basic Learning', [
              'Soldering',
              'Multimeter',
              'Component Values',
            ]),
            _folderTile(context, 'Schematic Code / Shortcut Explain', [
              'Schematic A',
              'Shortcuts',
            ]),

            const SizedBox(height: 28),

          ],
        ),
      ),





      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: theme.brightness == Brightness.dark
                  ? [const Color(0xFF071826), const Color(0xFF081A2A)]
                  : [
                const Color(0xFFFF6A00).withOpacity(0.95),
                const Color(0xFFFF3D00).withOpacity(0.95),
              ],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(26),
              bottomRight: Radius.circular(26),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 55,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          'ORION SCHEMATIC',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1.1,
                            letterSpacing: 1.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: const Color(0xFF0A192F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: const Text(
                          '🔔 ORION Notification',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'No new alerts at the moment.\nAll systems are running stable ⚡',
                          style: TextStyle(color: Colors.white70),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'CLOSE',
                              style: TextStyle(color: Colors.orangeAccent),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.notifications, color: Colors.white, size: 26),
                ),
              ],
            ),
          ),
        ),
      ),



      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          children: [
            // announcement chip

            // announcement chip

            const SizedBox(height: 14),

// Banner Marquee
            SizedBox(
              width: double.infinity,
              child: MarqueeBanner(images: [
                'assets/banner2.png',
                'assets/banner3.jpg',
                'assets/banner4.jpg',
              ]),
            ),

            const SizedBox(height :16),
// banner carousel LAMA (yang pakai _bannerCard)
            SizedBox(
              height: 150,
              child: PageView(
                controller : PageController(viewportFraction: 0.92),
                children: [
                  _bannerCard(
                    context,
                    'Solution any shot Problem',
                    'Samsung • Xiaomi • Oppo',
                    Icons.phone_android,
                  ),
                  _bannerCard(
                    context,
                    'EMMC Identity & Fix',
                    'Tutorial & Tools',
                    Icons.settings_backup_restore_rounded,
                  ),
                  _bannerCard(
                    context,
                    'Buy & Sell Parts',
                    'Parts, Tools, Accessories',
                    Icons.shopping_bag,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),




// === Daftar jenis gawai ===
            Text(
              'Pilih Jenis Gawai',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 18),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.92,
              ),
              itemCount: listGawai.length,
              itemBuilder: (context, index) {
                final gawai = listGawai[index];

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BrandPage(
                            deviceCategory: gawai['jenis'],
                            brands: gawai['brands'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF262C36),
                            Color(0xFF1C2129),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.22),
                            blurRadius: 12,
                            offset: Offset(2, 4),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white.withOpacity(0.06),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            // ICON CONTAINER
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.08),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.10),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                gawai['icon'],
                                size: 26,
                                color: Colors.cyanAccent,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // NAMA KATEGORI
                            Text(
                              gawai['jenis'],
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.5,
                                height: 1.22,
                                color: Colors.white.withOpacity(0.96),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),






          //===============release dan update==============
            const SizedBox(height: 8),
            const _UpdateListSection(),

//-============vidio================-
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxis = 2;       // default mobile
            double aspect = 16 / 10; // default rasio

            // Desktop
            if (constraints.maxWidth >= 700) {
              crossAxis = 4;         // 4 kolom dalam 1 baris
              aspect = 16 / 10;      // biar proporsional
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxis,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: aspect,
              ),
              itemCount: videoList.length,
              itemBuilder: (context, index) {
                final video = videoList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VideoPlayerPage(
                          title: video['title'],
                          url: video['url'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Stack(
                        children: [
                          Image.asset(
                            video['thumbnail'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),

                          Container(
                            color: Colors.black.withOpacity(0.32),
                          ),

                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.85),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                size: 38,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Text(
                              video['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.5,
                                height: 1.2,
                                shadows: [
                                  Shadow(
                                    color: Colors.black87,
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),


        // ======= Community =======
            Text(
              'Community and Support',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.cyanAccent,
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _buildSocialButton(
                      gradientColors: [Colors.blueAccent, Colors.cyanAccent],
                      icon: FontAwesomeIcons.facebookF,
                      url: 'https://www.facebook.com/groups/estechschematics',
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _buildSocialButton(
                      gradientColors: [Colors.greenAccent, Colors.tealAccent],
                      icon: FontAwesomeIcons.whatsapp,
                      url: 'https://wa.me/+6281388001180',
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _buildSocialButton(
                      gradientColors: [
                        Color(0xFF8A3AB9),
                        Color(0xFFBC2A8D),
                        Color(0xFFF56040),
                        Color(0xFFFFDC80),
                      ],
                      icon: FontAwesomeIcons.instagram,
                      url: 'https://instagram.com/orionschematics',
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _buildSocialButton(
                      gradientColors: [
                        Color(0xFF25F4EE),
                        Color(0xFFFE2C55),
                      ],
                      icon: FontAwesomeIcons.tiktok,
                      url: 'https://www.tiktok.com/orionschematics',
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _buildSocialButton(
                      gradientColors: [Colors.redAccent, Colors.red],
                      icon: FontAwesomeIcons.youtube,
                      url: 'https://youtube.com/@orionschematics',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // How to use
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HowToUsePage()),
                ),
                icon: const Icon(Icons.help_outline),
                // ✅ Ganti label tombol
                label: const Text('How To Use ORION SCHEMATIC ?'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }


// 🔹 fungsi tombol sosial futuristik
  Widget _buildSocialButton({
    required List<Color> gradientColors,
    required IconData icon,
    required String url,
  }) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColors),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, color: Colors.white, size: 26),
        ),
      ),
    );
  }
  Widget _bannerCard(
      BuildContext context,
      String title,
      String sub,
      IconData icon,
      ) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BannerDetailPage(title: title, subtitle: sub),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: theme.brightness == Brightness.dark
              ? const LinearGradient(
            colors: [Color(0xFF052A36), Color(0xFF071826)],
          )
              : const LinearGradient(
            colors: [Color(0xFFFF9A00), Color(0xFFFF4D00)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white.withOpacity(0.15),
              child: Icon(icon, size: 28, color: Colors.white),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(sub, style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Lihat'))),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white30),
              child: const Text('Lihat'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _folderTile(BuildContext context, String title, List<String> items) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: const Icon(Icons.folder, color: Colors.amber),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        children: items
            .map(
              (it) => ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FolderDetailPage(folder: it),
              ),
            ),
            leading: const Icon(Icons.insert_drive_file_outlined),
            title: Text(it),
            trailing: const Icon(Icons.chevron_right),
          ),
        )
            .toList(),
      ),
    );
  }
}

// ================= animasi banner gerak gerak =======================
class MarqueeBanner extends StatefulWidget {
  final List<String> images;
  final void Function(String path)? onTap;

  const MarqueeBanner({
    super.key,
    required this.images,
    this.onTap,
  });

  @override
  State<MarqueeBanner> createState() => _MarqueeBannerState();
}

class _MarqueeBannerState extends State<MarqueeBanner> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loop();
    });
  }

  Future<void> _loop() async {
    while (mounted) {
      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 20),
        curve: Curves.linear,
      );
      if (!mounted) return;
      _scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 160,
      child: AbsorbPointer(
        absorbing: true,
        child: Listener(
          behavior: HitTestBehavior.translucent,
          child: ListView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ...widget.images.map((img) => _buildBanner(img, width)),
              ...widget.images.map((img) => _buildBanner(img, width)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner(String path, double width) {
    return GestureDetector(
      onTap: () => widget.onTap?.call(path),
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Gambar
              Positioned.fill(
                child: Image.asset(
                  path,
                  fit: BoxFit.cover,
                ),
              ),

              // Gradient Overlay biar lebih cinematic
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.35),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // Title kecil kalau kamu mau taro text nanti
              Positioned(
                bottom: 12,
                left: 16,
                right: 16,
                child: Text(
                  "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        color: Colors.black87,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ==================== RESPONSIVE TYPE PAGE ==========================
class TypePage extends StatefulWidget {
  final String brandName;
  final String deviceCategory;

  const TypePage({
    required this.brandName,
    required this.deviceCategory,
    super.key,
  });

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  String? _openedType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceTypes = allTypeData[widget.deviceCategory]?[widget.brandName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            '${widget.brandName} ${widget.deviceCategory}',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: theme.brightness == Brightness.dark
            ? const Color(0xFF0A192F)
            : Colors.deepOrange,
        elevation: 3,
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        itemCount: deviceTypes.length,
        itemBuilder: (context, index) {
          final typeName = deviceTypes[index];
          final isOpen = _openedType == typeName;

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: Column(
              children: [

                // CARD UTAMA
                GestureDetector(
                  onTap: () => setState(() {
                    _openedType = isOpen ? null : typeName;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOut,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? const Color(0xFF1A1F2E)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white24
                            : Colors.black12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            typeName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                        ),
                        AnimatedRotation(
                          turns: isOpen ? 0.5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 26,
                            color: theme.brightness == Brightness.dark
                                ? Colors.white70
                                : Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // BAGIAN DETAIL (LAYOUT + SCHEMATIC)
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 220),
                  crossFadeState: isOpen
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,

                  firstChild: Container(
                    margin: const EdgeInsets.only(top: 6),
                    padding: const EdgeInsets.fromLTRB(14, 6, 14, 12),
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? const Color(0xFF101622)
                          : const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white10
                            : Colors.black12,
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.grid_view_rounded,
                              size: 22,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.cyanAccent
                                  : Colors.deepOrangeAccent),
                          title: const Text(
                            'Layout',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TypeDetailPage(
                                  brandName: widget.brandName,
                                  componentName: '$typeName - Layout',
                                ),
                              ),
                            );
                          },
                        ),
                        const Divider(height: 6),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.bolt_rounded,
                              size: 22,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.amberAccent
                                  : Colors.orange),
                          title: const Text(
                            'Schematic',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TypeDetailPage(
                                  brandName: widget.brandName,
                                  componentName: '$typeName - Schematic',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  secondChild: const SizedBox.shrink(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* -------------------- type brand gawai page ------------------- */
class TypeDetailPage extends StatefulWidget {
  final String brandName;
  final String componentName;
  const TypeDetailPage({
    required this.brandName,
    required this.componentName,
    super.key,
  });

  @override
  State<TypeDetailPage> createState() => _TypeDetailPageState();
}

class _TypeDetailPageState extends State<TypeDetailPage> {
  String? selectedCategory;

  final Map<String, Color> categoryColors = {
    'LCD': Colors.cyanAccent,
    'Network': Colors.yellowAccent,
    'SIM Card': Colors.purpleAccent,
    'LCD Light': Colors.tealAccent,
    'Back Camera': Colors.blueAccent,
    'Front Camera': Colors.orangeAccent,
    'Touch Screen': Colors.greenAccent,
    'Audio Circuit': Colors.pinkAccent,
    'Micro USB 2.0': Colors.redAccent,
    'Diode Voltage Drop': Colors.amberAccent,
    'eMMC Pinout for ISP': Colors.deepPurpleAccent,
    'Input Output Voltages': Colors.lightBlueAccent,
    'On Off Volume Keys': Colors.limeAccent,
    'Voltage Parametric': Colors.indigoAccent,
    'WiFi Bluetooth GPS': Colors.deepOrangeAccent,
  };

  final List<String> categories = [
    'LCD',
    'Network',
    'SIM Card',
    'LCD Light',
    'Back Camera',
    'Front Camera',
    'Touch Screen',
    'Audio Circuit',
    'Micro USB 2.0',
    'Diode Voltage Drop',
    'eMMC Pinout for ISP',
    'Input Output Voltages',
    'On Off Volume Keys',
    'Voltage Parametric',
    'WiFi Bluetooth GPS',
  ];

  final Map<String, List<Map<String, dynamic>>> multiSvgMap = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.componentName),
        backgroundColor: const Color(0xFF0A192F),   // disamain
        centerTitle: true,
      ),
      body: LayoutBuilder(
          builder: (context, constraints) {
            final bool isDesktop = constraints.maxWidth > 650;
            return Container(
              color: const Color(0xFF0A192F),   // W A R N A   U T A M A
              child: Column(
                children: [
                  if (isDesktop)
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Center(child: _buildDropdown()),
                    ),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: const Color(0xFF0A192F),    // Sama
                      child: InteractiveViewer(
                        minScale: 0.3,
                        maxScale: 20.0,
                        boundaryMargin: const EdgeInsets.all(500),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                getImageForComponent(widget.componentName),
                                fit: BoxFit.contain,
                              ),
                              if (selectedCategory != null)
                                ..._buildSvgOverlaysForCategory(selectedCategory!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  if (!isDesktop)
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Center(child: _buildDropdown()),
                    ),
                ],
              ),
            );
          },
        ),



    );
  }
  List<Widget> _buildSvgOverlaysForCategory(String category) {
    final key = category;
    final list = multiSvgMap[key];

    if (list == null || list.isEmpty) {
      final fallback = getSvgForCategory(category);
      return [
        SvgPicture.asset(
          fallback,
          fit: BoxFit.contain,
        ),
      ];
    }

    return list.map((item) {
      final String file = item['file'] as String;
      final Color? color = item['color'] as Color?;
      return SvgPicture.asset(
        file,
        fit: BoxFit.contain,
        colorFilter: color != null
            ? ColorFilter.mode(color, BlendMode.srcIn)
            : null,
      );
    }).toList();
  }

  String getImageForComponent(String name) {
    switch (name.toLowerCase()) {
      case 'motherboard':
      case 'cpu':
      case 'galaxy s6 - layout':
        return 'assets/images/G532F.png';
      default:
        return 'assets/images/G532F.png';
    }
  }
  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0A192F),   // disamain
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: DropdownButton<String>(
        value: selectedCategory,
        hint: const Text(
          'Pilih Category',
          style: TextStyle(color: Colors.white70),
        ),
        dropdownColor: const Color(0xFF0A192F),   // disamain
        iconEnabledColor: Colors.white,
        underline: const SizedBox(),
        style: const TextStyle(color: Colors.white),
        items: categories.map((cat) {
          return DropdownMenuItem(
            value: cat,
            child: Text(
              cat,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedCategory = value;
          });
        },
      ),
    );
  }



  String getSvgForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'wifi bluetooth gps':
        return 'assets/images/Guideline/WiFi Bluetooth GPS.svg';
      case 'voltage parametric':
        return 'assets/images/Guideline/Voltage Parametric.svg';
      case 'on off volume keys':
        return 'assets/images/Guideline/On Off Volume Keys.svg';
      case 'input output voltages':
        return 'assets/images/Guideline/Input Output Voltages.svg';
      case 'emmc pinout for isp':
        return 'assets/images/Guideline/eMMC Pinout for ISP.svg';
      case 'diode voltage drop':
        return 'assets/images/Guideline/Diode Voltage Drop.svg';
      case 'micro usb 2.0':
        return 'assets/images/Guideline/Micro USB 2.0.svg';
      case 'touch screen':
        return 'assets/images/Guideline/Touch Screen.svg';
      case 'front camera':
        return 'assets/images/Guideline/Front Camera.svg';
      case 'back camera':
        return 'assets/images/Guideline/Back Camera.svg';
      case 'network':
        return 'assets/images/Guideline/Network.svg';
      case 'lcd':
        return 'assets/images/Guideline/LCD.svg';
      case 'lcd light':
        return 'assets/images/Guideline/LCD Light.svg';
      case 'audio circuit':
        return 'assets/images/Guideline/Audio Circuit.svg';
      case 'sim card':
        return 'assets/images/Guideline/SIM Card.svg';
      default:
        return 'assets/images/Guideline/Default.svg';
    }
  }
}

// =====================  Bagian Release & Update =====================

class _UpdateListSection extends StatefulWidget {
  const _UpdateListSection({Key? key}) : super(key: key);

  @override
  State<_UpdateListSection> createState() => _UpdateListSectionState();
}


class _UpdateListSectionState extends State<_UpdateListSection> {
  int _expandedIndex = -1;

  final List<Map<String, String>> updates = [
    {
      'date': '04 November 2025',
      'detail': '🔧 Perbaikan tampilan halaman login dan sistem logout agar lebih stabil.',
    },
    {
      'date': '03 November 2025',
      'detail': '🧠 Penambahan fitur brand list horizontal dan logo image di HomePage.',
    },
    {
      'date': '02 November 2025',
      'detail': '💡 Pembaruan UI futuristik dengan efek bayangan lembut dan transisi smooth.',
    },
    {
      'date': '01 November 2025',
      'detail': '🚀 Peluncuran awal versi demo ORION SCHEMATIC!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Release & Updates',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(updates.length, (index) {
            final update = updates[index];
            final isExpanded = _expandedIndex == index;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: theme.brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.05)
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
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {
                  setState(() {
                    _expandedIndex = isExpanded ? -1 : index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            update['date']!,
                            style:
                            theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: Colors.blueAccent,
                          ),
                        ],
                      ),
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 2, right: 2, bottom: 6),
                          child: Text(
                            update['detail']!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              height: 1.4,
                            ),
                          ),
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration:
                        const Duration(milliseconds: 300),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}


// ===================  Video Player Page (Inline) =======================

class VideoPlayerPage extends StatefulWidget {
  final String title;
  final String url;
  const VideoPlayerPage({required this.title, required this.url, super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) => Column(
          children: [
            player,
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
