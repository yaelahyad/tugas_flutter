import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String nama;
  final String nim;
  final String hobi;
  final int skorAktivitas;

  const ProfileCard({
    super.key,
    required this.nama,
    required this.nim,
    required this.hobi,
    required this.skorAktivitas,
  });

  @override
  Widget build(BuildContext context) {
    // Mengambil digit NIM
    final int digitTerakhir = int.parse(nim[nim.length - 1]);
    final int digitKe2Belakang = int.parse(nim[nim.length - 2]);

    // Rumus berdasarkan NIM 20240801139
    final double lebarKartu = 320.0 + digitKe2Belakang;
    final double sudutMelengkung =
        12.0 + (digitTerakhir * 1.5);
    final double ukuranLogo =
        60.0 + (digitTerakhir * 2);
    final double jarakPemisah =
        15.0 + digitTerakhir;

    return Container(
      width: lebarKartu,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          sudutMelengkung,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Row(
            children: [
              // Logo Flutter
              Container(
                width: ukuranLogo + 16,
                height: ukuranLogo + 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.teal,
                    width: 2.0,
                  ),
                  color: Colors.grey[100],
                ),
                child: Center(
                  child: FlutterLogo(
                    size: ukuranLogo,
                  ),
                ),
              ),

              SizedBox(
                width: jarakPemisah,
              ),

              // Judul dan Nama
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kartu Praktikan',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // PEMISAH
          const Divider(
            thickness: 1.5,
            height: 30.0,
          ),

          // DETAIL IDENTITAS
          Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'NIM: $nim',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Hobi: $hobi',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Skor Aktivitas: $skorAktivitas',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
