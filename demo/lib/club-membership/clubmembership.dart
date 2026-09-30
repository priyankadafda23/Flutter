import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClubMembership extends StatefulWidget {
  const ClubMembership({super.key});

  @override
  State<ClubMembership> createState() => _ClubMembershipState();
}

class _ClubMembershipState extends State<ClubMembership> {
  // TextField controller
  final TextEditingController nameController = TextEditingController();

  // Form values
  String role = 'Student';
  bool feesPaid = false;

  // ID of member currently being edited
  int? editingId;

  // List of members
  List<Map<String, dynamic>> members = [];

  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  // Load members from SharedPreferences
  Future<void> _loadMembers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? data = prefs.getString('members');

    if (data != null) {
      setState(() {
        members = List<Map<String, dynamic>>.from(
          jsonDecode(data).map(
            (item) => Map<String, dynamic>.from(item),
          ),
        );
      });
    }
  }

  // Save list as JSON
  Future<void> _persist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String jsonData = jsonEncode(members);

    await prefs.setString('members', jsonData);
  }

  // Save or Update
  Future<void> _saveOrUpdate() async {
    String name = nameController.text.trim();

    // Empty name is not allowed
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter member name'),
        ),
      );
      return;
    }

    // ---------------- SAVE ----------------
    if (editingId == null) {
      int id = DateTime.now().millisecondsSinceEpoch;

      Map<String, dynamic> member = {
        'id': id,
        'name': name,
        'role': role,
        'paid': feesPaid,
      };

      setState(() {
        members.add(member);
      });

      await _persist();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Member saved'),
        ),
      );
    }

    // ---------------- UPDATE ----------------
    else {
      int index = members.indexWhere(
        (member) => member['id'] == editingId,
      );

      if (index != -1) {
        setState(() {
          members[index] = {
            'id': editingId,
            'name': name,
            'role': role,
            'paid': feesPaid,
          };
        });

        await _persist();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Member updated'),
          ),
        );
      }
    }

    _clearForm();
  }

  // Load selected member into form
  void _editMember(Map<String, dynamic> member) {
    setState(() {
      editingId = member['id'];

      nameController.text = member['name'];

      role = member['role'];

      feesPaid = member['paid'];
    });
  }

  // Cancel editing
  void _cancelEdit() {
    _clearForm();
  }

  // Clear form
  void _clearForm() {
    setState(() {
      nameController.clear();
      role = 'Student';
      feesPaid = false;
      editingId = null;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = editingId != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Club Membership Desk'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // ---------------- NAME ----------------
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Member Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // ---------------- ROLE ----------------
            const Text(
              'Role',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              children: [

                Radio<String>(
                  value: 'Student',
                  groupValue: role,
                  onChanged: (value) {
                    setState(() {
                      role = value!;
                    });
                  },
                ),

                const Text('Student'),

                Radio<String>(
                  value: 'Volunteer',
                  groupValue: role,
                  onChanged: (value) {
                    setState(() {
                      role = value!;
                    });
                  },
                ),

                const Text('Volunteer'),
              ],
            ),

            // ---------------- FEES ----------------
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Fees Paid'),
              value: feesPaid,
              onChanged: (value) {
                setState(() {
                  feesPaid = value!;
                });
              },
            ),

            const SizedBox(height: 10),

            // ---------------- BUTTONS ----------------
            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveOrUpdate,
                    child: Text(
                      isEditing ? 'Update' : 'Save',
                    ),
                  ),
                ),

                // Cancel appears only during editing
                if (isEditing) ...[
                  const SizedBox(width: 10),

                  Expanded(
                    child: OutlinedButton(
                      onPressed: _cancelEdit,
                      child: const Text('Cancel'),
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 20),

            // ---------------- LIST TITLE ----------------
            const Text(
              'Saved Members',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // ---------------- LIST ----------------
            Expanded(
              child: members.isEmpty
                  ? const Center(
                      child: Text('No members saved'),
                    )
                  : ListView.builder(
                      itemCount: members.length,

                      itemBuilder: (context, index) {
                        final member = members[index];

                        return Card(
                          child: ListTile(

                            title: Text(
                              member['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              'Role: ${member['role']}\n'
                              'Fees Paid: '
                              '${member['paid'] ? 'Yes' : 'No'}',
                            ),

                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _editMember(member);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}