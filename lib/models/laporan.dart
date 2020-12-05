class Laporan {
  static const tblLapor = 'reports';
  static const colId = 'id';
  static const colPerihal = 'perihal';
  static const colKeterangan = 'keterangan';

  Laporan({this.id, this.perihal, this.keterangan});


  Laporan.fromMap(Map<String, dynamic> map){
    id = map[colId];
    perihal = map[colPerihal];
    keterangan = map[colKeterangan];
  }


  int id;
  String perihal;
  String keterangan;


  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colPerihal: perihal,
      colKeterangan: keterangan,
    };
    if (id != null) map[colId] = id;
    return map;
  }
}
