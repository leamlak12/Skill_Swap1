class Course {
  final String id;
  final String title;
  final String instructor;
  final String thumbnailUrl;
  final String category;
  final double rating;
  final int studentsCount;
  final int duration; // in minutes
  final String description;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.thumbnailUrl,
    required this.category,
    required this.rating,
    required this.studentsCount,
    required this.duration,
    required this.description,
  });

  // Sample data for testing
  static List<Course> recommendedCourses = [
    Course(
      id: '1',
      title: 'UI/UX Design Fundamentals',
      instructor: 'Sarah Johnson',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1559028012-481c04fa702d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=936&q=80',
      category: 'Design',
      rating: 4.8,
      studentsCount: 1234,
      duration: 320,
      description:
          'Master the fundamentals of UI/UX design with practical projects.',
    ),
    Course(
      id: '2',
      title: 'Flutter App Development',
      instructor: 'Alex Chen',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1551650975-87deedd944c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
      category: 'Development',
      rating: 4.9,
      studentsCount: 2156,
      duration: 480,
      description: 'Build beautiful cross-platform apps with Flutter.',
    ),
    Course(
      id: '5',
      title: 'Web Development Bootcamp',
      instructor: 'David Miller',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2072&q=80',
      category: 'Development',
      rating: 4.7,
      studentsCount: 3245,
      duration: 560,
      description: 'Complete web development from scratch to deployment.',
    ),
  ];

  static List<Course> trendingCourses = [
    Course(
      id: '3',
      title: 'Digital Marketing Mastery',
      instructor: 'Emily Parker',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2015&q=80',
      category: 'Marketing',
      rating: 4.7,
      studentsCount: 3421,
      duration: 420,
      description: 'Learn digital marketing strategies that drive results.',
    ),
    Course(
      id: '4',
      title: 'Photography Essentials',
      instructor: 'Michael Ross',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1542038784456-1ea8e935640e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      category: 'Photography',
      rating: 4.6,
      studentsCount: 1876,
      duration: 240,
      description: 'Master photography basics and advanced techniques.',
    ),
    Course(
      id: '6',
      title: 'Business Analytics',
      instructor: 'Jennifer Lee',
      thumbnailUrl:
          'https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2015&q=80',
      category: 'Business',
      rating: 4.8,
      studentsCount: 2543,
      duration: 380,
      description: 'Learn data-driven business decision making.',
    ),
  ];
}
