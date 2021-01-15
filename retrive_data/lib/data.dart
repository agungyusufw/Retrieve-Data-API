// To parse this JSON data, do
//
//     final barang = barangFromJson(jsonString);

import 'dart:convert';

List<Barang> barangFromJson(String str) => List<Barang>.from(json.decode(str).map((x) => Barang.fromJson(x)));

String barangToJson(List<Barang> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Barang {
  Barang({
    this.id,
    this.barang,
    this.jumlah,
  });

  String id;
  String barang;
  String jumlah;

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
    id: json["id"],
    barang: json["barang"],
    jumlah: json["jumlah"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "barang": barang,
    "jumlah": jumlah,
  };
}
