import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPengeluaranWidget extends StatefulWidget {
  const InputPengeluaranWidget({super.key});

  @override
  State<InputPengeluaranWidget> createState() => _InputPengeluaranWidgetState();
}

class _InputPengeluaranWidgetState extends State<InputPengeluaranWidget> {
  // *controller dan state
  final _jumlahController = TextEditingController();
  final _catatanController = TextEditingController();
  int? _selectedKategori;
  DateTime _selectedDate = DateTime.now();

  // *data dummy : List kategori pengeluaran
  final List<Map<String, dynamic>> _kategoriList = [
    {'label': 'Makanan', 'icon': Icons.restaurant_outlined},
    {'label': 'Transport', 'icon': Icons.directions_car_outlined},
    {'label': 'Belanja', 'icon': Icons.shopping_bag_outlined},
    {'label': 'Kesehatan', 'icon': Icons.medical_services_outlined},
    {'label': 'Hiburan', 'icon': Icons.sports_esports_outlined},
    {'label': 'Tagihan', 'icon': Icons.receipt_outlined},
    {'label': 'Pendidikan', 'icon': Icons.menu_book_outlined},
    {'label': 'Lainnya', 'icon': Icons.category_outlined},
  ];

  // *fungsi untuk memilih tanggal
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  // *fungsi untuk menyimpan data pengeluaran
  void _simpan() {
    if (_jumlahController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan jumlah pengeluaran.')),
      );
      return;
    }
    if (_selectedKategori == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih kategori terlebih dahulu.')),
      );
      return;
    }

    // *menampilkan snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tersimpan: Rp ${_jumlahController.text} — ${_kategoriList[_selectedKategori!]['label']}',
        ),
      ),
    );
    _jumlahController.clear();
    _catatanController.clear();
    setState(() => _selectedKategori = null);
  }

  @override
  Widget build(BuildContext context) {
    // *UI Input Pengeluaran
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // *Input Pengeluaran Column
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    // *header input pengeluaran
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(bottom: 12),
                      child: const Text(
                        'Yukk, catat pengeluaran !!',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xFF1F2937),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // *TextField  input jumlah pengeluaran
                    TextField(
                      controller: _jumlahController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4B5563),
                      ),
                      decoration: InputDecoration(
                        prefixText: 'Rp  ',
                        prefixStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B5563),
                        ),
                        hintText: '0',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B5563),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    // *Pilih Kategori
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                            childAspectRatio: 1.1,
                          ),
                      itemCount: _kategoriList.length,
                      itemBuilder: (context, i) {
                        final isActive = _selectedKategori == i;
                        return GestureDetector(
                          onTap: () => setState(() {
                            _selectedKategori = isActive ? null : i;
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isActive
                                  // ignore: deprecated_member_use
                                  ? const Color(0xFFD97757).withOpacity(0.2)
                                  : const Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isActive
                                    ? const Color(0xFFD97757)
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _kategoriList[i]['icon'] as IconData,
                                  color: isActive
                                      ? const Color(0xFFD97757)
                                      : const Color(0xFF4B5563),
                                  size: 18,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _kategoriList[i]['label'] as String,
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: isActive
                                        ? const Color(0xFFD97757)
                                        : const Color(0xFF4B5563),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // *Catatan
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _catatanController,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Tambah catatan (opsional)',
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    filled: true,
                    isDense: true, //
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10, //
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              // *Tanggal
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                child: GestureDetector(
                  onTap: _pickDate,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 13,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          DateFormat(
                            'dd MMMM yyyy',
                            'id_ID',
                          ).format(_selectedDate),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // *Tombol Simpan
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _simpan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD97757),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Simpan Pengeluaran',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
