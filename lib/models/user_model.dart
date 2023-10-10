// ignore_for_file: prefer_if_null_operators

class UserModel {
  DateTime? paymentDate;
  String? paymentType;
  bool? isPayment;
  String? email;
  String? deviceId;
  bool? isAdmin ;

  UserModel({
    this.email,
    this.deviceId,
    this.paymentType,
    this.paymentDate,
    this.isPayment,
    this.isAdmin
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    paymentType = json['payment_type'] != null ?  json['payment_type'] : null ;
    paymentDate = json['payment_date'] != null ? json['payment_date'] : null ;
    isPayment = json['is_payment'] != null ? json['is_payment'] : null;
    email = json['email'];
    deviceId = json['device_id'];
    isAdmin = json['is_admin'] != null ? json['is_admin'] : null ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_type'] = paymentType;
    data['payment_date'] = paymentDate;
    data['is_payment'] = isPayment;
    data['email'] = email;
    data['device_id'] = deviceId;
    data['is_admin'] = isAdmin;
    return data;
  }
}
