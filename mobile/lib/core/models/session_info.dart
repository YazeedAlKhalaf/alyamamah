import 'dart:convert';

class SessionInfo {
  final String eRegisterUserId;
  final bool ssoLogin;
  final String academicEmail;
  final String academicMail;
  final bool acadimcDetachedMsg;
  final int actionRaseBy;
  final bool activateWarningMsg;
  final bool active;
  final String actorName;
  final String actorNameEn;
  final String actorType;
  final String actorTypeLogin;
  final String actualWorkDept;
  final String actualWorkDeptDesc;
  final String advisorName;
  final bool affairsQuestionnaire;
  final String age;
  final String alarmsNumber;
  final bool alertQuestionnaireType;
  final String align;
  final String align2;
  final String apologizeCourseCount;
  final String apologizeSemesterCount;
  final String birthDate;
  final String bisectPeriod;
  final bool blockingQuestionnaireType;
  final String bloodType;
  final String campusName;
  final String campusNo;
  final int capatchAttempts;
  final bool capatchaStatus;
  final bool capatchaValidate;
  final String category;
  final String contextRoot;
  final bool continuesStudent;
  final String currentSemester;
  final String currentSemesterDesc;
  final String dataSource;
  final bool deanDuty;
  final String degreeCode;
  final String degreeCodeDesc;
  final String deptId;
  final String deptName;
  final String direction;
  final String divContentOfPage;
  final String divMessage;
  final String divMessageClass;
  final String dutyCode;
  final bool dutyJudgementFlag;
  final bool dutyJudgementReward;
  final bool dutyJudgementRewardMagazine;
  final bool dutyPromotionStaff;
  final bool dutyPromotionStaffApproval;
  final bool dynamicDataSource;
  final bool eliStudent;
  final String email;
  final String empDesc;
  final String empDescId;
  final String empId;
  final bool enableFilter;
  final bool enableIban;
  final bool enabled;
  final bool endOvertimePayments;
  final int enteredPageNo;
  final int enteredServiceId;
  final bool entesabStudy;
  final bool exceptionStd;
  final String expGradMsg;
  final bool expectedGraduated;
  final String facultyId;
  final String facultyName;
  final String feesLawId;
  final bool financialValid;
  final String formCode;
  final String gender;
  final String genderDes;
  final bool graduated;
  final bool graduationQuestionnaire;
  final String haltKey;
  final bool halted;
  final bool haltedFinancial;
  final bool hasAcadimmicLevel;
  final bool hasAcadimmicLevelWithRector;
  final bool hasAreaDuty;
  final bool hasCalcExceptionStdReq;
  final bool hasContractorDuty;
  final bool hasDuty;
  final bool hasExpensesSonDuty;
  final bool hasExtraChance;
  final bool hasFaculityStudyDuty;
  final bool hasImage;
  final bool hasKsaStaffDuty;
  final bool hasOvertimePayments;
  final bool hasOvertimePaymentsRequest;
  final bool hasPurchaseDuty;
  final bool hasReportsDuty;
  final bool hasResidenceDuty;
  final bool hasScientificExcellenceReward;
  final bool hasSectionDuty;
  final bool hasSuggestionDuty;
  final bool hasTravelOrderSaudi;
  final bool hasUnvMgrDuty;
  final bool headDepartDuty;
  final bool hightStudyAdvisor;
  final bool higtExpectGraduate;
  final String hireCode;
  final bool iamLogin;
  final String imgLang;
  final bool instructorHasNonHome;
  final String instructorNameS;
  final int invalidCapatch;
  final int invalidLogin;
  final bool isAdvisor;
  final bool isAlarm;
  final bool isChangePassword;
  final bool isEmployee;
  final String isEmployeeDes;
  final bool isExpGrad;
  final bool isGivingDegree;
  final bool isLoggedIn;
  final bool isProctor;
  final bool isRegValid;
  final bool isRegValid2;
  final bool isSupervisor;
  final String job;
  final String joinSemester;
  final String joinSemesterDesc;
  final bool langBool;
  final int langId;
  final String langStr;
  final String lastFailLoginDate;
  final String lastLoginDate;
  final int loginAttempts;
  final bool loginLDAP;
  final String loginMessageFirstShow;
  final String loginType;
  final String majorId;
  final String majorName;
  final bool mandatoryEveluation;
  final bool mandatoryUpdateStaffInfoStatus;
  final String maritalStatus;
  final String maritalStatusDes;
  final bool markEntry;
  final String marksSemester;
  final String marksSemesterDesc;
  final String minPreparatoryGpa;
  final String mobile;
  final String nationalId;
  final String nationality;
  final String nationalityCode;
  final String nationalityType;
  final String newImageName;
  final bool newStudent;
  final String nextSemester;
  final String nextSemesterDesc;
  final String numOfAdvisorMsgsReq;
  final String numOfRegistryExcesses;
  final String password;
  final String planEdition;
  final int planRemainHrs;
  final int planTakenHrs;
  final int planTotalHrs;
  final bool planType3;
  final String planeType;
  final bool postLevelStudy;
  final String postponementSemesterCount;
  final String preparatoryGPA;
  final bool preparatoryPlaneType;
  final String printSemesterDesc;
  final String probationCount;
  final String probationMsg;
  final String profileImageName;
  final String prvSemester;
  final String prvSemesterDesc;
  final bool questionnaire;
  final String rank;
  final String rankCode;
  final bool receiveMassege;
  final bool regAddCoursesPeriod;
  final String regCampusName;
  final String regCampusNo;
  final bool regChangeSectionPeriod;
  final bool regDeleteCoursesPeriod;
  final int regHrs;
  final String regSemester;
  final String regSemesterDesc;
  final String reportServer;
  final String schoolBranch;
  final int selectedAdvisedStudent;
  final String serialUpdateEnglishName;
  final String sessionId;
  final bool showCASLogin;
  final bool showLangLink;
  final bool showNavHomeTopLink;
  final bool showServices;
  final bool signOut;
  final String skin;
  final bool specificationActive;
  final String statusCode;
  final String statusDesc;
  final String stdAccountingConnection;
  final bool stdShouldEnterChoicesOrChangeMagor;
  final String studentDrInfo;
  final String studentGPA;
  final String studentHoldStatus;
  final String studentType;
  final String studentlevel;
  final String studyCode;
  final String studyDesc;
  final String studyDescS;
  final String studyPeriod;
  final String studyType;
  final String studyTypeDesc;
  final String superAdmin;
  final String tempRandomNumber;
  final String transferCollegeCount;
  final String transferCollegeOutCountCount;
  final bool transferStudent;
  final String transferUniversityCount;
  final String uniNo;
  final String univCode;
  final String univCountry;
  final String univDesc;
  final bool updateEnglishName;
  final bool uploadStudentImage;
  final String userId;
  final String userNameWS;
  final String username;
  final bool visitorRegCampus;
  final bool visitorStudent;
  final String visitorsCount;
  final String warningMesage;
  final String yearlySemester;
  final String yearlySemesterDesc;

  const SessionInfo({
    required this.eRegisterUserId,
    required this.ssoLogin,
    required this.academicEmail,
    required this.academicMail,
    required this.acadimcDetachedMsg,
    required this.actionRaseBy,
    required this.activateWarningMsg,
    required this.active,
    required this.actorName,
    required this.actorNameEn,
    required this.actorType,
    required this.actorTypeLogin,
    required this.actualWorkDept,
    required this.actualWorkDeptDesc,
    required this.advisorName,
    required this.affairsQuestionnaire,
    required this.age,
    required this.alarmsNumber,
    required this.alertQuestionnaireType,
    required this.align,
    required this.align2,
    required this.apologizeCourseCount,
    required this.apologizeSemesterCount,
    required this.birthDate,
    required this.bisectPeriod,
    required this.blockingQuestionnaireType,
    required this.bloodType,
    required this.campusName,
    required this.campusNo,
    required this.capatchAttempts,
    required this.capatchaStatus,
    required this.capatchaValidate,
    required this.category,
    required this.contextRoot,
    required this.continuesStudent,
    required this.currentSemester,
    required this.currentSemesterDesc,
    required this.dataSource,
    required this.deanDuty,
    required this.degreeCode,
    required this.degreeCodeDesc,
    required this.deptId,
    required this.deptName,
    required this.direction,
    required this.divContentOfPage,
    required this.divMessage,
    required this.divMessageClass,
    required this.dutyCode,
    required this.dutyJudgementFlag,
    required this.dutyJudgementReward,
    required this.dutyJudgementRewardMagazine,
    required this.dutyPromotionStaff,
    required this.dutyPromotionStaffApproval,
    required this.dynamicDataSource,
    required this.eliStudent,
    required this.email,
    required this.empDesc,
    required this.empDescId,
    required this.empId,
    required this.enableFilter,
    required this.enableIban,
    required this.enabled,
    required this.endOvertimePayments,
    required this.enteredPageNo,
    required this.enteredServiceId,
    required this.entesabStudy,
    required this.exceptionStd,
    required this.expGradMsg,
    required this.expectedGraduated,
    required this.facultyId,
    required this.facultyName,
    required this.feesLawId,
    required this.financialValid,
    required this.formCode,
    required this.gender,
    required this.genderDes,
    required this.graduated,
    required this.graduationQuestionnaire,
    required this.haltKey,
    required this.halted,
    required this.haltedFinancial,
    required this.hasAcadimmicLevel,
    required this.hasAcadimmicLevelWithRector,
    required this.hasAreaDuty,
    required this.hasCalcExceptionStdReq,
    required this.hasContractorDuty,
    required this.hasDuty,
    required this.hasExpensesSonDuty,
    required this.hasExtraChance,
    required this.hasFaculityStudyDuty,
    required this.hasImage,
    required this.hasKsaStaffDuty,
    required this.hasOvertimePayments,
    required this.hasOvertimePaymentsRequest,
    required this.hasPurchaseDuty,
    required this.hasReportsDuty,
    required this.hasResidenceDuty,
    required this.hasScientificExcellenceReward,
    required this.hasSectionDuty,
    required this.hasSuggestionDuty,
    required this.hasTravelOrderSaudi,
    required this.hasUnvMgrDuty,
    required this.headDepartDuty,
    required this.hightStudyAdvisor,
    required this.higtExpectGraduate,
    required this.hireCode,
    required this.iamLogin,
    required this.imgLang,
    required this.instructorHasNonHome,
    required this.instructorNameS,
    required this.invalidCapatch,
    required this.invalidLogin,
    required this.isAdvisor,
    required this.isAlarm,
    required this.isChangePassword,
    required this.isEmployee,
    required this.isEmployeeDes,
    required this.isExpGrad,
    required this.isGivingDegree,
    required this.isLoggedIn,
    required this.isProctor,
    required this.isRegValid,
    required this.isRegValid2,
    required this.isSupervisor,
    required this.job,
    required this.joinSemester,
    required this.joinSemesterDesc,
    required this.langBool,
    required this.langId,
    required this.langStr,
    required this.lastFailLoginDate,
    required this.lastLoginDate,
    required this.loginAttempts,
    required this.loginLDAP,
    required this.loginMessageFirstShow,
    required this.loginType,
    required this.majorId,
    required this.majorName,
    required this.mandatoryEveluation,
    required this.mandatoryUpdateStaffInfoStatus,
    required this.maritalStatus,
    required this.maritalStatusDes,
    required this.markEntry,
    required this.marksSemester,
    required this.marksSemesterDesc,
    required this.minPreparatoryGpa,
    required this.mobile,
    required this.nationalId,
    required this.nationality,
    required this.nationalityCode,
    required this.nationalityType,
    required this.newImageName,
    required this.newStudent,
    required this.nextSemester,
    required this.nextSemesterDesc,
    required this.numOfAdvisorMsgsReq,
    required this.numOfRegistryExcesses,
    required this.password,
    required this.planEdition,
    required this.planRemainHrs,
    required this.planTakenHrs,
    required this.planTotalHrs,
    required this.planType3,
    required this.planeType,
    required this.postLevelStudy,
    required this.postponementSemesterCount,
    required this.preparatoryGPA,
    required this.preparatoryPlaneType,
    required this.printSemesterDesc,
    required this.probationCount,
    required this.probationMsg,
    required this.profileImageName,
    required this.prvSemester,
    required this.prvSemesterDesc,
    required this.questionnaire,
    required this.rank,
    required this.rankCode,
    required this.receiveMassege,
    required this.regAddCoursesPeriod,
    required this.regCampusName,
    required this.regCampusNo,
    required this.regChangeSectionPeriod,
    required this.regDeleteCoursesPeriod,
    required this.regHrs,
    required this.regSemester,
    required this.regSemesterDesc,
    required this.reportServer,
    required this.schoolBranch,
    required this.selectedAdvisedStudent,
    required this.serialUpdateEnglishName,
    required this.sessionId,
    required this.showCASLogin,
    required this.showLangLink,
    required this.showNavHomeTopLink,
    required this.showServices,
    required this.signOut,
    required this.skin,
    required this.specificationActive,
    required this.statusCode,
    required this.statusDesc,
    required this.stdAccountingConnection,
    required this.stdShouldEnterChoicesOrChangeMagor,
    required this.studentDrInfo,
    required this.studentGPA,
    required this.studentHoldStatus,
    required this.studentType,
    required this.studentlevel,
    required this.studyCode,
    required this.studyDesc,
    required this.studyDescS,
    required this.studyPeriod,
    required this.studyType,
    required this.studyTypeDesc,
    required this.superAdmin,
    required this.tempRandomNumber,
    required this.transferCollegeCount,
    required this.transferCollegeOutCountCount,
    required this.transferStudent,
    required this.transferUniversityCount,
    required this.uniNo,
    required this.univCode,
    required this.univCountry,
    required this.univDesc,
    required this.updateEnglishName,
    required this.uploadStudentImage,
    required this.userId,
    required this.userNameWS,
    required this.username,
    required this.visitorRegCampus,
    required this.visitorStudent,
    required this.visitorsCount,
    required this.warningMesage,
    required this.yearlySemester,
    required this.yearlySemesterDesc,
  });

