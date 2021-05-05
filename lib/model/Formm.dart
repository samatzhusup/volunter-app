class Formm {
  String vid;
  String fullname;
  String fImage;
  String phone;
  String address;
  String yearold;
  String lifestatus;
  String aboutchild;
  String extraques;
  String house;
  String status;
  String created;
  String updated;
  String gg;
  String fid;

  Formm(
      {this.vid,
        this.fullname,
        this.fImage,
        this.phone,
        this.address,
        this.gg,
        this.yearold,
        this.lifestatus,
        this.aboutchild,
        this.extraques,
        this.status,
        this.created,
        this.updated,
        this.house});

  Formm.fromMap(Map<String, dynamic> data, String fid)
      : vid = data['vid'],
        fullname = data['fullname'],
        fImage = data['fImage'],
        phone = data['phone'],
        gg = data['gg'],
        address = data['address'],
        yearold = data['yearold'],
        lifestatus = data['lifestatus'],
        aboutchild = data['aboutchild'],
        extraques = data['extraques'],
        house = data['house'],
        created = data['created'],
        updated = data['updated'],
        status = data['status'],
        fid = fid;

  Map<String, dynamic> toMap() {
    return {
      "vid": vid,
      "fullname": fullname,
      "phone": phone,
      "fImage": fImage,
      "gg": gg,
      "yearold": yearold,
      "lifestatus": lifestatus,
      "aboutchild": aboutchild,
      "extraques": extraques,
      "status": status,
      "created": created,
      "updated": updated,
      "house": house,
    };
  }
}
