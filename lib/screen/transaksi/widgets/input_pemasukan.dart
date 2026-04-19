import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPemasukanWidget extends StatefulWidget {
  const InputPemasukanWidget({super.key});

  @override
  State<InputPemasukanWidget> createState() => _InputPemasukanWidgetState();
}

class _InputPemasukanWidgetState extends State<InputPemasukanWidget> {
  final _jumlahController = TextEditingController();
  final _catatanController = TextEditingController();
  int? _selectedKategori;
  DateTime _selectedDate = DateTime.now();

  /* -------------------------------------------------------------------------- */
  /*                             kategori pemasukan                             */
  /* -------------------------------------------------------------------------- */
  final List<Map<String, dynamic>> _kategoriList = [
    {'label': 'Gaji', 'icon': Icons.work_outline},
    {'label': 'Bonus', 'icon': Icons.card_giftcard},
    {'label': 'Bisnis', 'icon': Icons.store_outlined},
    {'label': 'Investasi', 'icon': Icons.trending_up},
    {'label': 'Hadiah', 'icon': Icons.redeem},
    {'label': 'Freelance', 'icon': Icons.laptop_mac},
    {'label': 'Penjualan', 'icon': Icons.sell_outlined},
    {'label': 'Lainnya', 'icon': Icons.category_outlined},
  ];

  /* --------------------- func : menampilkan date picker --------------------- */
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  /* ---------------------- func : simpan data pemasukan ---------------------- */
  void _simpan() {
    if (_jumlahController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan jumlah pemasukan.')),
      );
      return;
    }
    if (_selectedKategori == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih kategori terlebih dahulu.')),
      );
      return;
    }

    /* -------------------------- menampilkan snackbar -------------------------- */
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
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    /* --------------------------------- Header --------------------------------- */
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(bottom: 12),
                      child: const Text(
                        'Yukk, catat pemasukan !!',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    /* ------------------------------ Input Jumlah ------------------------------ */
                    TextField(
                      controller: _jumlahController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: 'Rp  ',
                        hintText: '0',
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

                    /* ----------------------------- Input Kategori ----------------------------- */
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
                                  ? Colors.green.withOpacity(0.2)
                                  : const Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isActive
                                    ? Colors.green
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _kategoriList[i]['icon'],
                                  color: isActive
                                      ? Colors.green
                                      : const Color(0xFF4B5563),
                                  size: 18,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _kategoriList[i]['label'],
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: isActive
                                        ? Colors.green
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

              const SizedBox(height: 8),

              /* ------------------------------ Input Catatan ----------------------------- */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _catatanController,
                  decoration: InputDecoration(
                    hintText: 'Tambah catatan (opsional)',
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /* ------------------------------ input tanggal ----------------------------- */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GestureDetector(
                  onTap: _pickDate,
                  child: Container(
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
                        const Icon(Icons.calendar_today_outlined, size: 13),
                        const SizedBox(width: 8),
                        Text(
                          DateFormat(
                            'dd MMMM yyyy',
                            'id_ID',
                          ).format(_selectedDate),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /* ------------------------------ Button Simpan ----------------------------- */
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ElevatedButton(
                  onPressed: _simpan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 84, 208, 94),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Simpan Pemasukan',
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
