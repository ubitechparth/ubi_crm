import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? statusCode;
  Data? data;
  String? errorMessage;

  LoginModel({this.statusCode, this.data, this.errorMessage});

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errorMessage'] = errorMessage;
    return data;
  }
}

class Data {
  bool? success;
  List<User>? user;
  List<Team>? team;

  Data({this.success, this.user, this.team});

  Data.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(Team.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    if (team != null) {
      data['team'] = team!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  int? employeeId;
  String? password;
  String? username;
  int? userprofile;
  String? usernameMobile;
  String? aadharNo;
  int? roleId;
  int? organizationId;
  String? createdDate;
  int? createdById;
  String? lastModifiedDate;
  int? lastModifiedById;
  int? ownerId;
  int? adminSts;
  int? visibleSts;
  Null trialOrganizationId;
  int? appSuperviserSts;
  int? archive;
  int? resetPassCounter;
  int? hRSts;
  String? appId;
  String? deviceId;
  int? passwordSts;
  int? selfie;
  int? visitSelfieSts;
  int? deviceRestriction;
  int? fingerPrint;
  int? qRCode;
  int? faceId;
  int? policypasswordstatus;
  int? loginSts;
  String? offlineFaceId;
  String? qrUniqueId;
  String? authorizationAppleID;
  String? kioskPin;
  String? qrKioskPageReopen;
  int? appLoginSts;
  int? attRestrict;
  int? restrictLogin;
  String? restrictLoginTimestamp;
  int? cRMEmployee;
  String? employeeCode;
  String? firstName;
  String? lastName;
  String? dOB;
  int? nationality;
  int? maritalStatus;
  int? religion;
  int? bloodGroup;
  String? knownLanguage;
  String? dOJ;
  String? dOC;
  int? visa;
  int? gender;
  String? currentContactNumber;
  String? currentEmailId;
  String? currentAddress;
  int? currentCountry;
  int? currentCity;
  String? currentZipCode;
  String? homeContactNumber;
  String? homeEmailId;
  String? homeAddress;
  int? homeCountry;
  int? homeCity;
  String? homeZipCode;
  String? emergencyContactNumber;
  String? emergencyEmailId;
  String? emergencyAddress;
  int? emergencyCountry;
  int? emergencyCity;
  String? emergencyZipCode;
  int? reportingTo;
  int? division;
  int? department;
  int? channel;
  int? designation;
  int? location;
  int? shift;
  String? areaAssigned;
  int? employeeStatus;
  int? grade;
  String? workingDays;
  int? functionalArea;
  String? imageName;
  int? employeeCTC;
  int? payPattern;
  int? modePayment;
  String? bankName;
  String? bankIFSCCode;
  String? bankAccount;
  String? bankAddress;
  int? employmentType;
  String? totalExp;
  String? companyEmail;
  String? nearestAirport;
  int? airTicket;
  int? ticketClass;
  int? iATAFare;
  int? lastTicketAmt;
  int? onceIn;
  String? travelInstruction;
  String? familyDetail;
  int? provisionPeriod;
  String? middleName;
  String? dOL;
  String? countrycode;
  String? personalNo;
  int? overtimePayment;
  int? costCentre;
  int? coCentre;
  int? noOfMonths;
  int? salaryIncreament;
  String? fatherName;
  int? visaCategory;
  String? emergencyContactPerson;
  int? hourlyRate;
  String? uIDNo;
  String? fileNo;
  String? uniqueId;
  int? annualCTC;
  String? uan;
  String? esiNo;
  String? pfNo;
  int? isDelete;
  Null deletedDate;
  int? empAddSts;
  int? applicablePf;
  int? applicableEsi;
  int? applicablePt;
  String? ticketNo;
  String? localJobTitle;
  String? localEmployeeCode;
  int? weeklyAmt;
  int? publicholidayAmt;
  int? weekdaysAmt;
  int? inPushNotificationStatus;
  int? outPushNotificationStatus;
  Null personId;
  String? deviceName;
  int? timezone;
  String? dateOfRejoining;
  String? previousDOL;
  String? biometricDeviceId;
  String? generalColumn;
  String? aadhaarCard;
  String? panCard;
  int? modeofAttendance;
  int? age;
  String? hypertensionDrop;
  String? heartDiseaseDrop;
  String? diabetesDrop;
  String? lungDiseaseDrop;
  String? travelledinlast14daysDrop;
  int? travelledCountryDrop;
  String? riskDrop;
  int? livelocationtrack;
  int? heirarchySts;
  String? entitledleave;
  String? balanceleave;
  String? lTAmonth;
  int? lTAStsMonth;
  int? fencearea;
  int? undertimePayment;
  int? weekdaysUndertimeAmt;
  int? multipletimeStatus;
  int? pensionScheme;
  String? address;
  int? sAPIntegId;
  int? costallocation;
  int? zoneId;
  String? uFPersonId;
  int? notificationStatus;
  int? applicableLwf;
  int? salaryType;
  int? razorpayEmpId;
  int? razorpayMappedSts;
  String? name;
  String? website;
  String? phoneNumber;
  String? altPhoneNumber;
  String? email;
  String? altEmail;
  String? logo;
  String? orgRemark;
  int? country;
  int? city;
  int? zipCode;
  String? landmark;
  int? currency;
  int? dateFormat;
  int? timeFormat;
  int? timeZone;
  String? aboutCompany;
  int? planId;
  int? noOfEmp;
  String? hrmLink;
  int? noAdmin;
  String? startfiscalyear;
  String? endfiscalyear;
  int? mailVarified;
  int? cleanedUp;
  int? customizeOrg;
  int? deleteSts;
  int? mailUnsubscribe;
  String? smtpuser;
  int? trialSts;
  String? smtppassword;
  int? ubihrmSts;
  int? ubihrmSetupSts;
  int? dataDeleteSts;
  int? leadownerId;
  int? rating;
  Null review;
  String? platform;
  int? biometricStatus;
  int? sAPIntegrationStatus;
  int? groupcompaniesSts;
  int? reportNotificationSent;
  int? attendanceselfiests;
  int? visitselfiests;
  int? flexiselfiests;
  int? geoFenceRestriction;
  String? contactPerson;
  String? fiscalStart;
  String? fiscalEnd;
  String? entitledLeave;
  String? modules;
  Null preferredTimeToCall;
  Null requirements;
  String? faceRecognitionThrashhold;
  int? faceRecognitionRestriction;
  String? app;
  int? mailVerifyStsCounter;
  String? mailVerificationLinkSentDate;
  int? surveySts;
  String? resellerId;
  int? deviceverificationSetting;
  int? whiteLabelingSts;
  int? counter;
  int? policypwdsts;
  int? oTP;
  Null remarks;
  int? termsAndConditionChk;
  int? stages;
  int? demosts;
  int? visitRestriction;
  String? unsubscribeReason;
  int? loginWithEmpCodeSts;
  int? addonRegularization;
  int? iPRestriction;
  int? apiIntegration;
  int? cRMOrganization;
  String? currencyCode;
  String? organizationName;
  String? profileId;

  User(
      {this.id,
        this.employeeId,
        this.password,
        this.username,
        this.userprofile,
        this.usernameMobile,
        this.aadharNo,
        this.roleId,
        this.organizationId,
        this.createdDate,
        this.createdById,
        this.lastModifiedDate,
        this.lastModifiedById,
        this.ownerId,
        this.adminSts,
        this.visibleSts,
        this.trialOrganizationId,
        this.appSuperviserSts,
        this.archive,
        this.resetPassCounter,
        this.hRSts,
        this.appId,
        this.deviceId,
        this.passwordSts,
        this.selfie,
        this.visitSelfieSts,
        this.deviceRestriction,
        this.fingerPrint,
        this.qRCode,
        this.faceId,
        this.policypasswordstatus,
        this.loginSts,
        this.offlineFaceId,
        this.qrUniqueId,
        this.authorizationAppleID,
        this.kioskPin,
        this.qrKioskPageReopen,
        this.appLoginSts,
        this.attRestrict,
        this.restrictLogin,
        this.restrictLoginTimestamp,
        this.cRMEmployee,
        this.employeeCode,
        this.firstName,
        this.lastName,
        this.dOB,
        this.nationality,
        this.maritalStatus,
        this.religion,
        this.bloodGroup,
        this.knownLanguage,
        this.dOJ,
        this.dOC,
        this.visa,
        this.gender,
        this.currentContactNumber,
        this.currentEmailId,
        this.currentAddress,
        this.currentCountry,
        this.currentCity,
        this.currentZipCode,
        this.homeContactNumber,
        this.homeEmailId,
        this.homeAddress,
        this.homeCountry,
        this.homeCity,
        this.homeZipCode,
        this.emergencyContactNumber,
        this.emergencyEmailId,
        this.emergencyAddress,
        this.emergencyCountry,
        this.emergencyCity,
        this.emergencyZipCode,
        this.reportingTo,
        this.division,
        this.department,
        this.channel,
        this.designation,
        this.location,
        this.shift,
        this.areaAssigned,
        this.employeeStatus,
        this.grade,
        this.workingDays,
        this.functionalArea,
        this.imageName,
        this.employeeCTC,
        this.payPattern,
        this.modePayment,
        this.bankName,
        this.bankIFSCCode,
        this.bankAccount,
        this.bankAddress,
        this.employmentType,
        this.totalExp,
        this.companyEmail,
        this.nearestAirport,
        this.airTicket,
        this.ticketClass,
        this.iATAFare,
        this.lastTicketAmt,
        this.onceIn,
        this.travelInstruction,
        this.familyDetail,
        this.provisionPeriod,
        this.middleName,
        this.dOL,
        this.countrycode,
        this.personalNo,
        this.overtimePayment,
        this.costCentre,
        this.coCentre,
        this.noOfMonths,
        this.salaryIncreament,
        this.fatherName,
        this.visaCategory,
        this.emergencyContactPerson,
        this.hourlyRate,
        this.uIDNo,
        this.fileNo,
        this.uniqueId,
        this.annualCTC,
        this.uan,
        this.esiNo,
        this.pfNo,
        this.isDelete,
        this.deletedDate,
        this.empAddSts,
        this.applicablePf,
        this.applicableEsi,
        this.applicablePt,
        this.ticketNo,
        this.localJobTitle,
        this.localEmployeeCode,
        this.weeklyAmt,
        this.publicholidayAmt,
        this.weekdaysAmt,
        this.inPushNotificationStatus,
        this.outPushNotificationStatus,
        this.personId,
        this.deviceName,
        this.timezone,
        this.dateOfRejoining,
        this.previousDOL,
        this.biometricDeviceId,
        this.generalColumn,
        this.aadhaarCard,
        this.panCard,
        this.modeofAttendance,
        this.age,
        this.hypertensionDrop,
        this.heartDiseaseDrop,
        this.diabetesDrop,
        this.lungDiseaseDrop,
        this.travelledinlast14daysDrop,
        this.travelledCountryDrop,
        this.riskDrop,
        this.livelocationtrack,
        this.heirarchySts,
        this.entitledleave,
        this.balanceleave,
        this.lTAmonth,
        this.lTAStsMonth,
        this.fencearea,
        this.undertimePayment,
        this.weekdaysUndertimeAmt,
        this.multipletimeStatus,
        this.pensionScheme,
        this.address,
        this.sAPIntegId,
        this.costallocation,
        this.zoneId,
        this.uFPersonId,
        this.notificationStatus,
        this.applicableLwf,
        this.salaryType,
        this.razorpayEmpId,
        this.razorpayMappedSts,
        this.name,
        this.website,
        this.phoneNumber,
        this.altPhoneNumber,
        this.email,
        this.altEmail,
        this.logo,
        this.orgRemark,
        this.country,
        this.city,
        this.zipCode,
        this.landmark,
        this.currency,
        this.dateFormat,
        this.timeFormat,
        this.timeZone,
        this.aboutCompany,
        this.planId,
        this.noOfEmp,
        this.hrmLink,
        this.noAdmin,
        this.startfiscalyear,
        this.endfiscalyear,
        this.mailVarified,
        this.cleanedUp,
        this.customizeOrg,
        this.deleteSts,
        this.mailUnsubscribe,
        this.smtpuser,
        this.trialSts,
        this.smtppassword,
        this.ubihrmSts,
        this.ubihrmSetupSts,
        this.dataDeleteSts,
        this.leadownerId,
        this.rating,
        this.review,
        this.platform,
        this.biometricStatus,
        this.sAPIntegrationStatus,
        this.groupcompaniesSts,
        this.reportNotificationSent,
        this.attendanceselfiests,
        this.visitselfiests,
        this.flexiselfiests,
        this.geoFenceRestriction,
        this.contactPerson,
        this.fiscalStart,
        this.fiscalEnd,
        this.entitledLeave,
        this.modules,
        this.preferredTimeToCall,
        this.requirements,
        this.faceRecognitionThrashhold,
        this.faceRecognitionRestriction,
        this.app,
        this.mailVerifyStsCounter,
        this.mailVerificationLinkSentDate,
        this.surveySts,
        this.resellerId,
        this.deviceverificationSetting,
        this.whiteLabelingSts,
        this.counter,
        this.policypwdsts,
        this.oTP,
        this.remarks,
        this.termsAndConditionChk,
        this.stages,
        this.demosts,
        this.visitRestriction,
        this.unsubscribeReason,
        this.loginWithEmpCodeSts,
        this.addonRegularization,
        this.iPRestriction,
        this.apiIntegration,
        this.cRMOrganization,
        this.currencyCode,
        this.organizationName,
        this.profileId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    employeeId = json['EmployeeId'];
    password = json['Password'];
    username = json['Username'];
    userprofile = json['userprofile'];
    usernameMobile = json['username_mobile'];
    aadharNo = json['AadharNo'];
    roleId = json['RoleId'];
    organizationId = json['OrganizationId'];
    createdDate = json['CreatedDate'];
    createdById = json['CreatedById'];
    lastModifiedDate = json['LastModifiedDate'];
    lastModifiedById = json['LastModifiedById'];
    ownerId = json['OwnerId'];
    adminSts = json['AdminSts'];
    visibleSts = json['VisibleSts'];
    trialOrganizationId = json['trial_OrganizationId'];
    appSuperviserSts = json['appSuperviserSts'];
    archive = json['archive'];
    resetPassCounter = json['resetPassCounter'];
    hRSts = json['HRSts'];
    appId = json['AppId'];
    deviceId = json['DeviceId'];
    passwordSts = json['Password_sts'];
    selfie = json['Selfie'];
    visitSelfieSts = json['VisitSelfieSts'];
    deviceRestriction = json['Device_Restriction'];
    fingerPrint = json['Finger_Print'];
    qRCode = json['QR_code'];
    faceId = json['Face_Id'];
    policypasswordstatus = json['policypasswordstatus'];
    loginSts = json['LoginSts'];
    offlineFaceId = json['OfflineFaceId'];
    qrUniqueId = json['Qr_UniqueId'];
    authorizationAppleID = json['AuthorizationAppleID'];
    kioskPin = json['kioskPin'];
    qrKioskPageReopen = json['QrKioskPageReopen'];
    appLoginSts = json['AppLoginSts'];
    attRestrict = json['Att_restrict'];
    restrictLogin = json['RestrictLogin'];
    restrictLoginTimestamp = json['restrictLoginTimestamp'];
    cRMEmployee = json['CRM_Employee'];
    employeeCode = json['EmployeeCode'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    dOB = json['DOB'];
    nationality = json['Nationality'];
    maritalStatus = json['MaritalStatus'];
    religion = json['Religion'];
    bloodGroup = json['BloodGroup'];
    knownLanguage = json['KnownLanguage'];
    dOJ = json['DOJ'];
    dOC = json['DOC'];
    visa = json['Visa'];
    gender = json['Gender'];
    currentContactNumber = json['CurrentContactNumber'];
    currentEmailId = json['CurrentEmailId'];
    currentAddress = json['CurrentAddress'];
    currentCountry = json['CurrentCountry'];
    currentCity = json['CurrentCity'];
    currentZipCode = json['CurrentZipCode'];
    homeContactNumber = json['HomeContactNumber'];
    homeEmailId = json['HomeEmailId'];
    homeAddress = json['HomeAddress'];
    homeCountry = json['HomeCountry'];
    homeCity = json['HomeCity'];
    homeZipCode = json['HomeZipCode'];
    emergencyContactNumber = json['EmergencyContactNumber'];
    emergencyEmailId = json['EmergencyEmailId'];
    emergencyAddress = json['EmergencyAddress'];
    emergencyCountry = json['EmergencyCountry'];
    emergencyCity = json['EmergencyCity'];
    emergencyZipCode = json['EmergencyZipCode'];
    reportingTo = json['ReportingTo'];
    division = json['Division'];
    department = json['Department'];
    channel = json['Channel'];
    designation = json['Designation'];
    location = json['Location'];
    shift = json['Shift'];
    areaAssigned = json['area_assigned'];
    employeeStatus = json['EmployeeStatus'];
    grade = json['Grade'];
    workingDays = json['WorkingDays'];
    functionalArea = json['FunctionalArea'];
    imageName = json['ImageName'];
    employeeCTC = json['EmployeeCTC'];
    payPattern = json['PayPattern'];
    modePayment = json['ModePayment'];
    bankName = json['BankName'];
    bankIFSCCode = json['BankIFSCCode'];
    bankAccount = json['BankAccount'];
    bankAddress = json['BankAddress'];
    employmentType = json['EmploymentType'];
    totalExp = json['TotalExp'];
    companyEmail = json['CompanyEmail'];
    nearestAirport = json['NearestAirport'];
    airTicket = json['AirTicket'];
    ticketClass = json['TicketClass'];
    iATAFare = json['IATAFare'];
    lastTicketAmt = json['LastTicketAmt'];
    onceIn = json['OnceIn'];
    travelInstruction = json['TravelInstruction'];
    familyDetail = json['FamilyDetail'];
    provisionPeriod = json['ProvisionPeriod'];
    middleName = json['MiddleName'];
    dOL = json['DOL'];
    countrycode = json['countrycode'];
    personalNo = json['PersonalNo'];
    overtimePayment = json['OvertimePayment'];
    costCentre = json['CostCentre'];
    coCentre = json['CoCentre'];
    noOfMonths = json['NoOfMonths'];
    salaryIncreament = json['SalaryIncreament'];
    fatherName = json['FatherName'];
    visaCategory = json['VisaCategory'];
    emergencyContactPerson = json['EmergencyContactPerson'];
    hourlyRate = json['hourly_rate'];
    uIDNo = json['UID_No'];
    fileNo = json['File_No'];
    uniqueId = json['UniqueId'];
    annualCTC = json['AnnualCTC'];
    uan = json['uan'];
    esiNo = json['esi_no'];
    pfNo = json['pf_no'];
    isDelete = json['Is_Delete'];
    deletedDate = json['Deleted_Date'];
    empAddSts = json['EmpAddSts'];
    applicablePf = json['applicable_pf'];
    applicableEsi = json['applicable_esi'];
    applicablePt = json['applicable_pt'];
    ticketNo = json['ticket_no'];
    localJobTitle = json['Local_Job_Title'];
    localEmployeeCode = json['Local_Employee_code'];
    weeklyAmt = json['weeklyAmt'];
    publicholidayAmt = json['publicholidayAmt'];
    weekdaysAmt = json['weekdaysAmt'];
    inPushNotificationStatus = json['InPushNotificationStatus'];
    outPushNotificationStatus = json['OutPushNotificationStatus'];
    personId = json['PersonId'];
    deviceName = json['DeviceName'];
    timezone = json['timezone'];
    dateOfRejoining = json['DateOfRejoining'];
    previousDOL = json['previous_DOL'];
    biometricDeviceId = json['biometricDeviceId'];
    generalColumn = json['GeneralColumn'];
    aadhaarCard = json['AadhaarCard'];
    panCard = json['PanCard'];
    modeofAttendance = json['ModeofAttendance'];
    age = json['Age'];
    hypertensionDrop = json['Hypertension_drop'];
    heartDiseaseDrop = json['HeartDisease_drop'];
    diabetesDrop = json['Diabetes_drop'];
    lungDiseaseDrop = json['LungDisease_drop'];
    travelledinlast14daysDrop = json['Travelledinlast14days_drop'];
    travelledCountryDrop = json['TravelledCountry_drop'];
    riskDrop = json['Risk_drop'];
    livelocationtrack = json['livelocationtrack'];
    heirarchySts = json['heirarchy_sts'];
    entitledleave = json['entitledleave'];
    balanceleave = json['balanceleave'];
    lTAmonth = json['LTAmonth'];
    lTAStsMonth = json['LTA_sts_month'];
    fencearea = json['fencearea'];
    undertimePayment = json['UndertimePayment'];
    weekdaysUndertimeAmt = json['WeekdaysUndertimeAmt'];
    multipletimeStatus = json['MultipletimeStatus'];
    pensionScheme = json['Pension_scheme'];
    address = json['Address'];
    sAPIntegId = json['SAP_IntegId'];
    costallocation = json['Costallocation'];
    zoneId = json['ZoneId'];
    uFPersonId = json['UF_PersonId'];
    notificationStatus = json['NotificationStatus'];
    applicableLwf = json['applicable_lwf'];
    salaryType = json['SalaryType'];
    razorpayEmpId = json['RazorpayEmpId'];
    razorpayMappedSts = json['RazorpayMappedSts'];
    name = json['Name'];
    website = json['Website'];
    phoneNumber = json['PhoneNumber'];
    altPhoneNumber = json['AltPhoneNumber'];
    email = json['Email'];
    altEmail = json['AltEmail'];
    logo = json['Logo'];
    orgRemark = json['org_remark'];
    country = json['Country'];
    city = json['City'];
    zipCode = json['ZipCode'];
    landmark = json['Landmark'];
    currency = json['Currency'];
    dateFormat = json['DateFormat'];
    timeFormat = json['TimeFormat'];
    timeZone = json['TimeZone'];
    aboutCompany = json['AboutCompany'];
    planId = json['PlanId'];
    noOfEmp = json['NoOfEmp'];
    hrmLink = json['HrmLink'];
    noAdmin = json['no_admin'];
    startfiscalyear = json['startfiscalyear'];
    endfiscalyear = json['endfiscalyear'];
    mailVarified = json['mail_varified'];
    cleanedUp = json['cleaned_up'];
    customizeOrg = json['customize_org'];
    deleteSts = json['delete_sts'];
    mailUnsubscribe = json['mail_unsubscribe'];
    smtpuser = json['smtpuser'];
    trialSts = json['Trial_sts'];
    smtppassword = json['smtppassword'];
    ubihrmSts = json['ubihrm_sts'];
    ubihrmSetupSts = json['ubihrm_setup_sts'];
    dataDeleteSts = json['DataDeleteSts'];
    leadownerId = json['leadowner_id'];
    rating = json['rating'];
    review = json['review'];
    platform = json['platform'];
    biometricStatus = json['biometric_status'];
    sAPIntegrationStatus = json['SAP_Integration_status'];
    groupcompaniesSts = json['groupcompanies_sts'];
    reportNotificationSent = json['ReportNotificationSent'];
    attendanceselfiests = json['attendanceselfiests'];
    visitselfiests = json['visitselfiests'];
    flexiselfiests = json['flexiselfiests'];
    geoFenceRestriction = json['GeoFenceRestriction'];
    contactPerson = json['contactPerson'];
    fiscalStart = json['fiscal_start'];
    fiscalEnd = json['fiscal_end'];
    entitledLeave = json['entitled_leave'];
    modules = json['modules'];
    preferredTimeToCall = json['PreferredTimeToCall'];
    requirements = json['Requirements'];
    faceRecognitionThrashhold = json['FaceRecognitionThrashhold'];
    faceRecognitionRestriction = json['FaceRecognitionRestriction'];
    app = json['app'];
    mailVerifyStsCounter = json['mailVerifyStsCounter'];
    mailVerificationLinkSentDate = json['MailVerificationLinkSentDate'];
    surveySts = json['survey_sts'];
    resellerId = json['ResellerId'];
    deviceverificationSetting = json['deviceverification_setting'];
    whiteLabelingSts = json['white_labeling_sts'];
    counter = json['Counter'];
    policypwdsts = json['policypwdsts'];
    oTP = json['OTP'];
    remarks = json['Remarks'];
    termsAndConditionChk = json['terms_and_condition_chk'];
    stages = json['Stages'];
    demosts = json['demosts'];
    visitRestriction = json['Visit_Restriction'];
    unsubscribeReason = json['UnsubscribeReason'];
    loginWithEmpCodeSts = json['LoginWithEmpCodeSts'];
    addonRegularization = json['Addon_Regularization'];
    iPRestriction = json['IPRestriction'];
    apiIntegration = json['Api_Integration'];
    cRMOrganization = json['CRM_Organization'];
    currencyCode = json['CurrencyCode'];
    organizationName = json['OrganizationName'];
    profileId = json['profileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['EmployeeId'] = employeeId;
    data['Password'] = password;
    data['Username'] = username;
    data['userprofile'] = userprofile;
    data['username_mobile'] = usernameMobile;
    data['AadharNo'] = aadharNo;
    data['RoleId'] = roleId;
    data['OrganizationId'] = organizationId;
    data['CreatedDate'] = createdDate;
    data['CreatedById'] = createdById;
    data['LastModifiedDate'] = lastModifiedDate;
    data['LastModifiedById'] = lastModifiedById;
    data['OwnerId'] = ownerId;
    data['AdminSts'] = adminSts;
    data['VisibleSts'] = visibleSts;
    data['trial_OrganizationId'] = trialOrganizationId;
    data['appSuperviserSts'] = appSuperviserSts;
    data['archive'] = archive;
    data['resetPassCounter'] = resetPassCounter;
    data['HRSts'] = hRSts;
    data['AppId'] = appId;
    data['DeviceId'] = deviceId;
    data['Password_sts'] = passwordSts;
    data['Selfie'] = selfie;
    data['VisitSelfieSts'] = visitSelfieSts;
    data['Device_Restriction'] = deviceRestriction;
    data['Finger_Print'] = fingerPrint;
    data['QR_code'] = qRCode;
    data['Face_Id'] = faceId;
    data['policypasswordstatus'] = policypasswordstatus;
    data['LoginSts'] = loginSts;
    data['OfflineFaceId'] = offlineFaceId;
    data['Qr_UniqueId'] = qrUniqueId;
    data['AuthorizationAppleID'] = authorizationAppleID;
    data['kioskPin'] = kioskPin;
    data['QrKioskPageReopen'] = qrKioskPageReopen;
    data['AppLoginSts'] = appLoginSts;
    data['Att_restrict'] = attRestrict;
    data['RestrictLogin'] = restrictLogin;
    data['restrictLoginTimestamp'] = restrictLoginTimestamp;
    data['CRM_Employee'] = cRMEmployee;
    data['EmployeeCode'] = employeeCode;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['DOB'] = dOB;
    data['Nationality'] = nationality;
    data['MaritalStatus'] = maritalStatus;
    data['Religion'] = religion;
    data['BloodGroup'] = bloodGroup;
    data['KnownLanguage'] = knownLanguage;
    data['DOJ'] = dOJ;
    data['DOC'] = dOC;
    data['Visa'] = visa;
    data['Gender'] = gender;
    data['CurrentContactNumber'] = currentContactNumber;
    data['CurrentEmailId'] = currentEmailId;
    data['CurrentAddress'] = currentAddress;
    data['CurrentCountry'] = currentCountry;
    data['CurrentCity'] = currentCity;
    data['CurrentZipCode'] = currentZipCode;
    data['HomeContactNumber'] = homeContactNumber;
    data['HomeEmailId'] = homeEmailId;
    data['HomeAddress'] = homeAddress;
    data['HomeCountry'] = homeCountry;
    data['HomeCity'] = homeCity;
    data['HomeZipCode'] = homeZipCode;
    data['EmergencyContactNumber'] = emergencyContactNumber;
    data['EmergencyEmailId'] = emergencyEmailId;
    data['EmergencyAddress'] = emergencyAddress;
    data['EmergencyCountry'] = emergencyCountry;
    data['EmergencyCity'] = emergencyCity;
    data['EmergencyZipCode'] = emergencyZipCode;
    data['ReportingTo'] = reportingTo;
    data['Division'] = division;
    data['Department'] = department;
    data['Channel'] = channel;
    data['Designation'] = designation;
    data['Location'] = location;
    data['Shift'] = shift;
    data['area_assigned'] = areaAssigned;
    data['EmployeeStatus'] = employeeStatus;
    data['Grade'] = grade;
    data['WorkingDays'] = workingDays;
    data['FunctionalArea'] = functionalArea;
    data['ImageName'] = imageName;
    data['EmployeeCTC'] = employeeCTC;
    data['PayPattern'] = payPattern;
    data['ModePayment'] = modePayment;
    data['BankName'] = bankName;
    data['BankIFSCCode'] = bankIFSCCode;
    data['BankAccount'] = bankAccount;
    data['BankAddress'] = bankAddress;
    data['EmploymentType'] = employmentType;
    data['TotalExp'] = totalExp;
    data['CompanyEmail'] = companyEmail;
    data['NearestAirport'] = nearestAirport;
    data['AirTicket'] = airTicket;
    data['TicketClass'] = ticketClass;
    data['IATAFare'] = iATAFare;
    data['LastTicketAmt'] = lastTicketAmt;
    data['OnceIn'] = onceIn;
    data['TravelInstruction'] = travelInstruction;
    data['FamilyDetail'] = familyDetail;
    data['ProvisionPeriod'] = provisionPeriod;
    data['MiddleName'] = middleName;
    data['DOL'] = dOL;
    data['countrycode'] = countrycode;
    data['PersonalNo'] = personalNo;
    data['OvertimePayment'] = overtimePayment;
    data['CostCentre'] = costCentre;
    data['CoCentre'] = coCentre;
    data['NoOfMonths'] = noOfMonths;
    data['SalaryIncreament'] = salaryIncreament;
    data['FatherName'] = fatherName;
    data['VisaCategory'] = visaCategory;
    data['EmergencyContactPerson'] = emergencyContactPerson;
    data['hourly_rate'] = hourlyRate;
    data['UID_No'] = uIDNo;
    data['File_No'] = fileNo;
    data['UniqueId'] = uniqueId;
    data['AnnualCTC'] = annualCTC;
    data['uan'] = uan;
    data['esi_no'] = esiNo;
    data['pf_no'] = pfNo;
    data['Is_Delete'] = isDelete;
    data['Deleted_Date'] = deletedDate;
    data['EmpAddSts'] = empAddSts;
    data['applicable_pf'] = applicablePf;
    data['applicable_esi'] = applicableEsi;
    data['applicable_pt'] = applicablePt;
    data['ticket_no'] = ticketNo;
    data['Local_Job_Title'] = localJobTitle;
    data['Local_Employee_code'] = localEmployeeCode;
    data['weeklyAmt'] = weeklyAmt;
    data['publicholidayAmt'] = publicholidayAmt;
    data['weekdaysAmt'] = weekdaysAmt;
    data['InPushNotificationStatus'] = inPushNotificationStatus;
    data['OutPushNotificationStatus'] = outPushNotificationStatus;
    data['PersonId'] = personId;
    data['DeviceName'] = deviceName;
    data['timezone'] = timezone;
    data['DateOfRejoining'] = dateOfRejoining;
    data['previous_DOL'] = previousDOL;
    data['biometricDeviceId'] = biometricDeviceId;
    data['GeneralColumn'] = generalColumn;
    data['AadhaarCard'] = aadhaarCard;
    data['PanCard'] = panCard;
    data['ModeofAttendance'] = modeofAttendance;
    data['Age'] = age;
    data['Hypertension_drop'] = hypertensionDrop;
    data['HeartDisease_drop'] = heartDiseaseDrop;
    data['Diabetes_drop'] = diabetesDrop;
    data['LungDisease_drop'] = lungDiseaseDrop;
    data['Travelledinlast14days_drop'] = travelledinlast14daysDrop;
    data['TravelledCountry_drop'] = travelledCountryDrop;
    data['Risk_drop'] = riskDrop;
    data['livelocationtrack'] = livelocationtrack;
    data['heirarchy_sts'] = heirarchySts;
    data['entitledleave'] = entitledleave;
    data['balanceleave'] = balanceleave;
    data['LTAmonth'] = lTAmonth;
    data['LTA_sts_month'] = lTAStsMonth;
    data['fencearea'] = fencearea;
    data['UndertimePayment'] = undertimePayment;
    data['WeekdaysUndertimeAmt'] = weekdaysUndertimeAmt;
    data['MultipletimeStatus'] = multipletimeStatus;
    data['Pension_scheme'] = pensionScheme;
    data['Address'] = address;
    data['SAP_IntegId'] = sAPIntegId;
    data['Costallocation'] = costallocation;
    data['ZoneId'] = zoneId;
    data['UF_PersonId'] = uFPersonId;
    data['NotificationStatus'] = notificationStatus;
    data['applicable_lwf'] = applicableLwf;
    data['SalaryType'] = salaryType;
    data['RazorpayEmpId'] = razorpayEmpId;
    data['RazorpayMappedSts'] = razorpayMappedSts;
    data['Name'] = name;
    data['Website'] = website;
    data['PhoneNumber'] = phoneNumber;
    data['AltPhoneNumber'] = altPhoneNumber;
    data['Email'] = email;
    data['AltEmail'] = altEmail;
    data['Logo'] = logo;
    data['org_remark'] = orgRemark;
    data['Country'] = country;
    data['City'] = city;
    data['ZipCode'] = zipCode;
    data['Landmark'] = landmark;
    data['Currency'] = currency;
    data['DateFormat'] = dateFormat;
    data['TimeFormat'] = timeFormat;
    data['TimeZone'] = timeZone;
    data['AboutCompany'] = aboutCompany;
    data['PlanId'] = planId;
    data['NoOfEmp'] = noOfEmp;
    data['HrmLink'] = hrmLink;
    data['no_admin'] = noAdmin;
    data['startfiscalyear'] = startfiscalyear;
    data['endfiscalyear'] = endfiscalyear;
    data['mail_varified'] = mailVarified;
    data['cleaned_up'] = cleanedUp;
    data['customize_org'] = customizeOrg;
    data['delete_sts'] = deleteSts;
    data['mail_unsubscribe'] = mailUnsubscribe;
    data['smtpuser'] = smtpuser;
    data['Trial_sts'] = trialSts;
    data['smtppassword'] = smtppassword;
    data['ubihrm_sts'] = ubihrmSts;
    data['ubihrm_setup_sts'] = ubihrmSetupSts;
    data['DataDeleteSts'] = dataDeleteSts;
    data['leadowner_id'] = leadownerId;
    data['rating'] = rating;
    data['review'] = review;
    data['platform'] = platform;
    data['biometric_status'] = biometricStatus;
    data['SAP_Integration_status'] = sAPIntegrationStatus;
    data['groupcompanies_sts'] = groupcompaniesSts;
    data['ReportNotificationSent'] = reportNotificationSent;
    data['attendanceselfiests'] = attendanceselfiests;
    data['visitselfiests'] = visitselfiests;
    data['flexiselfiests'] = flexiselfiests;
    data['GeoFenceRestriction'] = geoFenceRestriction;
    data['contactPerson'] = contactPerson;
    data['fiscal_start'] = fiscalStart;
    data['fiscal_end'] = fiscalEnd;
    data['entitled_leave'] = entitledLeave;
    data['modules'] = modules;
    data['PreferredTimeToCall'] = preferredTimeToCall;
    data['Requirements'] = requirements;
    data['FaceRecognitionThrashhold'] = faceRecognitionThrashhold;
    data['FaceRecognitionRestriction'] = faceRecognitionRestriction;
    data['app'] = app;
    data['mailVerifyStsCounter'] = mailVerifyStsCounter;
    data['MailVerificationLinkSentDate'] = mailVerificationLinkSentDate;
    data['survey_sts'] = surveySts;
    data['ResellerId'] = resellerId;
    data['deviceverification_setting'] = deviceverificationSetting;
    data['white_labeling_sts'] = whiteLabelingSts;
    data['Counter'] = counter;
    data['policypwdsts'] = policypwdsts;
    data['OTP'] = oTP;
    data['Remarks'] = remarks;
    data['terms_and_condition_chk'] = termsAndConditionChk;
    data['Stages'] = stages;
    data['demosts'] = demosts;
    data['Visit_Restriction'] = visitRestriction;
    data['UnsubscribeReason'] = unsubscribeReason;
    data['LoginWithEmpCodeSts'] = loginWithEmpCodeSts;
    data['Addon_Regularization'] = addonRegularization;
    data['IPRestriction'] = iPRestriction;
    data['Api_Integration'] = apiIntegration;
    data['CRM_Organization'] = cRMOrganization;
    data['CurrencyCode'] = currencyCode;
    data['OrganizationName'] = organizationName;
    data['profileId'] = profileId;
    return data;
  }
}

class Team {
  String? firstName;
  int? id;
  String? employeeCode;

  Team({this.firstName, this.id, this.employeeCode});

  Team.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    id = json['id'];
    employeeCode = json['EmployeeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstName'] = firstName;
    data['id'] = id;
    data['EmployeeCode'] = employeeCode;
    return data;
  }
}
