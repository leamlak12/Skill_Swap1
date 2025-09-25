import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_swap/features/home/data/models/course_model.dart';
import 'package:skill_swap/features/home/presentation/widgets/course_card.dart';
import 'package:skill_swap/features/home/presentation/pages/explore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Future<void> _handleSignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Pages for bottom navigation
  final List<Widget> _pages = const [
    HomeContent(),
    ExplorePage(),
    Center(child: Text("My Learning")),
    Center(child: Text("Saved")),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? 'User';

    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 4) {
            // Profile BottomSheet
            showModalBottomSheet(
              context: context,
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[100],
                      backgroundImage: user?.photoURL != null
                          ? NetworkImage(user!.photoURL!)
                          : null,
                      child: user?.photoURL == null
                          ? const Icon(Icons.person, color: Colors.blue)
                          : null,
                    ),
                    title: Text(displayName),
                    subtitle: Text(user?.email ?? ''),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: const Text('Settings'),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Sign Out'),
                    onTap: () {
                      Navigator.pop(context);
                      _handleSignOut();
                    },
                  ),
                ],
              ),
            );
          } else {
            setState(() => _currentIndex = index);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: 'My Learning'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

//
// Home content (your old HomePage body)
//
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  String _selectedCategory = "All";

  // Filter courses by selected category
  List<Course> _filterCourses(List<Course> courses) {
    if (_selectedCategory == "All") return courses;
    return courses
        .where((course) => course.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? 'User';

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            title: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  backgroundImage: user?.photoURL != null
                      ? NetworkImage(user!.photoURL!)
                      : null,
                  child: user?.photoURL == null
                      ? const Icon(Icons.person, color: Colors.blue)
                      : null,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      displayName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
            ],
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categories
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _CategoryChip(
                          label: 'All',
                          isSelected: _selectedCategory == "All",
                          onTap: () =>
                              setState(() => _selectedCategory = "All"),
                        ),
                        _CategoryChip(
                          label: 'Design',
                          isSelected: _selectedCategory == "Design",
                          onTap: () =>
                              setState(() => _selectedCategory = "Design"),
                        ),
                        _CategoryChip(
                          label: 'Development',
                          isSelected: _selectedCategory == "Development",
                          onTap: () => setState(
                              () => _selectedCategory = "Development"),
                        ),
                        _CategoryChip(
                          label: 'Marketing',
                          isSelected: _selectedCategory == "Marketing",
                          onTap: () =>
                              setState(() => _selectedCategory = "Marketing"),
                        ),
                        _CategoryChip(
                          label: 'Business',
                          isSelected: _selectedCategory == "Business",
                          onTap: () =>
                              setState(() => _selectedCategory = "Business"),
                        ),
                        _CategoryChip(
                          label: 'Photography',
                          isSelected: _selectedCategory == "Photography",
                          onTap: () => setState(
                              () => _selectedCategory = "Photography"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Recommended Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Courses',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See all'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _filterCourses(Course.recommendedCourses).length,
                      itemBuilder: (context, index) {
                        return CourseCard(
                          course: _filterCourses(
                              Course.recommendedCourses)[index],
                          isLarge: true,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Trending Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending now',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See all'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 310,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _filterCourses(Course.trendingCourses).length,
                      itemBuilder: (context, index) {
                        return CourseCard(
                          course: _filterCourses(Course.trendingCourses)[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// Explore Page
//
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explore")),
      body: const Center(
        child: Text(
          "Explore Courses Here 🚀",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

//
// Category Chip
//
class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => onTap(),
        backgroundColor: Colors.grey[100],
        selectedColor: Colors.blue[100],
        checkmarkColor: Colors.blue[700],
        labelStyle: TextStyle(
          color: isSelected ? Colors.blue[700] : Colors.grey[800],
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }
}
