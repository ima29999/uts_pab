import 'package:flutter/material.dart';

// =====================================================================
// PALET WARNA
// =====================================================================
const Color navyDark   = Color(0xFF000035);
const Color navyMid    = Color(0xFF00004A);
const Color navyLight  = Color(0xFF000B6B);
const Color gold       = Color(0xFFD4AF37);
const Color goldLight  = Color(0xFFF0D060);
const Color goldDim    = Color(0xFF8B7328);
const Color surface    = Color(0xFF040050);

void main() {
  runApp(const MyPortoApp());
}

class MyPortoApp extends StatelessWidget {
  const MyPortoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'MyPorto',
      theme: ThemeData(
        primaryColor: navyDark,
        scaffoldBackgroundColor: surface, 
        appBarTheme: const AppBarTheme(
          backgroundColor: navyDark, 
          foregroundColor: goldLight, 
          elevation: 0, 
        ),
      ),
      initialRoute: '/', 

      routes: {
        '/': (context) => const DashboardScreen(),
        '/counter': (context) => const CounterScreen(),
        '/widget_bertingkat': (context) => const WidgetBertingkatScreen(),
        '/user_input': (context) => const UserInputScreen(),
        '/dynamic_list': (context) => const DynamicListScreen(),
        '/navigasi': (context) => const NavigasiScreen(),
        '/grid_view': (context) => const GridViewScreen(),
        '/tentang': (context) => const TentangSayaScreen(),
        '/callback_example': (context) => const CallbackScreen(),
        '/animation_example': (context) => const AnimationScreen(),
      },
    );
  }
}

