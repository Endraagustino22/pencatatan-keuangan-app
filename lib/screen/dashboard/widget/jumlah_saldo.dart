import 'package:flutter/material.dart';

class SaldoSummaryWidget extends StatelessWidget {
  const SaldoSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {

    // container
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFD97757),
      ),

      // content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hallo, selamat datang kembali!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.account_circle_outlined,
                  color: Color(0xFFF5F5F5),
                  size: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Saldo Dan Pengeluarana Row
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _InfoColumn(
                    icon: Icons.credit_card_outlined,
                    label: 'Total Saldo',
                    value: 'Rp. 7,783.00',

                  ),
                ),
                const VerticalDivider(color: Colors.white, width: 32),
                Expanded(
                  child: _InfoColumn(
                    icon: Icons.trending_up_rounded,
                    label: 'Total Pengeluaran',
                    value: '-Rp. 1,187.40',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Progress Bar
          Container(
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFC0E1D2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '30%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: Text(
                    'Rp. 20,000.00',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

// Info Saldo Dan Pengeluaran Column Widget
class _InfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoColumn({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: const Color(0xFFF5F5F5)),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Color(0xFFF5F5F5)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFFF5F5F5),
          ),
        ),
      ],
    );
  }
}