  SessionInfo copyWith({
    String? eRegisterUserId,
    bool? ssoLogin,
    String? academicEmail,
    String? academicMail,
    bool? acadimcDetachedMsg,
    int? actionRaseBy,
    bool? activateWarningMsg,
    bool? active,
    String? actorName,
    String? actorNameEn,
    String? actorType,
    String? actorTypeLogin,
    String? actualWorkDept,
    String? actualWorkDeptDesc,
    String? advisorName,
    bool? affairsQuestionnaire,
    String? age,
    String? alarmsNumber,
    bool? alertQuestionnaireType,
    String? align,
    String? align2,
    String? apologizeCourseCount,
    String? apologizeSemesterCount,
    String? birthDate,
    String? bisectPeriod,
    bool? blockingQuestionnaireType,
    String? bloodType,
    String? campusName,
    String? campusNo,
    int? capatchAttempts,
    bool? capatchaStatus,
    bool? capatchaValidate,
    String? category,
    String? contextRoot,
    bool? continuesStudent,
    String? currentSemester,
    String? currentSemesterDesc,
    String? dataSource,
    bool? deanDuty,
    String? degreeCode,
    String? degreeCodeDesc,
    String? deptId,
    String? deptName,
    String? direction,
    String? divContentOfPage,
    String? divMessage,
    String? divMessageClass,
    String? dutyCode,
    bool? dutyJudgementFlag,
    bool? dutyJudgementReward,
    bool? dutyJudgementRewardMagazine,
    bool? dutyPromotionStaff,
    bool? dutyPromotionStaffApproval,
    bool? dynamicDataSource,
    bool? eliStudent,
    String? email,
    String? empDesc,
    String? empDescId,
    String? empId,
    bool? enableFilter,
    bool? enableIban,
    bool? enabled,
    bool? endOvertimePayments,
    int? enteredPageNo,
    int? enteredServiceId,
    bool? entesabStudy,
    bool? exceptionStd,
    String? expGradMsg,
    bool? expectedGraduated,
    String? facultyId,
    String? facultyName,
    String? feesLawId,
    bool? financialValid,
    String? formCode,
    String? gender,
    String? genderDes,
    bool? graduated,
    bool? graduationQuestionnaire,
    String? haltKey,
    bool? halted,
    bool? haltedFinancial,
    bool? hasAcadimmicLevel,
    bool? hasAcadimmicLevelWithRector,
    bool? hasAreaDuty,
    bool? hasCalcExceptionStdReq,
    bool? hasContractorDuty,
    bool? hasDuty,
    bool? hasExpensesSonDuty,
    bool? hasExtraChance,
    bool? hasFaculityStudyDuty,
    bool? hasImage,
    bool? hasKsaStaffDuty,
    bool? hasOvertimePayments,
    bool? hasOvertimePaymentsRequest,
    bool? hasPurchaseDuty,
    bool? hasReportsDuty,
    bool? hasResidenceDuty,
    bool? hasScientificExcellenceReward,
    bool? hasSectionDuty,
    bool? hasSuggestionDuty,
    bool? hasTravelOrderSaudi,
    bool? hasUnvMgrDuty,
    bool? headDepartDuty,
    bool? hightStudyAdvisor,
    bool? higtExpectGraduate,
    String? hireCode,
    bool? iamLogin,
    String? imgLang,
    bool? instructorHasNonHome,
    String? instructorNameS,
    int? invalidCapatch,
    int? invalidLogin,
    bool? isAdvisor,
    bool? isAlarm,
    bool? isChangePassword,
    bool? isEmployee,
    String? isEmployeeDes,
    bool? isExpGrad,
    bool? isGivingDegree,
    bool? isLoggedIn,
    bool? isProctor,
    bool? isRegValid,
    bool? isRegValid2,
    bool? isSupervisor,
    String? job,
    String? joinSemester,
    String? joinSemesterDesc,
    bool? langBool,
    int? langId,
    String? langStr,
    String? lastFailLoginDate,
    String? lastLoginDate,
    int? loginAttempts,
    bool? loginLDAP,
    String? loginMessageFirstShow,
    String? loginType,
    String? majorId,
    String? majorName,
    bool? mandatoryEveluation,
    bool? mandatoryUpdateStaffInfoStatus,
    String? maritalStatus,
    String? maritalStatusDes,
    bool? markEntry,
    String? marksSemester,
    String? marksSemesterDesc,
    String? minPreparatoryGpa,
    String? mobile,
    String? nationalId,
    String? nationality,
    String? nationalityCode,
    String? nationalityType,
    String? newImageName,
    bool? newStudent,
    String? nextSemester,
    String? nextSemesterDesc,
    String? numOfAdvisorMsgsReq,
    String? numOfRegistryExcesses,
    String? password,
    String? planEdition,
    int? planRemainHrs,
    int? planTakenHrs,
    int? planTotalHrs,
    bool? planType3,
    String? planeType,
    bool? postLevelStudy,
    String? postponementSemesterCount,
    String? preparatoryGPA,
    bool? preparatoryPlaneType,
    String? printSemesterDesc,
    String? probationCount,
    String? probationMsg,
    String? profileImageName,
    String? prvSemester,
    String? prvSemesterDesc,
    bool? questionnaire,
    String? rank,
    String? rankCode,
    bool? receiveMassege,
    bool? regAddCoursesPeriod,
    String? regCampusName,
    String? regCampusNo,
    bool? regChangeSectionPeriod,
    bool? regDeleteCoursesPeriod,
    int? regHrs,
    String? regSemester,
    String? regSemesterDesc,
    String? reportServer,
    String? schoolBranch,
    int? selectedAdvisedStudent,
    String? serialUpdateEnglishName,
    String? sessionId,
    bool? showCASLogin,
    bool? showLangLink,
    bool? showNavHomeTopLink,
    bool? showServices,
    bool? signOut,
    String? skin,
    bool? specificationActive,
    String? statusCode,
    String? statusDesc,
    String? stdAccountingConnection,
    bool? stdShouldEnterChoicesOrChangeMagor,
    String? studentDrInfo,
    String? studentGPA,
    String? studentHoldStatus,
    String? studentType,
    String? studentlevel,
    String? studyCode,
    String? studyDesc,
    String? studyDescS,
    String? studyPeriod,
    String? studyType,
    String? studyTypeDesc,
    String? superAdmin,
    String? tempRandomNumber,
    String? transferCollegeCount,
    String? transferCollegeOutCountCount,
    bool? transferStudent,
    String? transferUniversityCount,
    String? uniNo,
    String? univCode,
    String? univCountry,
    String? univDesc,
    bool? updateEnglishName,
    bool? uploadStudentImage,
    String? userId,
    String? userNameWS,
    String? username,
    bool? visitorRegCampus,
    bool? visitorStudent,
    String? visitorsCount,
    String? warningMesage,
    String? yearlySemester,
    String? yearlySemesterDesc,
  }) {
    return SessionInfo(
      eRegisterUserId: eRegisterUserId ?? this.eRegisterUserId,
      ssoLogin: ssoLogin ?? this.ssoLogin,
      academicEmail: academicEmail ?? this.academicEmail,
      academicMail: academicMail ?? this.academicMail,
      acadimcDetachedMsg: acadimcDetachedMsg ?? this.acadimcDetachedMsg,
      actionRaseBy: actionRaseBy ?? this.actionRaseBy,
      activateWarningMsg: activateWarningMsg ?? this.activateWarningMsg,
      active: active ?? this.active,
      actorName: actorName ?? this.actorName,
      actorNameEn: actorNameEn ?? this.actorNameEn,
      actorType: actorType ?? this.actorType,
      actorTypeLogin: actorTypeLogin ?? this.actorTypeLogin,
      actualWorkDept: actualWorkDept ?? this.actualWorkDept,
      actualWorkDeptDesc: actualWorkDeptDesc ?? this.actualWorkDeptDesc,
      advisorName: advisorName ?? this.advisorName,
      affairsQuestionnaire: affairsQuestionnaire ?? this.affairsQuestionnaire,
      age: age ?? this.age,
      alarmsNumber: alarmsNumber ?? this.alarmsNumber,
      alertQuestionnaireType:
          alertQuestionnaireType ?? this.alertQuestionnaireType,
      align: align ?? this.align,
      align2: align2 ?? this.align2,
      apologizeCourseCount: apologizeCourseCount ?? this.apologizeCourseCount,
      apologizeSemesterCount:
          apologizeSemesterCount ?? this.apologizeSemesterCount,
      birthDate: birthDate ?? this.birthDate,
      bisectPeriod: bisectPeriod ?? this.bisectPeriod,
      blockingQuestionnaireType:
          blockingQuestionnaireType ?? this.blockingQuestionnaireType,
      bloodType: bloodType ?? this.bloodType,
      campusName: campusName ?? this.campusName,
      campusNo: campusNo ?? this.campusNo,
      capatchAttempts: capatchAttempts ?? this.capatchAttempts,
      capatchaStatus: capatchaStatus ?? this.capatchaStatus,
      capatchaValidate: capatchaValidate ?? this.capatchaValidate,
      category: category ?? this.category,
      contextRoot: contextRoot ?? this.contextRoot,
      continuesStudent: continuesStudent ?? this.continuesStudent,
      currentSemester: currentSemester ?? this.currentSemester,
      currentSemesterDesc: currentSemesterDesc ?? this.currentSemesterDesc,
      dataSource: dataSource ?? this.dataSource,
      deanDuty: deanDuty ?? this.deanDuty,
      degreeCode: degreeCode ?? this.degreeCode,
      degreeCodeDesc: degreeCodeDesc ?? this.degreeCodeDesc,
      deptId: deptId ?? this.deptId,
      deptName: deptName ?? this.deptName,
      direction: direction ?? this.direction,
      divContentOfPage: divContentOfPage ?? this.divContentOfPage,
      divMessage: divMessage ?? this.divMessage,
      divMessageClass: divMessageClass ?? this.divMessageClass,
      dutyCode: dutyCode ?? this.dutyCode,
      dutyJudgementFlag: dutyJudgementFlag ?? this.dutyJudgementFlag,
      dutyJudgementReward: dutyJudgementReward ?? this.dutyJudgementReward,
      dutyJudgementRewardMagazine:
          dutyJudgementRewardMagazine ?? this.dutyJudgementRewardMagazine,
      dutyPromotionStaff: dutyPromotionStaff ?? this.dutyPromotionStaff,
      dutyPromotionStaffApproval:
          dutyPromotionStaffApproval ?? this.dutyPromotionStaffApproval,
      dynamicDataSource: dynamicDataSource ?? this.dynamicDataSource,
      eliStudent: eliStudent ?? this.eliStudent,
      email: email ?? this.email,
      empDesc: empDesc ?? this.empDesc,
      empDescId: empDescId ?? this.empDescId,
      empId: empId ?? this.empId,
      enableFilter: enableFilter ?? this.enableFilter,
      enableIban: enableIban ?? this.enableIban,
      enabled: enabled ?? this.enabled,
      endOvertimePayments: endOvertimePayments ?? this.endOvertimePayments,
      enteredPageNo: enteredPageNo ?? this.enteredPageNo,
      enteredServiceId: enteredServiceId ?? this.enteredServiceId,
      entesabStudy: entesabStudy ?? this.entesabStudy,
      exceptionStd: exceptionStd ?? this.exceptionStd,
      expGradMsg: expGradMsg ?? this.expGradMsg,
      expectedGraduated: expectedGraduated ?? this.expectedGraduated,
      facultyId: facultyId ?? this.facultyId,
      facultyName: facultyName ?? this.facultyName,
      feesLawId: feesLawId ?? this.feesLawId,
      financialValid: financialValid ?? this.financialValid,
      formCode: formCode ?? this.formCode,
      gender: gender ?? this.gender,
      genderDes: genderDes ?? this.genderDes,
      graduated: graduated ?? this.graduated,
      graduationQuestionnaire:
          graduationQuestionnaire ?? this.graduationQuestionnaire,
      haltKey: haltKey ?? this.haltKey,
      halted: halted ?? this.halted,
      haltedFinancial: haltedFinancial ?? this.haltedFinancial,
      hasAcadimmicLevel: hasAcadimmicLevel ?? this.hasAcadimmicLevel,
      hasAcadimmicLevelWithRector:
          hasAcadimmicLevelWithRector ?? this.hasAcadimmicLevelWithRector,
      hasAreaDuty: hasAreaDuty ?? this.hasAreaDuty,
      hasCalcExceptionStdReq:
          hasCalcExceptionStdReq ?? this.hasCalcExceptionStdReq,
      hasContractorDuty: hasContractorDuty ?? this.hasContractorDuty,
      hasDuty: hasDuty ?? this.hasDuty,
      hasExpensesSonDuty: hasExpensesSonDuty ?? this.hasExpensesSonDuty,
      hasExtraChance: hasExtraChance ?? this.hasExtraChance,
      hasFaculityStudyDuty: hasFaculityStudyDuty ?? this.hasFaculityStudyDuty,
      hasImage: hasImage ?? this.hasImage,
      hasKsaStaffDuty: hasKsaStaffDuty ?? this.hasKsaStaffDuty,
      hasOvertimePayments: hasOvertimePayments ?? this.hasOvertimePayments,
      hasOvertimePaymentsRequest:
          hasOvertimePaymentsRequest ?? this.hasOvertimePaymentsRequest,
      hasPurchaseDuty: hasPurchaseDuty ?? this.hasPurchaseDuty,
      hasReportsDuty: hasReportsDuty ?? this.hasReportsDuty,
      hasResidenceDuty: hasResidenceDuty ?? this.hasResidenceDuty,
      hasScientificExcellenceReward:
          hasScientificExcellenceReward ?? this.hasScientificExcellenceReward,
      hasSectionDuty: hasSectionDuty ?? this.hasSectionDuty,
      hasSuggestionDuty: hasSuggestionDuty ?? this.hasSuggestionDuty,
      hasTravelOrderSaudi: hasTravelOrderSaudi ?? this.hasTravelOrderSaudi,
      hasUnvMgrDuty: hasUnvMgrDuty ?? this.hasUnvMgrDuty,
      headDepartDuty: headDepartDuty ?? this.headDepartDuty,
      hightStudyAdvisor: hightStudyAdvisor ?? this.hightStudyAdvisor,
      higtExpectGraduate: higtExpectGraduate ?? this.higtExpectGraduate,
      hireCode: hireCode ?? this.hireCode,
      iamLogin: iamLogin ?? this.iamLogin,
      imgLang: imgLang ?? this.imgLang,
      instructorHasNonHome: instructorHasNonHome ?? this.instructorHasNonHome,
      instructorNameS: instructorNameS ?? this.instructorNameS,
      invalidCapatch: invalidCapatch ?? this.invalidCapatch,
      invalidLogin: invalidLogin ?? this.invalidLogin,
      isAdvisor: isAdvisor ?? this.isAdvisor,
      isAlarm: isAlarm ?? this.isAlarm,
      isChangePassword: isChangePassword ?? this.isChangePassword,
      isEmployee: isEmployee ?? this.isEmployee,
      isEmployeeDes: isEmployeeDes ?? this.isEmployeeDes,
      isExpGrad: isExpGrad ?? this.isExpGrad,
      isGivingDegree: isGivingDegree ?? this.isGivingDegree,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isProctor: isProctor ?? this.isProctor,
      isRegValid: isRegValid ?? this.isRegValid,
      isRegValid2: isRegValid2 ?? this.isRegValid2,
      isSupervisor: isSupervisor ?? this.isSupervisor,
      job: job ?? this.job,
      joinSemester: joinSemester ?? this.joinSemester,
      joinSemesterDesc: joinSemesterDesc ?? this.joinSemesterDesc,
      langBool: langBool ?? this.langBool,
      langId: langId ?? this.langId,
      langStr: langStr ?? this.langStr,
      lastFailLoginDate: lastFailLoginDate ?? this.lastFailLoginDate,
      lastLoginDate: lastLoginDate ?? this.lastLoginDate,
      loginAttempts: loginAttempts ?? this.loginAttempts,
      loginLDAP: loginLDAP ?? this.loginLDAP,
      loginMessageFirstShow:
          loginMessageFirstShow ?? this.loginMessageFirstShow,
      loginType: loginType ?? this.loginType,
      majorId: majorId ?? this.majorId,
      majorName: majorName ?? this.majorName,
      mandatoryEveluation: mandatoryEveluation ?? this.mandatoryEveluation,
      mandatoryUpdateStaffInfoStatus:
          mandatoryUpdateStaffInfoStatus ?? this.mandatoryUpdateStaffInfoStatus,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      maritalStatusDes: maritalStatusDes ?? this.maritalStatusDes,
      markEntry: markEntry ?? this.markEntry,
      marksSemester: marksSemester ?? this.marksSemester,
      marksSemesterDesc: marksSemesterDesc ?? this.marksSemesterDesc,
      minPreparatoryGpa: minPreparatoryGpa ?? this.minPreparatoryGpa,
      mobile: mobile ?? this.mobile,
      nationalId: nationalId ?? this.nationalId,
      nationality: nationality ?? this.nationality,
      nationalityCode: nationalityCode ?? this.nationalityCode,
      nationalityType: nationalityType ?? this.nationalityType,
      newImageName: newImageName ?? this.newImageName,
      newStudent: newStudent ?? this.newStudent,
      nextSemester: nextSemester ?? this.nextSemester,
      nextSemesterDesc: nextSemesterDesc ?? this.nextSemesterDesc,
      numOfAdvisorMsgsReq: numOfAdvisorMsgsReq ?? this.numOfAdvisorMsgsReq,
      numOfRegistryExcesses:
          numOfRegistryExcesses ?? this.numOfRegistryExcesses,
      password: password ?? this.password,
      planEdition: planEdition ?? this.planEdition,
      planRemainHrs: planRemainHrs ?? this.planRemainHrs,
      planTakenHrs: planTakenHrs ?? this.planTakenHrs,
      planTotalHrs: planTotalHrs ?? this.planTotalHrs,
      planType3: planType3 ?? this.planType3,
      planeType: planeType ?? this.planeType,
      postLevelStudy: postLevelStudy ?? this.postLevelStudy,
      postponementSemesterCount:
          postponementSemesterCount ?? this.postponementSemesterCount,
      preparatoryGPA: preparatoryGPA ?? this.preparatoryGPA,
      preparatoryPlaneType: preparatoryPlaneType ?? this.preparatoryPlaneType,
      printSemesterDesc: printSemesterDesc ?? this.printSemesterDesc,
      probationCount: probationCount ?? this.probationCount,
      probationMsg: probationMsg ?? this.probationMsg,
      profileImageName: profileImageName ?? this.profileImageName,
      prvSemester: prvSemester ?? this.prvSemester,
      prvSemesterDesc: prvSemesterDesc ?? this.prvSemesterDesc,
      questionnaire: questionnaire ?? this.questionnaire,
      rank: rank ?? this.rank,
      rankCode: rankCode ?? this.rankCode,
      receiveMassege: receiveMassege ?? this.receiveMassege,
      regAddCoursesPeriod: regAddCoursesPeriod ?? this.regAddCoursesPeriod,
      regCampusName: regCampusName ?? this.regCampusName,
      regCampusNo: regCampusNo ?? this.regCampusNo,
      regChangeSectionPeriod:
          regChangeSectionPeriod ?? this.regChangeSectionPeriod,
      regDeleteCoursesPeriod:
          regDeleteCoursesPeriod ?? this.regDeleteCoursesPeriod,
      regHrs: regHrs ?? this.regHrs,
      regSemester: regSemester ?? this.regSemester,
      regSemesterDesc: regSemesterDesc ?? this.regSemesterDesc,
      reportServer: reportServer ?? this.reportServer,
      schoolBranch: schoolBranch ?? this.schoolBranch,
      selectedAdvisedStudent:
          selectedAdvisedStudent ?? this.selectedAdvisedStudent,
      serialUpdateEnglishName:
          serialUpdateEnglishName ?? this.serialUpdateEnglishName,
      sessionId: sessionId ?? this.sessionId,
      showCASLogin: showCASLogin ?? this.showCASLogin,
      showLangLink: showLangLink ?? this.showLangLink,
      showNavHomeTopLink: showNavHomeTopLink ?? this.showNavHomeTopLink,
      showServices: showServices ?? this.showServices,
      signOut: signOut ?? this.signOut,
      skin: skin ?? this.skin,
      specificationActive: specificationActive ?? this.specificationActive,
      statusCode: statusCode ?? this.statusCode,
      statusDesc: statusDesc ?? this.statusDesc,
      stdAccountingConnection:
          stdAccountingConnection ?? this.stdAccountingConnection,
      stdShouldEnterChoicesOrChangeMagor: stdShouldEnterChoicesOrChangeMagor ??
          this.stdShouldEnterChoicesOrChangeMagor,
      studentDrInfo: studentDrInfo ?? this.studentDrInfo,
      studentGPA: studentGPA ?? this.studentGPA,
      studentHoldStatus: studentHoldStatus ?? this.studentHoldStatus,
      studentType: studentType ?? this.studentType,
      studentlevel: studentlevel ?? this.studentlevel,
      studyCode: studyCode ?? this.studyCode,
      studyDesc: studyDesc ?? this.studyDesc,
      studyDescS: studyDescS ?? this.studyDescS,
      studyPeriod: studyPeriod ?? this.studyPeriod,
      studyType: studyType ?? this.studyType,
      studyTypeDesc: studyTypeDesc ?? this.studyTypeDesc,
      superAdmin: superAdmin ?? this.superAdmin,
      tempRandomNumber: tempRandomNumber ?? this.tempRandomNumber,
      transferCollegeCount: transferCollegeCount ?? this.transferCollegeCount,
      transferCollegeOutCountCount:
          transferCollegeOutCountCount ?? this.transferCollegeOutCountCount,
      transferStudent: transferStudent ?? this.transferStudent,
      transferUniversityCount:
          transferUniversityCount ?? this.transferUniversityCount,
      uniNo: uniNo ?? this.uniNo,
      univCode: univCode ?? this.univCode,
      univCountry: univCountry ?? this.univCountry,
      univDesc: univDesc ?? this.univDesc,
      updateEnglishName: updateEnglishName ?? this.updateEnglishName,
      uploadStudentImage: uploadStudentImage ?? this.uploadStudentImage,
      userId: userId ?? this.userId,
      userNameWS: userNameWS ?? this.userNameWS,
      username: username ?? this.username,
      visitorRegCampus: visitorRegCampus ?? this.visitorRegCampus,
      visitorStudent: visitorStudent ?? this.visitorStudent,
      visitorsCount: visitorsCount ?? this.visitorsCount,
      warningMesage: warningMesage ?? this.warningMesage,
      yearlySemester: yearlySemester ?? this.yearlySemester,
      yearlySemesterDesc: yearlySemesterDesc ?? this.yearlySemesterDesc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ERegisterUserId': eRegisterUserId,
      'SSOLogin': ssoLogin,
      'academicEmail': academicEmail,
      'academicMail': academicMail,
      'acadimcDetachedMsg': acadimcDetachedMsg,
      'actionRaseBy': actionRaseBy,
      'activateWarningMsg': activateWarningMsg,
      'active': active,
      'actorName': actorName,
      'actorNameEn': actorNameEn,
      'actorType': actorType,
      'actorTypeLogin': actorTypeLogin,
      'actualWorkDept': actualWorkDept,
      'actualWorkDeptDesc': actualWorkDeptDesc,
      'advisorName': advisorName,
      'affairsQuestionnaire': affairsQuestionnaire,
      'age': age,
      'alarmsNumber': alarmsNumber,
      'alertQuestionnaireType': alertQuestionnaireType,
      'align': align,
      'align2': align2,
      'apologizeCourseCount': apologizeCourseCount,
      'apologizeSemesterCount': apologizeSemesterCount,
      'birthDate': birthDate,
      'bisectPeriod': bisectPeriod,
      'blockingQuestionnaireType': blockingQuestionnaireType,
      'bloodType': bloodType,
      'campusName': campusName,
      'campusNo': campusNo,
      'capatchAttempts': capatchAttempts,
      'capatchaStatus': capatchaStatus,
      'capatchaValidate': capatchaValidate,
      'category': category,
      'contextRoot': contextRoot,
      'continuesStudent': continuesStudent,
      'currentSemester': currentSemester,
      'currentSemesterDesc': currentSemesterDesc,
      'dataSource': dataSource,
      'deanDuty': deanDuty,
      'degreeCode': degreeCode,
      'degreeCodeDesc': degreeCodeDesc,
      'deptId': deptId,
      'deptName': deptName,
      'direction': direction,
      'divContentOfPage': divContentOfPage,
      'divMessage': divMessage,
      'divMessageClass': divMessageClass,
      'dutyCode': dutyCode,
      'dutyJudgementFlag': dutyJudgementFlag,
      'dutyJudgementReward': dutyJudgementReward,
      'dutyJudgementRewardMagazine': dutyJudgementRewardMagazine,
      'dutyPromotionStaff': dutyPromotionStaff,
      'dutyPromotionStaffApproval': dutyPromotionStaffApproval,
      'dynamicDataSource': dynamicDataSource,
      'eliStudent': eliStudent,
      'email': email,
      'empDesc': empDesc,
      'empDescId': empDescId,
      'empId': empId,
      'enableFilter': enableFilter,
      'enableIban': enableIban,
      'enabled': enabled,
      'endOvertimePayments': endOvertimePayments,
      'enteredPageNo': enteredPageNo,
      'enteredServiceId': enteredServiceId,
      'entesabStudy': entesabStudy,
      'exceptionStd': exceptionStd,
      'expGradMsg': expGradMsg,
      'expectedGraduated': expectedGraduated,
      'facultyId': facultyId,
      'facultyName': facultyName,
      'feesLawId': feesLawId,
      'financialValid': financialValid,
      'formCode': formCode,
      'gender': gender,
      'genderDes': genderDes,
      'graduated': graduated,
      'graduationQuestionnaire': graduationQuestionnaire,
      'haltKey': haltKey,
      'halted': halted,
      'haltedFinancial': haltedFinancial,
      'hasAcadimmicLevel': hasAcadimmicLevel,
      'hasAcadimmicLevelWithRector': hasAcadimmicLevelWithRector,
      'hasAreaDuty': hasAreaDuty,
      'hasCalcExceptionStdReq': hasCalcExceptionStdReq,
      'hasContractorDuty': hasContractorDuty,
      'hasDuty': hasDuty,
      'hasExpensesSonDuty': hasExpensesSonDuty,
      'hasExtraChance': hasExtraChance,
      'hasFaculityStudyDuty': hasFaculityStudyDuty,
      'hasImage': hasImage,
      'hasKsaStaffDuty': hasKsaStaffDuty,
      'hasOvertimePayments': hasOvertimePayments,
      'hasOvertimePaymentsRequest': hasOvertimePaymentsRequest,
      'hasPurchaseDuty': hasPurchaseDuty,
      'hasReportsDuty': hasReportsDuty,
      'hasResidenceDuty': hasResidenceDuty,
      'hasScientificExcellenceReward': hasScientificExcellenceReward,
      'hasSectionDuty': hasSectionDuty,
      'hasSuggestionDuty': hasSuggestionDuty,
      'hasTravelOrderSaudi': hasTravelOrderSaudi,
      'hasUnvMgrDuty': hasUnvMgrDuty,
      'headDepartDuty': headDepartDuty,
      'hightStudyAdvisor': hightStudyAdvisor,
      'higtExpectGraduate': higtExpectGraduate,
      'hireCode': hireCode,
      'iamLogin': iamLogin,
      'imgLang': imgLang,
      'instructorHasNonHome': instructorHasNonHome,
      'instructorNameS': instructorNameS,
      'invalidCapatch': invalidCapatch,
      'invalidLogin': invalidLogin,
      'isAdvisor': isAdvisor,
      'isAlarm': isAlarm,
      'isChangePassword': isChangePassword,
      'isEmployee': isEmployee,
      'isEmployeeDes': isEmployeeDes,
      'isExpGrad': isExpGrad,
      'isGivingDegree': isGivingDegree,
      'isLoggedIn': isLoggedIn,
      'isProctor': isProctor,
      'isRegValid': isRegValid,
      'isRegValid2': isRegValid2,
      'isSupervisor': isSupervisor,
      'job': job,
      'joinSemester': joinSemester,
      'joinSemesterDesc': joinSemesterDesc,
      'langBool': langBool,
      'langId': langId,
      'langStr': langStr,
      'lastFailLoginDate': lastFailLoginDate,
      'lastLoginDate': lastLoginDate,
      'loginAttempts': loginAttempts,
      'loginLDAP': loginLDAP,
      'loginMessageFirstShow': loginMessageFirstShow,
      'loginType': loginType,
      'majorId': majorId,
      'majorName': majorName,
      'mandatoryEveluation': mandatoryEveluation,
      'mandatoryUpdateStaffInfoStatus': mandatoryUpdateStaffInfoStatus,
      'maritalStatus': maritalStatus,
      'maritalStatusDes': maritalStatusDes,
      'markEntry': markEntry,
      'marksSemester': marksSemester,
      'marksSemesterDesc': marksSemesterDesc,
      'minPreparatoryGpa': minPreparatoryGpa,
      'mobile': mobile,
      'nationalId': nationalId,
      'nationality': nationality,
      'nationalityCode': nationalityCode,
      'nationalityType': nationalityType,
      'newImageName': newImageName,
      'newStudent': newStudent,
      'nextSemester': nextSemester,
      'nextSemesterDesc': nextSemesterDesc,
      'numOfAdvisorMsgsReq': numOfAdvisorMsgsReq,
      'numOfRegistryExcesses': numOfRegistryExcesses,
      'password': password,
      'planEdition': planEdition,
      'planRemainHrs': planRemainHrs,
      'planTakenHrs': planTakenHrs,
      'planTotalHrs': planTotalHrs,
      'planType3': planType3,
      'planeType': planeType,
      'postLevelStudy': postLevelStudy,
      'postponementSemesterCount': postponementSemesterCount,
      'preparatoryGPA': preparatoryGPA,
      'preparatoryPlaneType': preparatoryPlaneType,
      'printSemesterDesc': printSemesterDesc,
      'probationCount': probationCount,
      'probationMsg': probationMsg,
      'profileImageName': profileImageName,
      'prvSemester': prvSemester,
      'prvSemesterDesc': prvSemesterDesc,
      'questionnaire': questionnaire,
      'rank': rank,
      'rankCode': rankCode,
      'receiveMassege': receiveMassege,
      'regAddCoursesPeriod': regAddCoursesPeriod,
      'regCampusName': regCampusName,
      'regCampusNo': regCampusNo,
      'regChangeSectionPeriod': regChangeSectionPeriod,
      'regDeleteCoursesPeriod': regDeleteCoursesPeriod,
      'regHrs': regHrs,
      'regSemester': regSemester,
      'regSemesterDesc': regSemesterDesc,
      'reportServer': reportServer,
      'schoolBranch': schoolBranch,
      'selectedAdvisedStudent': selectedAdvisedStudent,
      'serialUpdateEnglishName': serialUpdateEnglishName,
      'sessionId': sessionId,
      'showCASLogin': showCASLogin,
      'showLangLink': showLangLink,
      'showNavHomeTopLink': showNavHomeTopLink,
      'showServices': showServices,
      'signOut': signOut,
      'skin': skin,
      'specificationActive': specificationActive,
      'statusCode': statusCode,
      'statusDesc': statusDesc,
      'stdAccountingConnection': stdAccountingConnection,
      'stdShouldEnterChoicesOrChangeMagor': stdShouldEnterChoicesOrChangeMagor,
      'studentDrInfo': studentDrInfo,
      'studentGPA': studentGPA,
      'studentHoldStatus': studentHoldStatus,
      'studentType': studentType,
      'studentlevel': studentlevel,
      'studyCode': studyCode,
      'studyDesc': studyDesc,
      'studyDescS': studyDescS,
      'studyPeriod': studyPeriod,
      'studyType': studyType,
      'studyTypeDesc': studyTypeDesc,
      'superAdmin': superAdmin,
      'tempRandomNumber': tempRandomNumber,
      'transferCollegeCount': transferCollegeCount,
      'transferCollegeOutCountCount': transferCollegeOutCountCount,
      'transferStudent': transferStudent,
      'transferUniversityCount': transferUniversityCount,
      'uniNo': uniNo,
      'univCode': univCode,
      'univCountry': univCountry,
      'univDesc': univDesc,
      'updateEnglishName': updateEnglishName,
      'uploadStudentImage': uploadStudentImage,
      'userId': userId,
      'userNameWS': userNameWS,
      'username': username,
      'visitorRegCampus': visitorRegCampus,
      'visitorStudent': visitorStudent,
      'visitorsCount': visitorsCount,
      'warningMesage': warningMesage,
      'yearlySemester': yearlySemester,
      'yearlySemesterDesc': yearlySemesterDesc,
    };
  }

