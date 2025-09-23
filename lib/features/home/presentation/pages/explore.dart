import 'package:flutter/material.dart';
import 'package:skill_swap/features/home/data/models/course_model.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String _selectedCategory = "All";
  String _searchQuery = "";

  List<Course> _filterCourses(List<Course> courses) {
    return courses.where((course) {
      final matchesCategory =
          _selectedCategory == "All" || course.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          course.title.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCourses = _filterCourses(Course.leveledCourses);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search for courses...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Categories
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _CategoryChip(
                    label: 'All',
                    isSelected: _selectedCategory == "All",
                    onTap: () => setState(() => _selectedCategory = "All"),
                  ),
                  _CategoryChip(
                    label: 'Design',
                    isSelected: _selectedCategory == "Design",
                    onTap: () => setState(() => _selectedCategory = "Design"),
                  ),
                  _CategoryChip(
                    label: 'Technology',
                    isSelected: _selectedCategory == "Technology",
                    onTap: () => setState(() => _selectedCategory = "Technology"),
                  ),
                  _CategoryChip(
                    label: 'Arts',
                    isSelected: _selectedCategory == "Arts",
                    onTap: () => setState(() => _selectedCategory = "Arts"),
                  ),
                  _CategoryChip(
                    label: 'Business',
                    isSelected: _selectedCategory == "Business",
                    onTap: () => setState(() => _selectedCategory = "Business"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              "Popular Courses",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Course List
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  return _CourseListTile(course: course);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => onTap(),
        selectedColor: Colors.blue[100],
        labelStyle: TextStyle(
          color: isSelected ? Colors.blue[700] : Colors.grey[800],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class _CourseListTile extends StatelessWidget {
  final Course course;

  const _CourseListTile({required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            course.thumbnailUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          course.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(course.description),
        trailing: Text(
          course.level.toUpperCase(),
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          // Navigate to course details
        },
      ),
    );
  }
}
