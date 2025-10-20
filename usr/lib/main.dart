import 'package:flutter/material.dart';

// 1. Blog Model
class Blog {
  final String id;
  final String title;
  final String img;
  final String desc;
  final String creatorRole;

  Blog({
    required this.id,
    required this.title,
    required this.img,
    required this.desc,
    required this.creatorRole,
  });
}

// 2. Data Source
final List<Blog> defaultBlogs = [
  Blog(
      id: 'b1',
      title: "High-Yield Cotton Seeds",
      // Corrected the broken image link from share.google.com
      img: "https://images.unsplash.com/photo-1621905359280-72a4b79f2213?w=500&q=80",
      desc:
          "Modern cotton hybrids have changed the landscape for farms. These varieties are bred for pest tolerance and improved fiber quality, reducing heavy pesticide use. Paired with proper fertilization and timing, yields become more consistent. Always test soil and choose a variety suited to your local climate.",
      creatorRole: 'author'),
  Blog(
      id: 'b2',
      title: "Best Wheat Growth Tips",
      img: "https://images.unsplash.com/photo-1501004318641-b39e6451bec6",
      desc:
          "Wheat thrives in well-prepared seedbeds and balanced nutrition during tillering and heading. Certified seed, early irrigation, and integrated disease management help secure yields. Rotating with legumes replenishes nitrogen and increases long-term soil health. Record keeping supports continuous improvement each season.",
      creatorRole: 'author'),
  Blog(
      id: 'b3',
      title: "Rice Cultivation Guide",
      img: "https://images.unsplash.com/photo-1609157686283-94fd1d6f37ef",
      desc:
          "Rice requires precise water control — alternate wetting and drying saves water while maintaining yield. Healthy seedlings from clean nurseries and timely transplanting are essential. Use organic matter to boost soil structure and reduce chemical dependency. Monitor for pests regularly to act early.",
      creatorRole: 'author'),
  Blog(
      id: 'b4',
      title: "Soil Care & Fertility",
      img: "https://images.unsplash.com/photo-1560493676-04071c5f467b",
      desc:
          "Healthy soil is the foundation of productivity. Test soil annually and apply amendments based on results. Compost, cover crops, and reduced tillage increase organic matter and water retention. These practices reduce erosion and support long-term farm resilience.",
      creatorRole: 'author'),
  Blog(
      id: 'b5',
      title: "Organic Farming Benefits",
      img: "https://images.unsplash.com/photo-1518977956815-dee006b4b23a",
      desc:
          "Organic methods avoid synthetic chemicals and protect biodiversity and consumer health. Compost, biological pest control, and crop rotations maintain fertility while lowering input costs. While transition needs planning, consumers often pay premiums for organic produce.",
      creatorRole: 'author'),
  Blog(
      id: 'b6',
      title: "Farmer Success Story",
      img: "https://images.unsplash.com/photo-1615937693739-47b4b9e8a940",
      desc:
          "Saeed transformed his small plot through drip irrigation and improved seeds, doubling yield in two seasons. Careful record-keeping and trial plots helped him adapt best practices. His success motivated neighboring farms to adopt similar changes and shares lessons in local meetings.",
      creatorRole: 'author'),
  Blog(
      id: 'b7',
      title: "Irrigation Tech Trends",
      img: "https://images.unsplash.com/photo-1590080875832-1a88f8c7fca2",
      desc:
          "Smart irrigation uses sensors and automation to water only when needed, saving water and energy. Farmers can monitor soil moisture remotely and schedule irrigation precisely. Investing in sensor-based systems improves efficiency and supports climate-resilient farming.",
      creatorRole: 'author'),
  Blog(
      id: 'b8',
      title: "Sustainable Crop Rotation",
      img: "https://images.unsplash.com/photo-1578991624412-5b0f3b7b9c1a",
      desc:
          "Rotating crops prevents nutrient depletion and breaks pest cycles. Alternating cereals with legumes naturally enhances soil nitrogen and reduces fertilizer needs. Thoughtful rotation planning supports biodiversity and long-term yield stability.",
      creatorRole: 'author'),
  Blog(
      id: 'b9',
      title: "Greenhouse Farming Innovation",
      img: "https://images.unsplash.com/photo-1581578017420-2a8b8a8b5302",
      desc:
          "Controlled-environment agriculture extends growing seasons and increases production for high-value crops. Greenhouses with sensors can regulate temperature, humidity, and irrigation precisely. These systems minimize weather risk and support year-round harvests.",
      creatorRole: 'author'),
  Blog(
      id: 'b10',
      title: "Pest Management Without Harm",
      img: "https://images.unsplash.com/photo-1549060278-3b4f9fb1f3d3",
      desc:
          "Integrated Pest Management combines monitoring, biological control, and targeted interventions to reduce chemical use. Encouraging natural predators and using pheromone traps keeps pests at manageable levels. IPM maintains ecosystem balance and crop health.",
      creatorRole: 'author')
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BlogListScreen(),
    );
  }
}

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farming Blogs'),
      ),
      body: ListView.builder(
        itemCount: defaultBlogs.length,
        itemBuilder: (context, index) {
          final blog = defaultBlogs[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            elevation: 5.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  blog.img,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                        size: 48,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        blog.desc,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
