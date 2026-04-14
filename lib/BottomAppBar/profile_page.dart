import 'package:biznes_ui/auth/register.dart';
import 'package:biznes_ui/model/user_model.dart';
import 'package:biznes_ui/profile_edit/FRQ_page.dart';
import 'package:biznes_ui/profile_edit/bio_page.dart';
import 'package:biznes_ui/profile_edit/call_center_page.dart';
import 'package:biznes_ui/profile_edit/phone_page.dart';
import 'package:biznes_ui/profile_edit/shaxsiy_malumotlar_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool darkMode = false;
  bool notification = true;
  UserModel user = UserModel(
    name: "Alisher Abdullayev",
    username: "@alisher_99",
    age: "22",
    phone: "+998 90 123 45 67",
    bio: "O'zingiz haqida yozing",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3A6FE2), Color(0xFF5B8DEF)],
              ),
              borderRadius: BorderRadius.only(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Profil",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("⚠️", style: TextStyle(fontSize: 44)),
                                    Text(
                                      "Hisobni o'chirish ",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Hisobingizni o'chirishni xohlaysizmi? ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      width: 270,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color.fromARGB(
                                          252,
                                          253,
                                          171,
                                          167,
                                        ),
                                      ),
                                      child: Text(
                                        '''\n  ❌ Diqqat! Quyidagilar butunlay o'chiriladi va qaytarib bo'lmaydi:\n\n
    • Barcha shaxsiy ma'lumotlar
    • Barcha tejash maqsadlari
    • Barcha daromad va xarajat tarixi
    • Profil rasmi va sozlamalar''',
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 45,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage(),
                                            ),
                                            (route) => false,
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          " Ha, o'chirish ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 45,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "Bekor qilish",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.logout, size: 16),
                      label: const Text("Chiqish"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white24,
                      child: const Icon(Icons.person, size: 30),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          user.username,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          user.age + " yosh",
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  '"Har kuni ozinga tejash — katta orzularga yetkazadi."',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                buildCard([
                  buildItem(
                    subtitle: user.age,
                    Icons.person,
                    "Shaxsiy ma'lumotlar",
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ShaxsiyMalumotlarPage(userModel: user),
                        ),
                      );

                      if (result != null) {
                        setState(() {});
                        user = result;
                      }
                    },
                  ),

                  buildItem(
                    Icons.phone,
                    "Telefon raqami",
                    subtitle: user.phone,
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PhonePage(phone: user.phone),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          user.phone = result;
                        });
                      }
                    },
                  ),
                  buildItem(
                    Icons.edit,
                    "Bio",
                    subtitle: user.bio,
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BioPage(bio: user.bio),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          user.bio = result;
                        });
                      }
                    },
                  ),
                ]),

                buildCard([
                  switchItem(
                    icon: Icons.dark_mode,
                    title: "Qorong'i rejim",
                    value: darkMode,
                    onChanged: (v) {
                      setState(() => darkMode = v);
                    },
                  ),
                  switchItem(
                    icon: Icons.notifications,
                    title: "Bildirishnomalar",
                    value: notification,
                    onChanged: (v) {
                      setState(() => notification = v);
                    },
                  ),
                ]),

                buildCard([
                  buildItem(
                    Icons.help,
                    "Ko'p beriladigan savollar",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FrqPage()),
                      );
                    },
                  ),
                  buildItem(
                    Icons.support,
                    "Qo'llab-quvvatlash",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CallCenterPage(),
                        ),
                      );
                    },
                  ),
                  buildItem(Icons.info_outline_rounded, "Ilova haqida"),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget buildItem(
    IconData icon,
    String title, {
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        child: Icon(icon, color: Colors.black54),
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget switchItem({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        child: Icon(icon, color: Colors.black54),
      ),
      title: Text(title),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }
}
