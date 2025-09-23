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
  final String videoUrl; 
  final String level ;

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
    required this.videoUrl,
    required this.level,
  });

  // Sample YouTube courses
  static List<Course> recommendedCourses = [
    Course(
      id: '1',
      title: 'UI/UX Design Tutorial',
      instructor: 'DesignCourse (YouTube)',
      thumbnailUrl: 'https://img.youtube.com/vi/9s8j2cYzyi4/maxresdefault.jpg',
      category: 'Design',
      rating: 4.8,
      studentsCount: 1200,
      duration: 300,
      description: 'Learn UI/UX design fundamentals with practical projects.',
      videoUrl: 'https://www.youtube.com/watch?v=9s8j2cYzyi4',
      level: 'Beginner',
    ),
    Course(
      id: '2',
      title: 'Flutter Full Course',
      instructor: 'freeCodeCamp.org',
      thumbnailUrl: 'https://img.youtube.com/vi/VPvVD8t02U8/maxresdefault.jpg',
      category: 'Development',
      rating: 4.9,
      studentsCount: 2100,
      duration: 480,
      description: 'Learn Flutter and Dart by building real apps.',
      videoUrl: 'https://www.youtube.com/watch?v=VPvVD8t02U8',
      level: 'intermediate',
    ),
    Course(
      id: '3',
      title: 'Web Development Bootcamp',
      instructor: 'freeCodeCamp.org',
      thumbnailUrl: 'https://img.youtube.com/vi/zJSY8tbf_ys/maxresdefault.jpg',
      category: 'Development',
      rating: 4.7,
      studentsCount: 3100,
      duration: 600,
      description: 'Complete web development tutorial from scratch.',
      videoUrl: 'https://www.youtube.com/watch?v=zJSY8tbf_ys',
      level: 'Advanced',
    ),
  ];

  static List<Course> trendingCourses = [
    Course(
      id: '4',
      title: 'Digital Marketing Full Course',
      instructor: 'Simplilearn',
      thumbnailUrl: 'https://img.youtube.com/vi/nU-IIXBWlS4/maxresdefault.jpg',
      category: 'Marketing',
      rating: 4.6,
      studentsCount: 3300,
      duration: 420,
      description: 'Learn digital marketing strategies in this full course.',
      videoUrl: 'https://www.youtube.com/watch?v=nU-IIXBWlS4',
      level: 'Beginner',
    ),
    Course(
      id: '5',
      title: 'Photography Tutorial for Beginners',
      instructor: 'Academy of Photography',
      thumbnailUrl: 'https://img.youtube.com/vi/OJKa8csYOg0/maxresdefault.jpg',
      category: 'Photography',
      rating: 4.5,
      studentsCount: 1800,
      duration: 240,
      description: 'Master photography basics and advanced techniques.',
      videoUrl: 'https://www.youtube.com/watch?v=OJKa8csYOg0',
      level: 'Intermediate',
    ),
    Course(
      id: '6',
      title: 'Business Analytics Full Course',
      instructor: 'Great Learning',
      thumbnailUrl: 'https://img.youtube.com/vi/Tm_t3MMuaMw/maxresdefault.jpg',
      category: 'Business',
      rating: 4.8,
      studentsCount: 2500,
      duration: 380,
      description: 'Learn business analytics from scratch.',
      videoUrl: 'https://www.youtube.com/watch?v=Tm_t3MMuaMw',
      level: 'Advanced',  
    ),
  ];

  static List<Course> leveledCourses = [];
}
