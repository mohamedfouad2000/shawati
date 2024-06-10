class TermAndPrivacyData {
  int? privacyStatus;
  int? refundStatus;
  int? termsStatus;
  String? privacyPolicyAr;
  String? privacyPolicy;
  String? refundPolicyAr;
  String? refundPolicy;
  String? termAr;
  String? term;

  TermAndPrivacyData({
    this.privacyStatus,
    this.refundStatus,
    this.termsStatus,
    this.privacyPolicyAr,
    this.privacyPolicy,
    this.refundPolicyAr,
    this.refundPolicy,
    this.termAr,
    this.term,
  });

  factory TermAndPrivacyData.fromJson(Map<String, dynamic> json) =>
      TermAndPrivacyData(
        privacyStatus: json['privacy_status'] as int?,
        refundStatus: json['refund_status'] as int?,
        termsStatus: json['terms_status'] as int?,
        privacyPolicyAr: json['privacy_policy_ar'] as String?,
        privacyPolicy: json['privacy_policy'] as String?,
        refundPolicyAr: json['refund_policy_ar'] as String?,
        refundPolicy: json['refund_policy'] as String?,
        termAr: json['term_ar'] as String?,
        term: json['term'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'privacy_status': privacyStatus,
        'refund_status': refundStatus,
        'terms_status': termsStatus,
        'privacy_policy_ar': privacyPolicyAr,
        'privacy_policy': privacyPolicy,
        'refund_policy_ar': refundPolicyAr,
        'refund_policy': refundPolicy,
        'term_ar': termAr,
        'term': term,
      };
}
