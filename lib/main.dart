import 'package:flutter/material.dart';

void main() {
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const AdminHomePage(),
    );
  }
}

//======================================================
// 1️⃣ ADMIN HOME PAGE
//======================================================

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  static const Color appGreen = Color(0xFF00A74A); // FINAL GREEN COLOR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 13, 6),
        title: const Text("Admin Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            adminButton(
              title: "Supervisors",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SupervisorPage()),
              ),
            ),
            const SizedBox(height: 20),
            adminButton(
              title: "Field Officers",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FieldOfficerPage()),
              ),
            ),
            const SizedBox(height: 20),
            adminButton(
              title: "Analyst",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnalystPage()),
              ),
            ),
            const SizedBox(height: 20),
            adminButton(
              title: "Alerts",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AlertsPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget adminButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, color: Colors.white)),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: AdminHomePage.appGreen,
            ),
            child: const Text("View Details", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

//======================================================
// 2️⃣ SUPERVISOR PAGE
//======================================================

class SupervisorPage extends StatelessWidget {
  const SupervisorPage({super.key});

  static const Color appGreen = Color(0xFF00A74A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: appGreen,
        title: const Text("Supervisors"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          OfficerTile(name: "Nithyasri", siteId: "CHN-KVR-001", officerId: "CHN-sup-014"),
          OfficerTile(name: "Prijitha", siteId: "BLR-VRH-007", officerId: "BLR-sup-017"),
          OfficerTile(name: "Eric Moses", siteId: "TVM-SITE-001", officerId: "TVM-sup-018"),
        ],
      ),
    );
  }
}

//======================================================
// 3️⃣ FIELD OFFICER PAGE
//======================================================

class FieldOfficerPage extends StatelessWidget {
  const FieldOfficerPage({super.key});

  static const Color appGreen = Color(0xFF00A74A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: appGreen,
        title: const Text("Field Officers"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          OfficerTile(name: "Ajai", siteId: "CHN-COM-012", officerId: "FO-CHN-201"),
          OfficerTile(name: "Abhinav", siteId: "MUM-MIT-006", officerId: "FO-MUM-201"),
          OfficerTile(name: "Sanchari Sen", siteId: "KOL-HGL-002", officerId: "FO-KOL-208"),
        ],
      ),
    );
  }
}

//======================================================
// 4️⃣ ANALYST PAGE (NOW LIKE SUPERVISOR + FO)
//======================================================

class AnalystPage extends StatelessWidget {
  const AnalystPage({super.key});

  static const Color appGreen = Color(0xFF00A74A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: appGreen,
        title: const Text("Analysts"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AnalystTile(
            name: "Rohit Sharma",
            analystId: "ANL-001",
            region: "Chennai North",
          ),
          AnalystTile(
            name: "Divya K",
            analystId: "ANL-002",
            region: "Bangalore Central",
          ),
          AnalystTile(
            name: "Suresh Pillai",
            analystId: "ANL-003",
            region: "Mumbai West",
          ),
        ],
      ),
    );
  }
}

//======================================================
// 5️⃣ ALERTS PAGE (CARDS)
//======================================================

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  static const Color appGreen = Color(0xFF00A74A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: appGreen,
        title: const Text("Alerts Overview"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          OverviewTile(
            icon: Icons.dangerous_rounded,
            title: "High Alerts",
            value: "12",
            color: Colors.red,
          ),
          OverviewTile(
            icon: Icons.warning_rounded,
            title: "Medium Alerts",
            value: "35",
            color: Colors.orange,
          ),
          OverviewTile(
            icon: Icons.info_outline_rounded,
            title: "Low Alerts",
            value: "61",
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

//======================================================
// 🔁 REUSABLE OFFICER TILE
//======================================================

class OfficerTile extends StatelessWidget {
  final String name;
  final String siteId;
  final String officerId;

  const OfficerTile({
    super.key,
    required this.name,
    required this.siteId,
    required this.officerId,
  });

  static const Color appGreen = Color(0xFF00A74A);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text("Site ID: $siteId", style: const TextStyle(color: Colors.white70)),
                Text("Officer ID: $officerId", style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: appGreen),
            child: const Text("Remove", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

//======================================================
// 🔁 ANALYST TILE (SIMILAR TO OFFICER TILE)
//======================================================

class AnalystTile extends StatelessWidget {
  final String name;
  final String analystId;
  final String region;

  const AnalystTile({
    super.key,
    required this.name,
    required this.analystId,
    required this.region,
  });

  static const Color appGreen = Color(0xFF00A74A);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text("Analyst ID: $analystId", style: const TextStyle(color: Colors.white70)),
                Text("Region: $region", style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: appGreen),
            child: const Text("Remove", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

//======================================================
// 🔁 OVERVIEW TILE (ANALYST / ALERTS)
//======================================================

class OverviewTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const OverviewTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, color: Colors.white70)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
