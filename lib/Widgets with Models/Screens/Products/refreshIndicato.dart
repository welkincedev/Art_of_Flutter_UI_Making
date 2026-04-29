import 'package:flutter/material.dart';

void main() {
  runApp(const RefreshIndicatorApp());
}

// ==================== APP ROOT ====================
class RefreshIndicatorApp extends StatelessWidget {
  const RefreshIndicatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RefreshIndicator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const RefreshIndicatorScreen(),
    );
  }
}

// ==================== DATA MODEL ====================
class Post {
  final int id;
  final String title;
  final String author;
  final String content;
  final String timestamp;
  final int likes;

  Post({
    required this.id,
    required this.title,
    required this.author,
    required this.content,
    required this.timestamp,
    required this.likes,
  });
}

// ==================== MAIN SCREEN ====================
class RefreshIndicatorScreen extends StatefulWidget {
  const RefreshIndicatorScreen({Key? key}) : super(key: key);

  @override
  State<RefreshIndicatorScreen> createState() =>
      _RefreshIndicatorScreenState();
}

class _RefreshIndicatorScreenState extends State<RefreshIndicatorScreen> {
  List<Post> posts = [];
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  // ==================== INITIAL LOAD ====================
  Future<void> _loadPosts() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await Future.delayed(const Duration(seconds: 2));

      posts = [
        Post(
          id: 1,
          title: 'Flutter RefreshIndicator Guide',
          author: 'John Doe',
          content:
          'Learn how to implement pull-to-refresh in Flutter applications.',
          timestamp: '2 hours ago',
          likes: 234,
        ),
        Post(
          id: 2,
          title: 'State Management Best Practices',
          author: 'Jane Smith',
          content:
          'Explore different state management solutions in Flutter ecosystem.',
          timestamp: '4 hours ago',
          likes: 189,
        ),
        Post(
          id: 3,
          title: 'Custom Widgets in Flutter',
          author: 'Mike Johnson',
          content: 'Create beautiful and reusable custom widgets for your apps.',
          timestamp: '6 hours ago',
          likes: 342,
        ),
      ];

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  // ==================== REFRESH ====================
  Future<void> _refreshPosts() async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      List<Post> newPosts = [
        Post(
          id: DateTime.now().millisecondsSinceEpoch,
          title: 'Newly Fetched Post',
          author: 'New Author',
          content:
          'This post was added by refresh action at ${DateTime.now()}',
          timestamp: 'just now',
          likes: 0,
        ),
      ];

      setState(() {
        posts = [...newPosts, ...posts];
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Posts refreshed successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error refreshing posts: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ==================== UI ====================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator Demo'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoading && posts.isEmpty
          ? _buildLoadingState()
          : errorMessage != null
          ? _buildErrorState()
          : _buildList(),
    );
  }

  // ==================== LIST WITH REFRESH ====================
  Widget _buildList() {
    return RefreshIndicator(
      onRefresh: _refreshPosts,
      color: Colors.blueAccent,
      backgroundColor: Colors.white,
      strokeWidth: 3,
      displacement: 40,
      child: posts.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts[index]);
        },
      ),
    );
  }

  // ==================== LOADING ====================
  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // ==================== ERROR ====================
  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            errorMessage ?? 'Something went wrong',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _loadPosts,
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }

  // ==================== EMPTY ====================
  Widget _buildEmptyState() {
    return const Center(
      child: Text("No posts available"),
    );
  }
}

// ==================== POST CARD ====================
class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(post.content),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("❤️ ${post.likes}"),
                Text(post.timestamp),
              ],
            )
          ],
        ),
      ),
    );
  }
}