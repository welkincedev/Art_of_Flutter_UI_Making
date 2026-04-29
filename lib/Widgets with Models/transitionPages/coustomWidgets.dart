import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'detailsPageAnimation.dart';
import 'fadePage.dart';

class CustomAnimationPage extends StatefulWidget {
  const CustomAnimationPage({super.key});

  @override
  State<CustomAnimationPage> createState() => _CustomAnimationPageState();
}

class _CustomAnimationPageState extends State<CustomAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Transitions")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTransitionButton(
              context,
              title: "Slide Transition",
              description: "Move to a Side",
              icon: Icons.slideshow,
              color: Colors.blue,
              transition: SlidePageRoute(
                page: DetailsPageAnimation(title: 'Slide Transition'),
              ),
            ),
            _buildTransitionButton(
              context,
              title: "Fade Transition",
              description: "Fade like a Snow",
              icon: Icons.star_half,
              color: Colors.red,
              transition: FadePageTransition(
                page: FadePage(title: 'Fade Transition'),
              ),
            ),
            _buildTransitionButton(
              context,
              title: "Combined Page Route",
              description: "With Slide,Scale and Fade",
              icon: Icons.add_circle,
              color: Colors.green,
              transition: CombinedTransition(
                page: FadePage(title: 'Fade Transition'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransitionButton(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required PageRoute transition,
  }) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(context, transition);
        },
        trailing: const Icon(Icons.arrow_forward),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white70),
        ),
        leading: Icon(icon, color: Colors.white),
      ),
    );
  }
}

class CombinedTransition extends PageRouteBuilder {
  final Widget page;

  CombinedTransition({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var slideTween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(slideTween),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}

class FadePageTransition extends PageRouteBuilder {
  final Widget page;

  FadePageTransition({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: Duration(milliseconds: 500),
      );
}

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;

  SlidePageRoute({required this.page})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeIn;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
          transitionDuration:
          Duration(milliseconds: 500);
        },
      ) {}
}
