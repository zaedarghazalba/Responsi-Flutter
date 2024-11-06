import 'package:flutter/material.dart';
import 'package:responsei_app/auth/login_screen.dart';
import 'package:responsei_app/home/account_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // ignore: unused_field
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _pages = [
    HomeContent(), // Ini adalah halaman Home
    AccountPage(), // Halaman Akun
    // LoginPage(), // Halaman Login tidak perlu dimasukkan ke dalam _pages
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Color cardColor = Colors.grey[200]!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.person,
                  color: Colors.blueGrey[900],
                ),
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_none_outlined, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings_outlined, color: Colors.black),
          ),
        ],
        title: Text(
          'Halo, Zaedar',
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 2) {
            // Ketika logout, arahkan ke LoginPage dan hapus semua halaman sebelumnya
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage()), // Arahkan ke LoginPage
              (Route<dynamic> route) =>
                  false, // Menghapus semua halaman sebelumnya
            );
          }
        },
      ),
    );
  }
}

// Widget terpisah untuk konten halaman utama
class HomeContent extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Color cardColor = Colors.grey[200]!;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Widget Grid View',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        _scrollController.jumpTo(
                          _scrollController.position.pixels + 120,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 150,
            child: GridView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_circle,
                          size: 48,
                          color: Colors.blueGrey[900],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Artist ${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Song ${index + 1}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Widget List View',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Tindakan yang diinginkan saat panah diklik
                  },
                ),
              ],
            ),
          ),
        ),
        // ListView with icons
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 48,
                        color: Colors.blueGrey[900],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Headline ${index + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'This is a song description ${index + 1}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  size: 24,
                                  color: Colors.blueGrey[900],
                                ),
                                const Text('Today-23 min'),
                                const SizedBox(width: 150),
                                Icon(
                                  Icons.play_circle,
                                  size: 24,
                                  color: Colors.blueGrey[900],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: 6,
          ),
        ),
      ],
    );
  }
}