  factory SessionInfo.fromMap(Map<String, dynamic> map) {
    return SessionInfo(
      eRegisterUserId: map['ERegisterUserId'] as String,
      ssoLogin: map['SSOLogin'] as bool,
      academicEmail: map['academicEmail'] as String,
      academicMail: map['academicMail'] as String,
      acadimcDetachedMsg: map['acadimcDetachedMsg'] as bool,
      actionRaseBy: map['actionRaseBy'] as int,
      activateWarningMsg: map['activateWarningMsg'] as bool,
      active: map['active'] as bool,
      actorName: map['actorName'] as String,
      actorNameEn: map['actorNameEn'] as String,
      actorType: map['actorType'] as String,
      actorTypeLogin: map['actorTypeLogin'] as String,
      actualWorkDept: map['actualWorkDept'] as String,
      actualWorkDeptDesc: map['actualWorkDeptDesc'] as String,
      advisorName: map['advisorName'] as String,
      affairsQuestionnaire: map['affairsQuestionnaire'] as bool,
      age: map['age'] as String,
      alarmsNumber: map['alarmsNumber'] as String,
      alertQuestionnaireType: map['alertQuestionnaireType'] as bool,
      align: map['align'] as String,
      align2: map['align2'] as String,
      apologizeCourseCount: map['apologizeCourseCount'] as String,
      apologizeSemesterCount: map['apologizeSemesterCount'] as String,
      birthDate: map['birthDate'] as String,
      bisectPeriod: map['bisectPeriod'] as String,
      blockingQuestionnaireType: map['blockingQuestionnaireType'] as bool,
      bloodType: map['bloodType'] as String,
      campusName: map['campusName'] as String,
      campusNo: map['campusNo'] as String,
      capatchAttempts: map['capatchAttempts'] as int,
      capatchaStatus: map['capatchaStatus'] as bool,
      capatchaValidate: map['capatchaValidate'] as bool,
      category: map['category'] as String,
      contextRoot: map['contextRoot'] as String,
      continuesStudent: map['continuesStudent'] as bool,
      currentSemester: map['currentSemester'] as String,
      currentSemesterDesc: map['currentSemesterDesc'] as String,
      dataSource: map['dataSource'] as String,
      deanDuty: map['deanDuty'] as bool,
      degreeCode: map['degreeCode'] as String,
      degreeCodeDesc: map['degreeCodeDesc'] as String,
      deptId: map['deptId'] as String,
      deptName: map['deptName'] as String,
      direction: map['direction'] as String,
      divContentOfPage: map['divContentOfPage'] as String,
      divMessage: map['divMessage'] as String,
      divMessageClass: map['divMessageClass'] as String,
      dutyCode: map['dutyCode'] as String,
      dutyJudgementFlag: map['dutyJudgementFlag'] as bool,
      dutyJudgementReward: map['dutyJudgementReward'] as bool,
      dutyJudgementRewardMagazine: map['dutyJudgementRewardMagazine'] as bool,
      dutyPromotionStaff: map['dutyPromotionStaff'] as bool,
      dutyPromotionStaffApproval: map['dutyPromotionStaffApproval'] as bool,
      dynamicDataSource: map['dynamicDataSource'] as bool,
      eliStudent: map['eliStudent'] as bool,
      email: map['email'] as String,
      empDesc: map['empDesc'] as String,
      empDescId: map['empDescId'] as String,
      empId: map['empId'] as String,
      enableFilter: map['enableFilter'] as bool,
      enableIban: map['enableIban'] as bool,
      enabled: map['enabled'] as bool,
      endOvertimePayments: map['endOvertimePayments'] as bool,
      enteredPageNo: map['enteredPageNo'] as int,
      enteredServiceId: map['enteredServiceId'] as int,
      entesabStudy: map['entesabStudy'] as bool,
      exceptionStd: map['exceptionStd'] as bool,
      expGradMsg: map['expGradMsg'] as String,
      expectedGraduated: map['expectedGraduated'] as bool,
      facultyId: map['facultyId'] as String,
      facultyName: map['facultyName'] as String,
      feesLawId: map['feesLawId'] as String,
      financialValid: map['financialValid'] as bool,
      formCode: map['formCode'] as String,
      gender: map['gender'] as String,
      genderDes: map['genderDes'] as String,
      graduated: map['graduated'] as bool,
      graduationQuestionnaire: map['graduationQuestionnaire'] as bool,
      haltKey: map['haltKey'] as String,
      halted: map['halted'] as bool,
      haltedFinancial: map['haltedFinancial'] as bool,
      hasAcadimmicLevel: map['hasAcadimmicLevel'] as bool,
      hasAcadimmicLevelWithRector: map['hasAcadimmicLevelWithRector'] as bool,
      hasAreaDuty: map['hasAreaDuty'] as bool,
      hasCalcExceptionStdReq: map['hasCalcExceptionStdReq'] as bool,
      hasContractorDuty: map['hasContractorDuty'] as bool,
      hasDuty: map['hasDuty'] as bool,
      hasExpensesSonDuty: map['hasExpensesSonDuty'] as bool,
      hasExtraChance: map['hasExtraChance'] as bool,
      hasFaculityStudyDuty: map['hasFaculityStudyDuty'] as bool,
      hasImage: map['hasImage'] as bool,
      hasKsaStaffDuty: map['hasKsaStaffDuty'] as bool,
      hasOvertimePayments: map['hasOvertimePayments'] as bool,
      hasOvertimePaymentsRequest: map['hasOvertimePaymentsRequest'] as bool,
      hasPurchaseDuty: map['hasPurchaseDuty'] as bool,
      hasReportsDuty: map['hasReportsDuty'] as bool,
      hasResidenceDuty: map['hasResidenceDuty'] as bool,
      hasScientificExcellenceReward:
          map['hasScientificExcellenceReward'] as bool,
      hasSectionDuty: map['hasSectionDuty'] as bool,
      hasSuggestionDuty: map['hasSuggestionDuty'] as bool,
      hasTravelOrderSaudi: map['hasTravelOrderSaudi'] as bool,
      hasUnvMgrDuty: map['hasUnvMgrDuty'] as bool,
      headDepartDuty: map['headDepartDuty'] as bool,
      hightStudyAdvisor: map['hightStudyAdvisor'] as bool,
      higtExpectGraduate: map['higtExpectGraduate'] as bool,
      hireCode: map['hireCode'] as String,
      iamLogin: map['iamLogin'] as bool,
      imgLang: map['imgLang'] as String,
      instructorHasNonHome: map['instructorHasNonHome'] as bool,
      instructorNameS: map['instructor_Name_S'] as String,
      invalidCapatch: map['invalidCapatch'] as int,
      invalidLogin: map['invalidLogin'] as int,
      isAdvisor: map['isAdvisor'] as bool,
      isAlarm: map['isAlarm'] as bool,
      isChangePassword: map['isChangePassword'] as bool,
      isEmployee: map['isEmployee'] as bool,
      isEmployeeDes: map['isEmployeeDes'] as String,
      isExpGrad: map['isExpGrad'] as bool,
      isGivingDegree: map['isGivingDegree'] as bool,
      isLoggedIn: map['isLoggedIn'] as bool,
      isProctor: map['isProctor'] as bool,
      isRegValid: map['isRegValid'] as bool,
      isRegValid2: map['isRegValid2'] as bool,
      isSupervisor: map['isSupervisor'] as bool,
      job: map['job'] as String,
      joinSemester: map['joinSemester'] as String,
      joinSemesterDesc: map['joinSemesterDesc'] as String,
      langBool: map['langBool'] as bool,
      langId: map['langId'] as int,
      langStr: map['langStr'] as String,
      lastFailLoginDate: map['lastFailLoginDate'] as String,
      lastLoginDate: map['lastLoginDate'] as String,
      loginAttempts: map['loginAttempts'] as int,
      loginLDAP: map['loginLDAP'] as bool,
      loginMessageFirstShow: map['loginMessageFirstShow'] as String,
      loginType: map['loginType'] as String,
      majorId: map['majorId'] as String,
      majorName: map['majorName'] as String,
      mandatoryEveluation: map['mandatoryEveluation'] as bool,
      mandatoryUpdateStaffInfoStatus:
          map['mandatoryUpdateStaffInfoStatus'] as bool,
      maritalStatus: map['maritalStatus'] as String,
      maritalStatusDes: map['maritalStatusDes'] as String,
      markEntry: map['markEntry'] as bool,
      marksSemester: map['marksSemester'] as String,
      marksSemesterDesc: map['marksSemesterDesc'] as String,
      minPreparatoryGpa: map['minPreparatoryGpa'] as String,
      mobile: map['mobile'] as String,
      nationalId: map['nationalId'] as String,
      nationality: map['nationality'] as String,
      nationalityCode: map['nationalityCode'] as String,
      nationalityType: map['nationalityType'] as String,
      newImageName: map['newImageName'] as String,
      newStudent: map['newStudent'] as bool,
      nextSemester: map['nextSemester'] as String,
      nextSemesterDesc: map['nextSemesterDesc'] as String,
      numOfAdvisorMsgsReq: map['numOfAdvisorMsgsReq'] as String,
      numOfRegistryExcesses: map['numOfRegistryExcesses'] as String,
      password: map['password'] as String,
      planEdition: map['planEdition'] as String,
      planRemainHrs: map['planRemainHrs'] as int,
      planTakenHrs: map['planTakenHrs'] as int,
      planTotalHrs: map['planTotalHrs'] as int,
      planType3: map['planType3'] as bool,
      planeType: map['planeType'] as String,
      postLevelStudy: map['postLevelStudy'] as bool,
      postponementSemesterCount: map['postponementSemesterCount'] as String,
      preparatoryGPA: map['preparatoryGPA'] as String,
      preparatoryPlaneType: map['preparatoryPlaneType'] as bool,
      printSemesterDesc: map['printSemesterDesc'] as String,
      probationCount: map['probationCount'] as String,
      probationMsg: map['probationMsg'] as String,
      profileImageName: map['profileImageName'] as String,
      prvSemester: map['prvSemester'] as String,
      prvSemesterDesc: map['prvSemesterDesc'] as String,
      questionnaire: map['questionnaire'] as bool,
      rank: map['rank'] as String,
      rankCode: map['rankCode'] as String,
      receiveMassege: map['receiveMassege'] as bool,
      regAddCoursesPeriod: map['regAddCoursesPeriod'] as bool,
      regCampusName: map['regCampusName'] as String,
      regCampusNo: map['regCampusNo'] as String,
      regChangeSectionPeriod: map['regChangeSectionPeriod'] as bool,
      regDeleteCoursesPeriod: map['regDeleteCoursesPeriod'] as bool,
      regHrs: map['regHrs'] as int,
      regSemester: map['regSemester'] as String,
      regSemesterDesc: map['regSemesterDesc'] as String,
      reportServer: map['reportServer'] as String,
      schoolBranch: map['schoolBranch'] as String,
      selectedAdvisedStudent: map['selectedAdvisedStudent'] as int,
      serialUpdateEnglishName: map['serialUpdateEnglishName'] as String,
      sessionId: map['sessionId'] as String,
      showCASLogin: map['showCASLogin'] as bool,
      showLangLink: map['showLangLink'] as bool,
      showNavHomeTopLink: map['showNavHomeTopLink'] as bool,
      showServices: map['showServices'] as bool,
      signOut: map['signOut'] as bool,
      skin: map['skin'] as String,
      specificationActive: map['specificationActive'] as bool,
      statusCode: map['statusCode'] as String,
      statusDesc: map['statusDesc'] as String,
      stdAccountingConnection: map['stdAccountingConnection'] as String,
      stdShouldEnterChoicesOrChangeMagor:
          map['stdShouldEnterChoicesOrChangeMagor'] as bool,
      studentDrInfo: map['studentDrInfo'] as String,
      studentGPA: map['studentGPA'] as String,
      studentHoldStatus: map['studentHoldStatus'] as String,
      studentType: map['studentType'] as String,
      studentlevel: map['studentlevel'] as String,
      studyCode: map['studyCode'] as String,
      studyDesc: map['studyDesc'] as String,
      studyDescS: map['studyDescS'] as String,
      studyPeriod: map['studyPeriod'] as String,
      studyType: map['studyType'] as String,
      studyTypeDesc: map['studyTypeDesc'] as String,
      superAdmin: map['superAdmin'] as String,
      tempRandomNumber: map['tempRandomNumber'] as String,
      transferCollegeCount: map['transferCollegeCount'] as String,
      transferCollegeOutCountCount:
          map['transferCollegeOutCountCount'] as String,
      transferStudent: map['transferStudent'] as bool,
      transferUniversityCount: map['transferUniversityCount'] as String,
      uniNo: map['uniNo'] as String,
      univCode: map['univCode'] as String,
      univCountry: map['univCountry'] as String,
      univDesc: map['univDesc'] as String,
      updateEnglishName: map['updateEnglishName'] as bool,
      uploadStudentImage: map['uploadStudentImage'] as bool,
      userId: map['userId'] as String,
      userNameWS: map['userNameWS'] as String,
      username: map['username'] as String,
      visitorRegCampus: map['visitorRegCampus'] as bool,
      visitorStudent: map['visitorStudent'] as bool,
      visitorsCount: map['visitorsCount'] as String,
      warningMesage: map['warningMesage'] as String,
      yearlySemester: map['yearlySemester'] as String,
      yearlySemesterDesc: map['yearlySemesterDesc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionInfo.fromJson(String source) =>
      SessionInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SessionInfo(eRegisterUserId: $eRegisterUserId, ssoLogin: $ssoLogin, academicEmail: $academicEmail, academicMail: $academicMail, acadimcDetachedMsg: $acadimcDetachedMsg, actionRaseBy: $actionRaseBy, activateWarningMsg: $activateWarningMsg, active: $active, actorName: $actorName, actorNameEn: $actorNameEn, actorType: $actorType, actorTypeLogin: $actorTypeLogin, actualWorkDept: $actualWorkDept, actualWorkDeptDesc: $actualWorkDeptDesc, advisorName: $advisorName, affairsQuestionnaire: $affairsQuestionnaire, age: $age, alarmsNumber: $alarmsNumber, alertQuestionnaireType: $alertQuestionnaireType, align: $align, align2: $align2, apologizeCourseCount: $apologizeCourseCount, apologizeSemesterCount: $apologizeSemesterCount, birthDate: $birthDate, bisectPeriod: $bisectPeriod, blockingQuestionnaireType: $blockingQuestionnaireType, bloodType: $bloodType, campusName: $campusName, campusNo: $campusNo, capatchAttempts: $capatchAttempts, capatchaStatus: $capatchaStatus, capatchaValidate: $capatchaValidate, category: $category, contextRoot: $contextRoot, continuesStudent: $continuesStudent, currentSemester: $currentSemester, currentSemesterDesc: $currentSemesterDesc, dataSource: $dataSource, deanDuty: $deanDuty, degreeCode: $degreeCode, degreeCodeDesc: $degreeCodeDesc, deptId: $deptId, deptName: $deptName, direction: $direction, divContentOfPage: $divContentOfPage, divMessage: $divMessage, divMessageClass: $divMessageClass, dutyCode: $dutyCode, dutyJudgementFlag: $dutyJudgementFlag, dutyJudgementReward: $dutyJudgementReward, dutyJudgementRewardMagazine: $dutyJudgementRewardMagazine, dutyPromotionStaff: $dutyPromotionStaff, dutyPromotionStaffApproval: $dutyPromotionStaffApproval, dynamicDataSource: $dynamicDataSource, eliStudent: $eliStudent, email: $email, empDesc: $empDesc, empDescId: $empDescId, empId: $empId, enableFilter: $enableFilter, enableIban: $enableIban, enabled: $enabled, endOvertimePayments: $endOvertimePayments, enteredPageNo: $enteredPageNo, enteredServiceId: $enteredServiceId, entesabStudy: $entesabStudy, exceptionStd: $exceptionStd, expGradMsg: $expGradMsg, expectedGraduated: $expectedGraduated, facultyId: $facultyId, facultyName: $facultyName, feesLawId: $feesLawId, financialValid: $financialValid, formCode: $formCode, gender: $gender, genderDes: $genderDes, graduated: $graduated, graduationQuestionnaire: $graduationQuestionnaire, haltKey: $haltKey, halted: $halted, haltedFinancial: $haltedFinancial, hasAcadimmicLevel: $hasAcadimmicLevel, hasAcadimmicLevelWithRector: $hasAcadimmicLevelWithRector, hasAreaDuty: $hasAreaDuty, hasCalcExceptionStdReq: $hasCalcExceptionStdReq, hasContractorDuty: $hasContractorDuty, hasDuty: $hasDuty, hasExpensesSonDuty: $hasExpensesSonDuty, hasExtraChance: $hasExtraChance, hasFaculityStudyDuty: $hasFaculityStudyDuty, hasImage: $hasImage, hasKsaStaffDuty: $hasKsaStaffDuty, hasOvertimePayments: $hasOvertimePayments, hasOvertimePaymentsRequest: $hasOvertimePaymentsRequest, hasPurchaseDuty: $hasPurchaseDuty, hasReportsDuty: $hasReportsDuty, hasResidenceDuty: $hasResidenceDuty, hasScientificExcellenceReward: $hasScientificExcellenceReward, hasSectionDuty: $hasSectionDuty, hasSuggestionDuty: $hasSuggestionDuty, hasTravelOrderSaudi: $hasTravelOrderSaudi, hasUnvMgrDuty: $hasUnvMgrDuty, headDepartDuty: $headDepartDuty, hightStudyAdvisor: $hightStudyAdvisor, higtExpectGraduate: $higtExpectGraduate, hireCode: $hireCode, iamLogin: $iamLogin, imgLang: $imgLang, instructorHasNonHome: $instructorHasNonHome, instructorNameS: $instructorNameS, invalidCapatch: $invalidCapatch, invalidLogin: $invalidLogin, isAdvisor: $isAdvisor, isAlarm: $isAlarm, isChangePassword: $isChangePassword, isEmployee: $isEmployee, isEmployeeDes: $isEmployeeDes, isExpGrad: $isExpGrad, isGivingDegree: $isGivingDegree, isLoggedIn: $isLoggedIn, isProctor: $isProctor, isRegValid: $isRegValid, isRegValid2: $isRegValid2, isSupervisor: $isSupervisor, job: $job, joinSemester: $joinSemester, joinSemesterDesc: $joinSemesterDesc, langBool: $langBool, langId: $langId, langStr: $langStr, lastFailLoginDate: $lastFailLoginDate, lastLoginDate: $lastLoginDate, loginAttempts: $loginAttempts, loginLDAP: $loginLDAP, loginMessageFirstShow: $loginMessageFirstShow, loginType: $loginType, majorId: $majorId, majorName: $majorName, mandatoryEveluation: $mandatoryEveluation, mandatoryUpdateStaffInfoStatus: $mandatoryUpdateStaffInfoStatus, maritalStatus: $maritalStatus, maritalStatusDes: $maritalStatusDes, markEntry: $markEntry, marksSemester: $marksSemester, marksSemesterDesc: $marksSemesterDesc, minPreparatoryGpa: $minPreparatoryGpa, mobile: $mobile, nationalId: $nationalId, nationality: $nationality, nationalityCode: $nationalityCode, nationalityType: $nationalityType, newImageName: $newImageName, newStudent: $newStudent, nextSemester: $nextSemester, nextSemesterDesc: $nextSemesterDesc, numOfAdvisorMsgsReq: $numOfAdvisorMsgsReq, numOfRegistryExcesses: $numOfRegistryExcesses, password: $password, planEdition: $planEdition, planRemainHrs: $planRemainHrs, planTakenHrs: $planTakenHrs, planTotalHrs: $planTotalHrs, planType3: $planType3, planeType: $planeType, postLevelStudy: $postLevelStudy, postponementSemesterCount: $postponementSemesterCount, preparatoryGPA: $preparatoryGPA, preparatoryPlaneType: $preparatoryPlaneType, printSemesterDesc: $printSemesterDesc, probationCount: $probationCount, probationMsg: $probationMsg, profileImageName: $profileImageName, prvSemester: $prvSemester, prvSemesterDesc: $prvSemesterDesc, questionnaire: $questionnaire, rank: $rank, rankCode: $rankCode, receiveMassege: $receiveMassege, regAddCoursesPeriod: $regAddCoursesPeriod, regCampusName: $regCampusName, regCampusNo: $regCampusNo, regChangeSectionPeriod: $regChangeSectionPeriod, regDeleteCoursesPeriod: $regDeleteCoursesPeriod, regHrs: $regHrs, regSemester: $regSemester, regSemesterDesc: $regSemesterDesc, reportServer: $reportServer, schoolBranch: $schoolBranch, selectedAdvisedStudent: $selectedAdvisedStudent, serialUpdateEnglishName: $serialUpdateEnglishName, sessionId: $sessionId, showCASLogin: $showCASLogin, showLangLink: $showLangLink, showNavHomeTopLink: $showNavHomeTopLink, showServices: $showServices, signOut: $signOut, skin: $skin, specificationActive: $specificationActive, statusCode: $statusCode, statusDesc: $statusDesc, stdAccountingConnection: $stdAccountingConnection, stdShouldEnterChoicesOrChangeMagor: $stdShouldEnterChoicesOrChangeMagor, studentDrInfo: $studentDrInfo, studentGPA: $studentGPA, studentHoldStatus: $studentHoldStatus, studentType: $studentType, studentlevel: $studentlevel, studyCode: $studyCode, studyDesc: $studyDesc, studyDescS: $studyDescS, studyPeriod: $studyPeriod, studyType: $studyType, studyTypeDesc: $studyTypeDesc, superAdmin: $superAdmin, tempRandomNumber: $tempRandomNumber, transferCollegeCount: $transferCollegeCount, transferCollegeOutCountCount: $transferCollegeOutCountCount, transferStudent: $transferStudent, transferUniversityCount: $transferUniversityCount, uniNo: $uniNo, univCode: $univCode, univCountry: $univCountry, univDesc: $univDesc, updateEnglishName: $updateEnglishName, uploadStudentImage: $uploadStudentImage, userId: $userId, userNameWS: $userNameWS, username: $username, visitorRegCampus: $visitorRegCampus, visitorStudent: $visitorStudent, visitorsCount: $visitorsCount, warningMesage: $warningMesage, yearlySemester: $yearlySemester, yearlySemesterDesc: $yearlySemesterDesc)';
  }

  @override
  bool operator ==(covariant SessionInfo other) {
    if (identical(this, other)) return true;

    return other.eRegisterUserId == eRegisterUserId &&
        other.ssoLogin == ssoLogin &&
        other.academicEmail == academicEmail &&
        other.academicMail == academicMail &&
        other.acadimcDetachedMsg == acadimcDetachedMsg &&
        other.actionRaseBy == actionRaseBy &&
        other.activateWarningMsg == activateWarningMsg &&
        other.active == active &&
        other.actorName == actorName &&
        other.actorNameEn == actorNameEn &&
        other.actorType == actorType &&
        other.actorTypeLogin == actorTypeLogin &&
        other.actualWorkDept == actualWorkDept &&
        other.actualWorkDeptDesc == actualWorkDeptDesc &&
        other.advisorName == advisorName &&
        other.affairsQuestionnaire == affairsQuestionnaire &&
        other.age == age &&
        other.alarmsNumber == alarmsNumber &&
        other.alertQuestionnaireType == alertQuestionnaireType &&
        other.align == align &&
        other.align2 == align2 &&
        other.apologizeCourseCount == apologizeCourseCount &&
        other.apologizeSemesterCount == apologizeSemesterCount &&
        other.birthDate == birthDate &&
        other.bisectPeriod == bisectPeriod &&
        other.blockingQuestionnaireType == blockingQuestionnaireType &&
        other.bloodType == bloodType &&
        other.campusName == campusName &&
        other.campusNo == campusNo &&
        other.capatchAttempts == capatchAttempts &&
        other.capatchaStatus == capatchaStatus &&
        other.capatchaValidate == capatchaValidate &&
        other.category == category &&
        other.contextRoot == contextRoot &&
        other.continuesStudent == continuesStudent &&
        other.currentSemester == currentSemester &&
        other.currentSemesterDesc == currentSemesterDesc &&
        other.dataSource == dataSource &&
        other.deanDuty == deanDuty &&
        other.degreeCode == degreeCode &&
        other.degreeCodeDesc == degreeCodeDesc &&
        other.deptId == deptId &&
        other.deptName == deptName &&
        other.direction == direction &&
        other.divContentOfPage == divContentOfPage &&
        other.divMessage == divMessage &&
        other.divMessageClass == divMessageClass &&
        other.dutyCode == dutyCode &&
        other.dutyJudgementFlag == dutyJudgementFlag &&
        other.dutyJudgementReward == dutyJudgementReward &&
        other.dutyJudgementRewardMagazine == dutyJudgementRewardMagazine &&
        other.dutyPromotionStaff == dutyPromotionStaff &&
        other.dutyPromotionStaffApproval == dutyPromotionStaffApproval &&
        other.dynamicDataSource == dynamicDataSource &&
        other.eliStudent == eliStudent &&
        other.email == email &&
        other.empDesc == empDesc &&
        other.empDescId == empDescId &&
        other.empId == empId &&
        other.enableFilter == enableFilter &&
        other.enableIban == enableIban &&
        other.enabled == enabled &&
        other.endOvertimePayments == endOvertimePayments &&
        other.enteredPageNo == enteredPageNo &&
        other.enteredServiceId == enteredServiceId &&
        other.entesabStudy == entesabStudy &&
        other.exceptionStd == exceptionStd &&
        other.expGradMsg == expGradMsg &&
        other.expectedGraduated == expectedGraduated &&
        other.facultyId == facultyId &&
        other.facultyName == facultyName &&
        other.feesLawId == feesLawId &&
        other.financialValid == financialValid &&
        other.formCode == formCode &&
        other.gender == gender &&
        other.genderDes == genderDes &&
        other.graduated == graduated &&
        other.graduationQuestionnaire == graduationQuestionnaire &&
        other.haltKey == haltKey &&
        other.halted == halted &&
        other.haltedFinancial == haltedFinancial &&
        other.hasAcadimmicLevel == hasAcadimmicLevel &&
        other.hasAcadimmicLevelWithRector == hasAcadimmicLevelWithRector &&
        other.hasAreaDuty == hasAreaDuty &&
        other.hasCalcExceptionStdReq == hasCalcExceptionStdReq &&
        other.hasContractorDuty == hasContractorDuty &&
        other.hasDuty == hasDuty &&
        other.hasExpensesSonDuty == hasExpensesSonDuty &&
        other.hasExtraChance == hasExtraChance &&
        other.hasFaculityStudyDuty == hasFaculityStudyDuty &&
        other.hasImage == hasImage &&
        other.hasKsaStaffDuty == hasKsaStaffDuty &&
        other.hasOvertimePayments == hasOvertimePayments &&
        other.hasOvertimePaymentsRequest == hasOvertimePaymentsRequest &&
        other.hasPurchaseDuty == hasPurchaseDuty &&
        other.hasReportsDuty == hasReportsDuty &&
        other.hasResidenceDuty == hasResidenceDuty &&
        other.hasScientificExcellenceReward == hasScientificExcellenceReward &&
        other.hasSectionDuty == hasSectionDuty &&
        other.hasSuggestionDuty == hasSuggestionDuty &&
        other.hasTravelOrderSaudi == hasTravelOrderSaudi &&
        other.hasUnvMgrDuty == hasUnvMgrDuty &&
        other.headDepartDuty == headDepartDuty &&
        other.hightStudyAdvisor == hightStudyAdvisor &&
        other.higtExpectGraduate == higtExpectGraduate &&
        other.hireCode == hireCode &&
        other.iamLogin == iamLogin &&
        other.imgLang == imgLang &&
        other.instructorHasNonHome == instructorHasNonHome &&
        other.instructorNameS == instructorNameS &&
        other.invalidCapatch == invalidCapatch &&
        other.invalidLogin == invalidLogin &&
        other.isAdvisor == isAdvisor &&
        other.isAlarm == isAlarm &&
        other.isChangePassword == isChangePassword &&
        other.isEmployee == isEmployee &&
        other.isEmployeeDes == isEmployeeDes &&
        other.isExpGrad == isExpGrad &&
        other.isGivingDegree == isGivingDegree &&
        other.isLoggedIn == isLoggedIn &&
        other.isProctor == isProctor &&
        other.isRegValid == isRegValid &&
        other.isRegValid2 == isRegValid2 &&
        other.isSupervisor == isSupervisor &&
        other.job == job &&
        other.joinSemester == joinSemester &&
        other.joinSemesterDesc == joinSemesterDesc &&
        other.langBool == langBool &&
        other.langId == langId &&
        other.langStr == langStr &&
        other.lastFailLoginDate == lastFailLoginDate &&
        other.lastLoginDate == lastLoginDate &&
        other.loginAttempts == loginAttempts &&
        other.loginLDAP == loginLDAP &&
        other.loginMessageFirstShow == loginMessageFirstShow &&
        other.loginType == loginType &&
        other.majorId == majorId &&
        other.majorName == majorName &&
        other.mandatoryEveluation == mandatoryEveluation &&
        other.mandatoryUpdateStaffInfoStatus ==
            mandatoryUpdateStaffInfoStatus &&
        other.maritalStatus == maritalStatus &&
        other.maritalStatusDes == maritalStatusDes &&
        other.markEntry == markEntry &&
        other.marksSemester == marksSemester &&
        other.marksSemesterDesc == marksSemesterDesc &&
        other.minPreparatoryGpa == minPreparatoryGpa &&
        other.mobile == mobile &&
        other.nationalId == nationalId &&
        other.nationality == nationality &&
        other.nationalityCode == nationalityCode &&
        other.nationalityType == nationalityType &&
        other.newImageName == newImageName &&
        other.newStudent == newStudent &&
        other.nextSemester == nextSemester &&
        other.nextSemesterDesc == nextSemesterDesc &&
        other.numOfAdvisorMsgsReq == numOfAdvisorMsgsReq &&
        other.numOfRegistryExcesses == numOfRegistryExcesses &&
        other.password == password &&
        other.planEdition == planEdition &&
        other.planRemainHrs == planRemainHrs &&
        other.planTakenHrs == planTakenHrs &&
        other.planTotalHrs == planTotalHrs &&
        other.planType3 == planType3 &&
        other.planeType == planeType &&
        other.postLevelStudy == postLevelStudy &&
        other.postponementSemesterCount == postponementSemesterCount &&
        other.preparatoryGPA == preparatoryGPA &&
        other.preparatoryPlaneType == preparatoryPlaneType &&
        other.printSemesterDesc == printSemesterDesc &&
        other.probationCount == probationCount &&
        other.probationMsg == probationMsg &&
        other.profileImageName == profileImageName &&
        other.prvSemester == prvSemester &&
        other.prvSemesterDesc == prvSemesterDesc &&
        other.questionnaire == questionnaire &&
        other.rank == rank &&
        other.rankCode == rankCode &&
        other.receiveMassege == receiveMassege &&
        other.regAddCoursesPeriod == regAddCoursesPeriod &&
        other.regCampusName == regCampusName &&
        other.regCampusNo == regCampusNo &&
        other.regChangeSectionPeriod == regChangeSectionPeriod &&
        other.regDeleteCoursesPeriod == regDeleteCoursesPeriod &&
        other.regHrs == regHrs &&
        other.regSemester == regSemester &&
        other.regSemesterDesc == regSemesterDesc &&
        other.reportServer == reportServer &&
        other.schoolBranch == schoolBranch &&
        other.selectedAdvisedStudent == selectedAdvisedStudent &&
        other.serialUpdateEnglishName == serialUpdateEnglishName &&
        other.sessionId == sessionId &&
        other.showCASLogin == showCASLogin &&
        other.showLangLink == showLangLink &&
        other.showNavHomeTopLink == showNavHomeTopLink &&
        other.showServices == showServices &&
        other.signOut == signOut &&
        other.skin == skin &&
        other.specificationActive == specificationActive &&
        other.statusCode == statusCode &&
        other.statusDesc == statusDesc &&
        other.stdAccountingConnection == stdAccountingConnection &&
        other.stdShouldEnterChoicesOrChangeMagor ==
            stdShouldEnterChoicesOrChangeMagor &&
        other.studentDrInfo == studentDrInfo &&
        other.studentGPA == studentGPA &&
        other.studentHoldStatus == studentHoldStatus &&
        other.studentType == studentType &&
        other.studentlevel == studentlevel &&
        other.studyCode == studyCode &&
        other.studyDesc == studyDesc &&
        other.studyDescS == studyDescS &&
        other.studyPeriod == studyPeriod &&
        other.studyType == studyType &&
        other.studyTypeDesc == studyTypeDesc &&
        other.superAdmin == superAdmin &&
        other.tempRandomNumber == tempRandomNumber &&
        other.transferCollegeCount == transferCollegeCount &&
        other.transferCollegeOutCountCount == transferCollegeOutCountCount &&
        other.transferStudent == transferStudent &&
        other.transferUniversityCount == transferUniversityCount &&
        other.uniNo == uniNo &&
        other.univCode == univCode &&
        other.univCountry == univCountry &&
        other.univDesc == univDesc &&
        other.updateEnglishName == updateEnglishName &&
        other.uploadStudentImage == uploadStudentImage &&
        other.userId == userId &&
        other.userNameWS == userNameWS &&
        other.username == username &&
        other.visitorRegCampus == visitorRegCampus &&
        other.visitorStudent == visitorStudent &&
        other.visitorsCount == visitorsCount &&
        other.warningMesage == warningMesage &&
        other.yearlySemester == yearlySemester &&
        other.yearlySemesterDesc == yearlySemesterDesc;
  }

  @override
  int get hashCode {
    return eRegisterUserId.hashCode ^
        ssoLogin.hashCode ^
        academicEmail.hashCode ^
        academicMail.hashCode ^
        acadimcDetachedMsg.hashCode ^
        actionRaseBy.hashCode ^
        activateWarningMsg.hashCode ^
        active.hashCode ^
        actorName.hashCode ^
        actorNameEn.hashCode ^
        actorType.hashCode ^
        actorTypeLogin.hashCode ^
        actualWorkDept.hashCode ^
        actualWorkDeptDesc.hashCode ^
        advisorName.hashCode ^
        affairsQuestionnaire.hashCode ^
        age.hashCode ^
        alarmsNumber.hashCode ^
        alertQuestionnaireType.hashCode ^
        align.hashCode ^
        align2.hashCode ^
        apologizeCourseCount.hashCode ^
        apologizeSemesterCount.hashCode ^
        birthDate.hashCode ^
        bisectPeriod.hashCode ^
        blockingQuestionnaireType.hashCode ^
        bloodType.hashCode ^
        campusName.hashCode ^
        campusNo.hashCode ^
        capatchAttempts.hashCode ^
        capatchaStatus.hashCode ^
        capatchaValidate.hashCode ^
        category.hashCode ^
        contextRoot.hashCode ^
        continuesStudent.hashCode ^
        currentSemester.hashCode ^
        currentSemesterDesc.hashCode ^
        dataSource.hashCode ^
        deanDuty.hashCode ^
        degreeCode.hashCode ^
        degreeCodeDesc.hashCode ^
        deptId.hashCode ^
        deptName.hashCode ^
        direction.hashCode ^
        divContentOfPage.hashCode ^
        divMessage.hashCode ^
        divMessageClass.hashCode ^
        dutyCode.hashCode ^
        dutyJudgementFlag.hashCode ^
        dutyJudgementReward.hashCode ^
        dutyJudgementRewardMagazine.hashCode ^
        dutyPromotionStaff.hashCode ^
        dutyPromotionStaffApproval.hashCode ^
        dynamicDataSource.hashCode ^
        eliStudent.hashCode ^
        email.hashCode ^
        empDesc.hashCode ^
        empDescId.hashCode ^
        empId.hashCode ^
        enableFilter.hashCode ^
        enableIban.hashCode ^
        enabled.hashCode ^
        endOvertimePayments.hashCode ^
        enteredPageNo.hashCode ^
        enteredServiceId.hashCode ^
        entesabStudy.hashCode ^
        exceptionStd.hashCode ^
        expGradMsg.hashCode ^
        expectedGraduated.hashCode ^
        facultyId.hashCode ^
        facultyName.hashCode ^
        feesLawId.hashCode ^
        financialValid.hashCode ^
        formCode.hashCode ^
        gender.hashCode ^
        genderDes.hashCode ^
        graduated.hashCode ^
        graduationQuestionnaire.hashCode ^
        haltKey.hashCode ^
        halted.hashCode ^
        haltedFinancial.hashCode ^
        hasAcadimmicLevel.hashCode ^
        hasAcadimmicLevelWithRector.hashCode ^
        hasAreaDuty.hashCode ^
        hasCalcExceptionStdReq.hashCode ^
        hasContractorDuty.hashCode ^
        hasDuty.hashCode ^
        hasExpensesSonDuty.hashCode ^
        hasExtraChance.hashCode ^
        hasFaculityStudyDuty.hashCode ^
        hasImage.hashCode ^
        hasKsaStaffDuty.hashCode ^
        hasOvertimePayments.hashCode ^
        hasOvertimePaymentsRequest.hashCode ^
        hasPurchaseDuty.hashCode ^
        hasReportsDuty.hashCode ^
        hasResidenceDuty.hashCode ^
        hasScientificExcellenceReward.hashCode ^
        hasSectionDuty.hashCode ^
        hasSuggestionDuty.hashCode ^
        hasTravelOrderSaudi.hashCode ^
        hasUnvMgrDuty.hashCode ^
        headDepartDuty.hashCode ^
        hightStudyAdvisor.hashCode ^
        higtExpectGraduate.hashCode ^
        hireCode.hashCode ^
        iamLogin.hashCode ^
        imgLang.hashCode ^
        instructorHasNonHome.hashCode ^
        instructorNameS.hashCode ^
        invalidCapatch.hashCode ^
        invalidLogin.hashCode ^
        isAdvisor.hashCode ^
        isAlarm.hashCode ^
        isChangePassword.hashCode ^
        isEmployee.hashCode ^
        isEmployeeDes.hashCode ^
        isExpGrad.hashCode ^
        isGivingDegree.hashCode ^
        isLoggedIn.hashCode ^
        isProctor.hashCode ^
        isRegValid.hashCode ^
        isRegValid2.hashCode ^
        isSupervisor.hashCode ^
        job.hashCode ^
        joinSemester.hashCode ^
        joinSemesterDesc.hashCode ^
        langBool.hashCode ^
        langId.hashCode ^
        langStr.hashCode ^
        lastFailLoginDate.hashCode ^
        lastLoginDate.hashCode ^
        loginAttempts.hashCode ^
        loginLDAP.hashCode ^
        loginMessageFirstShow.hashCode ^
        loginType.hashCode ^
        majorId.hashCode ^
        majorName.hashCode ^
        mandatoryEveluation.hashCode ^
        mandatoryUpdateStaffInfoStatus.hashCode ^
        maritalStatus.hashCode ^
        maritalStatusDes.hashCode ^
        markEntry.hashCode ^
        marksSemester.hashCode ^
        marksSemesterDesc.hashCode ^
        minPreparatoryGpa.hashCode ^
        mobile.hashCode ^
        nationalId.hashCode ^
        nationality.hashCode ^
        nationalityCode.hashCode ^
        nationalityType.hashCode ^
        newImageName.hashCode ^
        newStudent.hashCode ^
        nextSemester.hashCode ^
        nextSemesterDesc.hashCode ^
        numOfAdvisorMsgsReq.hashCode ^
        numOfRegistryExcesses.hashCode ^
        password.hashCode ^
        planEdition.hashCode ^
        planRemainHrs.hashCode ^
        planTakenHrs.hashCode ^
        planTotalHrs.hashCode ^
        planType3.hashCode ^
        planeType.hashCode ^
        postLevelStudy.hashCode ^
        postponementSemesterCount.hashCode ^
        preparatoryGPA.hashCode ^
        preparatoryPlaneType.hashCode ^
        printSemesterDesc.hashCode ^
        probationCount.hashCode ^
        probationMsg.hashCode ^
        profileImageName.hashCode ^
        prvSemester.hashCode ^
        prvSemesterDesc.hashCode ^
        questionnaire.hashCode ^
        rank.hashCode ^
        rankCode.hashCode ^
        receiveMassege.hashCode ^
        regAddCoursesPeriod.hashCode ^
        regCampusName.hashCode ^
        regCampusNo.hashCode ^
        regChangeSectionPeriod.hashCode ^
        regDeleteCoursesPeriod.hashCode ^
        regHrs.hashCode ^
        regSemester.hashCode ^
        regSemesterDesc.hashCode ^
        reportServer.hashCode ^
        schoolBranch.hashCode ^
        selectedAdvisedStudent.hashCode ^
        serialUpdateEnglishName.hashCode ^
        sessionId.hashCode ^
        showCASLogin.hashCode ^
        showLangLink.hashCode ^
        showNavHomeTopLink.hashCode ^
        showServices.hashCode ^
        signOut.hashCode ^
        skin.hashCode ^
        specificationActive.hashCode ^
        statusCode.hashCode ^
        statusDesc.hashCode ^
        stdAccountingConnection.hashCode ^
        stdShouldEnterChoicesOrChangeMagor.hashCode ^
        studentDrInfo.hashCode ^
        studentGPA.hashCode ^
        studentHoldStatus.hashCode ^
        studentType.hashCode ^
        studentlevel.hashCode ^
        studyCode.hashCode ^
        studyDesc.hashCode ^
        studyDescS.hashCode ^
        studyPeriod.hashCode ^
        studyType.hashCode ^
        studyTypeDesc.hashCode ^
        superAdmin.hashCode ^
        tempRandomNumber.hashCode ^
        transferCollegeCount.hashCode ^
        transferCollegeOutCountCount.hashCode ^
        transferStudent.hashCode ^
        transferUniversityCount.hashCode ^
        uniNo.hashCode ^
        univCode.hashCode ^
        univCountry.hashCode ^
        univDesc.hashCode ^
        updateEnglishName.hashCode ^
        uploadStudentImage.hashCode ^
        userId.hashCode ^
        userNameWS.hashCode ^
        username.hashCode ^
        visitorRegCampus.hashCode ^
        visitorStudent.hashCode ^
        visitorsCount.hashCode ^
        warningMesage.hashCode ^
        yearlySemester.hashCode ^
        yearlySemesterDesc.hashCode;
  }
}
