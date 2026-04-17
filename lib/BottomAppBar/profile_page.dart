import 'package:biznes_ui/auth/register.dart';
import 'package:biznes_ui/l10n/app_localizations.dart';
import 'package:biznes_ui/model/user_model.dart';
import 'package:biznes_ui/profile_edit/FRQ_page.dart';
import 'package:biznes_ui/profile_edit/call_center_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Function(String) changeLang;

  const ProfilePage({super.key, required this.changeLang});

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
    final t = AppLocalizations.of(context)!;

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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      t.profile,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),

                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Column(
                                children: [
                                  const Text("⚠️", style: TextStyle(fontSize: 40)),
                                  Text(t.delete_account),
                                  Text(t.delete_warning_text),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(t.cancel),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (_) => RegisterPage()),
                                      (route) => false,
                                    );
                                  },
                                  child: Text(t.confirm_delete),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.logout, size: 16),
                      label: Text(t.logout),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    const CircleAvatar(radius: 30, child: Icon(Icons.person)),
                    const SizedBox(width: 12),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name, style: const TextStyle(color: Colors.white)),
                        Text(user.username, style: const TextStyle(color: Colors.white70)),
                        Text("${user.age} ${t.age}", style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [

                buildCard([
                  buildItem(Icons.person, t.personal_info, subtitle: user.age),
                  buildItem(Icons.phone, t.phone, subtitle: user.phone),
                  buildItem(Icons.edit, t.bio, subtitle: user.bio),
                ]),

                buildCard([
                  switchItem(Icons.dark_mode, t.dark_mode, darkMode, (v) {
                    setState(() => darkMode = v);
                  }),
                  switchItem(Icons.notifications, t.notifications, notification, (v) {
                    setState(() => notification = v);
                  }),
                ]),

                buildCard([
                  buildItem(Icons.help, t.faq, onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const FrqPage()));
                  }),

                  buildItem(Icons.support, t.support, onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CallCenterPage()));
                  }),

                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      leading: const Icon(Icons.language),
                      title: Text(t.change_language),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(t.change_language),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      widget.changeLang('uz');
                                      Navigator.pop(context);
                                    },
                                    child: const Text("UZ"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      widget.changeLang('ru');
                                      Navigator.pop(context);
                                    },
                                    child: const Text("RU"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      widget.changeLang('en');
                                      Navigator.pop(context);
                                    },
                                    child: const Text("EN"),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  buildItem(Icons.info, t.about_app),
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

  Widget switchItem(
    IconData icon,
    String title,
    bool value,
    Function(bool) onChanged,
  ) {
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