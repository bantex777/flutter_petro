class LoginResponse {
  String? _myId;
  String? _vCode;
  String? _profilePic;
  String? _clientName;
  String? _storename;
  String? _aksyon;
  String? _msg;
  String? _storeaddress;

  LoginResponse(
      {String? myId,
      String? vCode,
      String? profilePic,
      String? clientName,
      String? storename,
      String? aksyon,
      String? msg,
      String? storeaddress}) {
    if (myId != null) {
      this._myId = myId;
    }
    if (vCode != null) {
      this._vCode = vCode;
    }
    if (profilePic != null) {
      this._profilePic = profilePic;
    }
    if (clientName != null) {
      this._clientName = clientName;
    }
    if (storename != null) {
      this._storename = storename;
    }
    if (aksyon != null) {
      this._aksyon = aksyon;
    }
    if (msg != null) {
      this._msg = msg;
    }
    if (storeaddress != null) {
      this._storeaddress = storeaddress;
    }
  }

  String? get myId => _myId;
  set myId(String? myId) => _myId = myId;
  String? get vCode => _vCode;
  set vCode(String? vCode) => _vCode = vCode;
  String? get profilePic => _profilePic;
  set profilePic(String? profilePic) => _profilePic = profilePic;
  String? get clientName => _clientName;
  set clientName(String? clientName) => _clientName = clientName;
  String? get storename => _storename;
  set storename(String? storename) => _storename = storename;
  String? get aksyon => _aksyon;
  set aksyon(String? aksyon) => _aksyon = aksyon;
  String? get msg => _msg;
  set msg(String? msg) => _msg = msg;
  String? get storeaddress => _storeaddress;
  set storeaddress(String? storeaddress) => _storeaddress = storeaddress;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    _myId = json['my_id'];
    _vCode = json['v_code'];
    _profilePic = json['profile_pic'];
    _clientName = json['client_name'];
    _storename = json['storename'];
    _aksyon = json['aksyon'];
    _msg = json['msg'];
    _storeaddress = json['storeaddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['my_id'] = this._myId;
    data['v_code'] = this._vCode;
    data['profile_pic'] = this._profilePic;
    data['client_name'] = this._clientName;
    data['storename'] = this._storename;
    data['aksyon'] = this._aksyon;
    data['msg'] = this._msg;
    data['storeaddress'] = this._storeaddress;
    return data;
  }
}
