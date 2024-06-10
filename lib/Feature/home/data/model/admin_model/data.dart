class Data {
  String? ownerName;
  String? contactNumber;
  String? whatsappPhone;
  String? contactEmail;

  Data({
    this.ownerName,
    this.contactNumber,
    this.whatsappPhone,
    this.contactEmail,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ownerName: json['owner_name'] as String?,
        contactNumber: json['contact_number'] as String?,
        whatsappPhone: json['whatsapp_phone'] as String?,
        contactEmail: json['contact_email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'owner_name': ownerName,
        'contact_number': contactNumber,
        'whatsapp_phone': whatsappPhone,
        'contact_email': contactEmail,
      };
}
