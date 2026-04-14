import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pencatatan_keuangan_app/model/transaksi.dart';

class TransaksiListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransaksiListWidget({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final trx = transactions[index];
        final isIncome = trx.type == "Masuk";

        final amountColor = isIncome
            ? const Color(0xFF2E7D6B) // soft green
            : const Color(0xFFC05656); // soft red

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              /// ICON / INDICATOR
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: amountColor,
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 12),

              /// LEFT INFO
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trx.category,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      trx.type,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),

              /// RIGHT SIDE
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd MMM yyyy').format(trx.date),
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${isIncome ? '+' : '-'}Rp ${trx.amount.toStringAsFixed(0)}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: amountColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