// =====================================================================
// HALAMAN DASHBOARD
// =====================================================================
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final List<String> menuItems = [
    'Counter', 'Widget Bertingkat', 'User Input Example', 
    'Dynamic List Example', 'Navigasi Sederhana', 'Grid View', 
    'Tentang Saya', 
    'Callback Example', 'Animation Example'
  ];

  final List<IconData> menuIcons = [
    Icons.add_circle_outline, Icons.layers, Icons.keyboard, 
    Icons.list_alt, Icons.route, Icons.grid_view, 
    Icons.person_outline, Icons.space_dashboard, 
    Icons.sync_alt, Icons.animation,
  ];

  final List<String> routeNames = [
    '/counter', '/widget_bertingkat', '/user_input', 
    '/dynamic_list', '/navigasi', '/grid_view', 
    '/tentang',
    '/callback_example', '/animation_example'
  ];

  Set<int> clickedButtons = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyPorto')),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

    Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: navyMid, // Warna navy dari tema kamu
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: gold, width: 1.5), // Aksen emas
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: gold,
            child: ClipOval(
              child: Image.asset(
                    'assets/images/naima.jpg', 
                fit: BoxFit.cover,
                width: 70,
                height: 70,
                // Menangani error jika foto tidak ditemukan
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person, size: 35, color: Colors.white);
                },
              ),
            ),
          ),
          const SizedBox(width: 18),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nazwa Ima Fadia',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: goldLight,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '20241320084 Sistem Informasi', 
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
      
      const SizedBox(height: 25),
      
      const Text(
        'Cek hasil karyaku disini:',
        style: TextStyle(
          fontSize: 16, 
          fontWeight: FontWeight.bold, 
          color: goldLight,
          letterSpacing: 0.5,
        ),
      ),
      const SizedBox(height: 12),
      
      Expanded(
        child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            bool isClicked = clickedButtons.contains(index);

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isClicked ? gold : Colors.grey[300],
                  foregroundColor: navyDark, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  alignment: Alignment.centerLeft, 
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                ),
                onPressed: () {
                  setState(() {
                    clickedButtons.add(index);
                  });
                  Navigator.pushNamed(context, routeNames[index]);
                },
                icon: Icon(menuIcons[index], size: 24),
                label: Text(
                  menuItems[index],
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
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

// =====================================================================
// HALAMAN YANG DIBUAT
// =====================================================================

// 1. Counter
class CounterScreen extends StatefulWidget { 
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> { 
  int _counter = 0;

  void _incrementCounter() { 
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() { 
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: surface, 
      
      appBar: AppBar(
        backgroundColor: navyDark,
        title: const Text('Counter Example', style: TextStyle(color: goldLight)),
        iconTheme: const IconThemeData(color: goldLight),
      ),
      
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[
            const Text( 
              'Nilai Counter saat ini:',
              style: TextStyle(color: goldLight, fontSize: 18), 
            ),
            const SizedBox(height: 12), 
            Text(
              '$_counter',
              style: TextStyle(
                color: gold, 
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton( 
            onPressed: _decrementCounter,
            tooltip: 'Kurangi',
            backgroundColor: gold, 
            heroTag: "btn_decrement",
            child: const Icon(Icons.remove, color: navyDark), 
          ),
          
          const SizedBox(width: 16), 
          
          FloatingActionButton( 
            onPressed: _incrementCounter,
            tooltip: 'Tambah',
            backgroundColor: gold, 
            heroTag: "btn_increment",
            child: const Icon(Icons.add, color: navyDark), 
          ),
        ],
      ),
    );
  }
}

// 2. Widget Bertingkat
class WidgetBertingkatScreen extends StatelessWidget {
  const WidgetBertingkatScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: surface, 
      
      appBar: AppBar( 
        backgroundColor: navyDark,
        title: const Text('Widget Bertingkat', style: TextStyle(color: goldLight)),
        iconTheme: const IconThemeData(color: goldLight), 
      ), 
      
      body: Center( 
        child: SingleChildScrollView( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: gold, width: 3), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect( 
                  borderRadius: BorderRadius.circular(17),
                  child: Image.asset(
                    'assets/images/60.jpg', 
                    width: 275, 
                    height: 250, 
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 275,
                        height: 250,
                        color: navyMid,
                        child: const Icon(Icons.image_not_supported, size: 100, color: goldDim),
                      );
                    },
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              const Text(
                'Harmoni Cahaya Senja', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25, 
                  fontWeight: FontWeight.bold,
                  color: goldLight,
                ), 
              ),
              
              const SizedBox(height: 10),
              
              const Text(
                'Menikmati keheningan di tepi pantai dalam balutan pantulan sinar matahari yang menenangkan jiwa.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 10, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 3. User Input Example
class UserInputScreen extends StatefulWidget {
  const UserInputScreen({Key? key}) : super(key: key);

  @override
  _UserInputScreenState createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final TextEditingController _controller = TextEditingController();
  String _inputText = '';

  int get _charCount => _inputText.length;
  int get _wordCount => _inputText.trim().isEmpty ? 0 : _inputText.trim().split(RegExp(r'\s+')).length;
  int get _sentenceCount => _inputText.trim().isEmpty ? 0 : _inputText.split(RegExp(r'[.!?]+')).where((s) => s.isNotEmpty).length;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface, 
      appBar: AppBar(
        backgroundColor: navyDark,
        title: const Text('User Input Example', style: TextStyle(color: goldLight)),
        iconTheme: const IconThemeData(color: goldLight),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan Teks:',
              style: TextStyle(color: goldLight, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              maxLines: 5,
              style: const TextStyle(color: Colors.white),
              onChanged: (val) => setState(() => _inputText = val),
              decoration: const InputDecoration(
                hintText: 'Mulai mengetik di sini...',
                hintStyle: TextStyle(color: Colors.white24),
                filled: true,
                fillColor: navyDark,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: goldDim),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: gold, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  _controller.clear();
                  setState(() => _inputText = '');
                },
                icon: const Icon(Icons.delete_outline, color: gold),
                label: const Text('Hapus Teks', style: TextStyle(color: gold)),
              ),
            ),
            
            const SizedBox(height: 20),

            const Text(
              'Output Real-time:',
              style: TextStyle(color: goldLight, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: navyDark,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: goldDim),
              ),
              child: Text(
                _inputText.isEmpty ? 'Belum ada input...' : _inputText,
                style: const TextStyle(color: gold, fontSize: 18),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                _buildStatBox('Karakter', _charCount.toString()),
                const SizedBox(width: 12),
                _buildStatBox('Kata', _wordCount.toString()),
                const SizedBox(width: 12),
                _buildStatBox('Kalimat', _sentenceCount.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: navyMid,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: navyLight),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(color: gold, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: goldDim, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

// 4. Dynamic List Example
class DynamicListScreen extends StatefulWidget { 
  const DynamicListScreen({super.key});

  @override
  _DynamicListScreenState createState() => _DynamicListScreenState();
}

class _DynamicListScreenState extends State<DynamicListScreen> { 
  List<String> items = ['Apple', 'Banana', 'Orange', 'Grapes', 'Mango'];
  TextEditingController textEditingController = TextEditingController();

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: surface, 
      appBar: AppBar(
        backgroundColor: navyDark, 
        title: const Text('Dynamic List Example', style: TextStyle(color: goldLight)),
        iconTheme: const IconThemeData(color: goldLight),
      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[ 
          // Teks Pengantar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar Belanja Hari Ini',
                  style: TextStyle(color: gold, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Catat semua kebutuhanmu agar tidak ada yang terlewat.',
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder( 
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: items.length,
              itemBuilder: (context, index) { 
                return Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  decoration: BoxDecoration(
                    color: navyMid, 
                    borderRadius: BorderRadius.zero, 
                    border: Border.all(color: navyLight), 
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.shopping_basket, color: gold),
                    title: Text(
                      items[index],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                      onPressed: () => _removeItem(index), 
                    ),
                  ),
                );
              },
            ),
          ),
          
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: navyDark,
              borderRadius: BorderRadius.zero, 
            ),
            child: Row(
              children: <Widget>[ 
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    style: const TextStyle(color: Colors.white), 
                    decoration: const InputDecoration( 
                      labelText: 'Tambah Item Baru',
                      labelStyle: TextStyle(color: goldLight),
                      // Mengatur border TextField agar kotak sempurna
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: goldDim),
                        borderRadius: BorderRadius.zero,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: gold, width: 2.0),
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12), 
                
                Container(
                  decoration: const BoxDecoration(
                    color: gold, 
                    borderRadius: BorderRadius.zero, 
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: navyDark), 
                    onPressed: () {
                      if (textEditingController.text.isNotEmpty) {
                        setState(() {
                          items.add(textEditingController.text); 
                          textEditingController.clear(); 
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 5. Navigasi Sederhana
class NavigasiScreen extends StatelessWidget {
  const NavigasiScreen({Key? key}) : super(key: key);

  Widget _buildNavButton(BuildContext context, String title, IconData icon, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        width: double.infinity, 
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: gold, 
            foregroundColor: navyDark,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            alignment: Alignment.centerLeft, 
          ),
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          icon: Icon(icon),
          label: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface, 
      
      appBar: AppBar(
        backgroundColor: navyDark,
        title: const Text('Navigasi Sederhana', style: TextStyle(color: goldLight)),
        iconTheme: const IconThemeData(color: goldLight), 
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih tujuan navigasimu:',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildNavButton(context, 'Pergi ke Counter', Icons.add_circle_outline, '/counter'),
            _buildNavButton(context, 'Pergi ke Widget Bertingkat', Icons.layers, '/widget_bertingkat'),
            _buildNavButton(context, 'Pergi ke User Input', Icons.keyboard, '/user_input'),
            _buildNavButton(context, 'Pergi ke Dynamic List', Icons.list_alt, '/dynamic_list'),
            _buildNavButton(context, 'Pergi ke Grid View', Icons.grid_view, '/grid_view'),
            _buildNavButton(context, 'Pergi ke Tentang Saya', Icons.person_outline, '/tentang'),
            _buildNavButton(context, 'Pergi ke Callback Example', Icons.sync_alt, '/callback_example'),
            _buildNavButton(context, 'Pergi ke Animation Example', Icons.animation, '/animation_example'),
            
            const SizedBox(height: 20), 

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], 
                  foregroundColor: navyDark,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.centerLeft, 
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Dashboard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 6. Grid View
class GridViewScreen extends StatelessWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface, 
      
      appBar: AppBar(
        backgroundColor: navyDark,
        title: const Text('Grid View Example', style: TextStyle(color: goldLight)),
        iconTheme: const IconThemeData(color: goldLight),
        elevation: 0, 
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2, 
          crossAxisSpacing: 15.0, 
          mainAxisSpacing: 15.0,  
          shrinkWrap: true,
          childAspectRatio: 1.0,  
          children: [
            _buildMenuButton(context, 'Pantai', Icons.beach_access),
            _buildMenuButton(context, 'Gunung', Icons.terrain),
            _buildMenuButton(context, 'Budaya', Icons.museum),
            _buildMenuButton(context, 'Kuliner', Icons.restaurant),
            _buildMenuButton(context, 'Sejarah', Icons.history_edu),
            _buildMenuButton(context, 'Festival', Icons.celebration),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(menuTitle: title, icon: icon),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: gold, 
        foregroundColor: navyDark, 
        elevation: 4, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), 
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40), 
          const SizedBox(height: 12),
          Text(
            title, 
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


class MenuPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;

  const MenuPage({super.key, required this.menuTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface, // Tema latar gelap
      
      appBar: AppBar(
        title: Text(menuTitle, style: const TextStyle(color: goldLight)),
        backgroundColor: navyDark,
        iconTheme: const IconThemeData(color: goldLight),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: goldLight), 
            const SizedBox(height: 20),
            Text(
              'Halaman $menuTitle',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 30),
            
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: gold, 
                foregroundColor: navyDark,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 7. Tentang Saya
class TentangSayaScreen extends StatelessWidget {
  const TentangSayaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface, 
      appBar: AppBar(
        backgroundColor: navyDark,
        title: const Text('Tentang Saya', style: TextStyle(color: goldLight)),
        iconTheme: const IconThemeData(color: goldLight),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                  radius: 60,
                  backgroundColor: navyLight,
                  backgroundImage: const AssetImage('assets/images/naima.jpg'), 
                  child: null, 
                ),
                  const SizedBox(height: 16),
                  const Text(
                    'Nazwa Ima Fadia',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: gold),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '20241320084', 
                    style: TextStyle(fontSize: 16, color: goldDim),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Mahasiswa Sistem Informasi',
                    style: TextStyle(fontSize: 16, color: goldDim),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),

            _buildSectionTitle(Icons.info_outline, 'Tentang Saya'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: navyMid,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: navyLight),
              ),
              child: const Text(
                'Saya adalah mahasiswa Sistem Informasi semester 4 di Universitas Kebangsaan Republik Indonesia (UKRI) yang berfokus pada analisis sistem dan pengembangan perangkat lunak. Saat ini, saya aktif mengasah kemampuan dalam UI/UX Design dan System Analysis, sembari berkontribusi aktif sebagai Humas di organisasi kemahasiswaan kampus.',
                style: TextStyle(color: Colors.white70, height: 1.5),
              ),
            ),
            const SizedBox(height: 25),

            _buildSectionTitle(Icons.school_outlined, 'Data Mahasiswa'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: navyMid,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: navyLight),
              ),
              child: Column(
                children: [
                  _buildInfoRow('NPM', '20241320084'),
                  _buildInfoRow('Program Studi', 'Sistem Informasi'),
                  _buildInfoRow('Universitas', 'Universitas Kebangsaan Republik Indonesia'),
                ],
              ),
            ),
            const SizedBox(height: 25),

            _buildSectionTitle(Icons.account_tree_outlined, 'Pengalaman Organisasi'),
            _buildExperienceCard(
              'Komisi 4 (Humas Eksternal & Publikasi Dokumentasi)',
              'DPM KEMA UKRI • 2025 - 2026',
              'Mengelola komunikasi antar lembaga legislatif kampus dan branding media sosial.',
            ),
            _buildExperienceCard(
              'Humas',
              'HMSI UKRI • 2025 - 2026',
              'Bertanggung jawab dalam menjembatani komunikasi yang harmonis antara internal dan eksternal.',
            ),
            _buildExperienceCard(
              'OSIS Bidang 1 (Keagamaan)',
              'SMA HANDAYANI 1 PAMEUNGPEUK • 2020 - 2021',
              'Mengelola kegiatan amal dan penghimpunan donasi sosial untuk menumbuhkan kepedulian.',
            ),
            const SizedBox(height: 25),

            _buildSectionTitle(Icons.bolt, 'Keahlian Saya'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: navyMid,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: navyLight),
              ),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  _buildSkillChip('UML (Use Case, Sequence)', gold),
                  _buildSkillChip('ERD & Database Design', goldLight),
                  _buildSkillChip('DFD (Data Flow Diagram)', gold),
                  _buildSkillChip('Heuristic Evaluation', goldLight),
                  _buildSkillChip('SRS Documentation', gold),
                  _buildSkillChip('BPMN Modeling', goldLight),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String label, Color themeColor) {
  return Chip(
    label: Text(
      label,
      style: const TextStyle(
        color: navyDark, 
        fontSize: 12, 
        fontWeight: FontWeight.bold
      ),
    ),
    backgroundColor: themeColor, 
    padding: const EdgeInsets.all(4),
    side: const BorderSide(color: goldLight, width: 1), 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}

  Widget _buildSectionTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: gold, size: 20),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: goldLight),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label, style: const TextStyle(color: goldDim, fontWeight: FontWeight.w500)),
          ),
          const Text(': ', style: TextStyle(color: goldDim)),
          Expanded(child: Text(value, style: const TextStyle(color: Colors.white))),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(String role, String org, String desc) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: navyMid,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: navyLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(role, style: const TextStyle(color: gold, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 4),
          Text(org, style: const TextStyle(color: goldLight, fontSize: 12)),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}


// 8. Callback Example
class CallbackScreen extends StatelessWidget {
  const CallbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showMessage(String message) {
      debugPrint('Message received: $message');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Callback dijalankan: $message', 
            style: const TextStyle(color: surface, fontWeight: FontWeight.bold)
          ),
          backgroundColor: goldLight, 
          duration: const Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
      backgroundColor: surface, 
      appBar: AppBar(
        backgroundColor: navyDark, 
        title: const Text('Callback Example', style: TextStyle(color: goldLight)),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tekan tombol untuk memicu Callback',
              style: TextStyle(color: goldLight, fontSize: 16),
            ),
            const SizedBox(height: 20),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: gold,       
                foregroundColor: navyDark,  
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                _showMessage('Button pressed');
              },
              child: const Text(
                'Press Me',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 9. Animation Example
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  Color _containerColor = navyLight;
  bool _isGold = false;

  void _changeColor() {
    setState(() {
      _isGold = !_isGold;
      _containerColor = _isGold ? gold : navyLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      appBar: AppBar(
        backgroundColor: navyDark,
        title: const Text('Animation Example', style: TextStyle(color: goldLight)),
        iconTheme: const IconThemeData(color: goldLight),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tekan tombol untuk mengubah warna:',
              style: TextStyle(color: goldLight, fontSize: 16),
            ),
            const SizedBox(height: 30),
            AnimatedContainer(
              duration: const Duration(seconds: 1), 
              curve: Curves.easeInOut, 
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: _containerColor,
                borderRadius: BorderRadius.circular(_isGold ? 100 : 20), 
                border: Border.all(color: goldLight, width: 2),
              ),
              child: Center(
                child: Text(
                  _isGold ? 'GOLD' : 'NAVY',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _isGold ? navyDark : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        backgroundColor: gold,
        child: const Icon(Icons.color_lens, color: navyDark),
      ),
    );
  }
}