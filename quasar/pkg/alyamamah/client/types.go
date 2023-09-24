package client

type LoginRequest struct {
	Username string
	Password string
}

type CommonInfo struct {
	ActorImage    string `json:"actorImage"`
	ActorType     string `json:"actorType"`
	LatestVersion string `json:"latestVersion"`
	Msg           string `json:"msg"`
	Status        bool   `json:"status"`
	UserID        string `json:"userId"`
}

type Semester struct {
	CurrentSemester     string `json:"currentSemester"`
	CurrentSemesterDesc string `json:"currentSemesterDesc"`
	MarkSemester        string `json:"markSemester"`
	MarkSemesterDesc    string `json:"markSemesterDesc"`
	PrevSemester        string `json:"prevSemester"`
	PrevSemesterDesc    string `json:"prevSemesterDesc"`
	RegSemester         string `json:"regSemester"`
	RegSemesterDesc     string `json:"regSemesterDesc"`
	YearSemester        string `json:"yearSemester"`
	YearSemesterDesc    string `json:"yearSemesterDesc"`
}

type Service struct {
	ServiceId string `json:"serviceId"`
	Enabled   string `json:"enabled"`
}

type SessionInfo struct {
	ERegisterID                        string `json:"ERegisterId"`
	SSOLogin                           bool   `json:"SSOLogin"`
	AcademicEmail                      string `json:"academicEmail"`
	AcademicMail                       string `json:"academicMail"`
	AcadimcDetachedMsg                 bool   `json:"acadimcDetachedMsg"`
	ActionRaseBy                       int    `json:"actionRaseBy"`
	ActivateWarningMsg                 bool   `json:"activateWarningMsg"`
	Active                             bool   `json:"active"`
	ActorName                          string `json:"actorName"`
	ActorNameEn                        string `json:"actorNameEn"`
	ActorType                          string `json:"actorType"`
	ActorTypeLogin                     string `json:"actorTypeLogin"`
	ActualWorkDept                     string `json:"actualWorkDept"`
	ActualWorkDeptDesc                 string `json:"actualWorkDeptDesc"`
	AdvisorName                        string `json:"advisorName"`
	AffairsQuestionnaire               bool   `json:"affairsQuestionnaire"`
	Age                                string `json:"age"`
	AlarmsNumber                       string `json:"alarmsNumber"`
	AlertQuestionnaireType             bool   `json:"alertQuestionnaireType"`
	Align                              string `json:"align"`
	Align2                             string `json:"align2"`
	ApologizeCourseCount               string `json:"apologizeCourseCount"`
	ApologizeSemesterCount             string `json:"apologizeSemesterCount"`
	BirthDate                          string `json:"birthDate"`
	BisectPeriod                       string `json:"bisectPeriod"`
	BlockingQuestionnaireType          bool   `json:"blockingQuestionnaireType"`
	BloodType                          string `json:"bloodType"`
	CampusName                         string `json:"campusName"`
	CampusNo                           string `json:"campusNo"`
	CapatchAttempts                    int    `json:"capatchAttempts"`
	CapatchaStatus                     bool   `json:"capatchaStatus"`
	CapatchaValidate                   bool   `json:"capatchaValidate"`
	Category                           string `json:"category"`
	ContextRoot                        string `json:"contextRoot"`
	ContinuesStudent                   bool   `json:"continuesStudent"`
	CurrentSemester                    string `json:"currentSemester"`
	CurrentSemesterDesc                string `json:"currentSemesterDesc"`
	DataSource                         string `json:"dataSource"`
	DeanDuty                           bool   `json:"deanDuty"`
	DegreeCode                         string `json:"degreeCode"`
	DegreeCodeDesc                     string `json:"degreeCodeDesc"`
	DeptId                             string `json:"deptId"`
	DeptName                           string `json:"deptName"`
	Direction                          string `json:"direction"`
	DivContentOfPage                   string `json:"divContentOfPage"`
	DivMessage                         string `json:"divMessage"`
	DivMessageClass                    string `json:"divMessageClass"`
	DutyCode                           string `json:"dutyCode"`
	DutyJudgementFlag                  bool   `json:"dutyJudgementFlag"`
	DutyJudgementReward                bool   `json:"dutyJudgementReward"`
	DutyJudgementRewardMagazine        bool   `json:"dutyJudgementRewardMagazine"`
	DutyPromotionStaff                 bool   `json:"dutyPromotionStaff"`
	DutyPromotionStaffApproval         bool   `json:"dutyPromotionStaffApproval"`
	DynamicDataSource                  bool   `json:"dynamicDataSource"`
	EliStudent                         bool   `json:"eliStudent"`
	Email                              string `json:"email"`
	EmpDesc                            string `json:"empDesc"`
	EmpDescId                          string `json:"empDescId"`
	EmpId                              string `json:"empId"`
	EnableFilter                       bool   `json:"enableFilter"`
	EnableIban                         bool   `json:"enableIban"`
	Enabled                            bool   `json:"enabled"`
	EndOvertimePayments                bool   `json:"endOvertimePayments"`
	EnteredPageNo                      int    `json:"enteredPageNo"`
	EnteredServiceId                   int    `json:"enteredServiceId"`
	EntesabStudy                       bool   `json:"entesabStudy"`
	ExceptionStd                       bool   `json:"exceptionStd"`
	ExpGradMsg                         string `json:"expGradMsg"`
	ExpectedGraduated                  bool   `json:"expectedGraduated"`
	FacultyId                          string `json:"facultyId"`
	FacultyName                        string `json:"facultyName"`
	FeesLawId                          string `json:"feesLawId"`
	FinancialValid                     bool   `json:"financialValid"`
	FormCode                           string `json:"formCode"`
	Gender                             string `json:"gender"`
	GenderDes                          string `json:"genderDes"`
	Graduated                          bool   `json:"graduated"`
	GraduationQuestionnaire            bool   `json:"graduationQuestionnaire"`
	HaltKey                            string `json:"haltKey"`
	Halted                             bool   `json:"halted"`
	HaltedFinancial                    bool   `json:"haltedFinancial"`
	HasAcadimmicLevel                  bool   `json:"hasAcadimmicLevel"`
	HasAcadimmicLevelWithRector        bool   `json:"hasAcadimmicLevelWithRector"`
	HasAreaDuty                        bool   `json:"hasAreaDuty"`
	HasCalcExceptionStdReq             bool   `json:"hasCalcExceptionStdReq"`
	HasContractorDuty                  bool   `json:"hasContractorDuty"`
	HasDuty                            bool   `json:"hasDuty"`
	HasExpensesSonDuty                 bool   `json:"hasExpensesSonDuty"`
	HasExtraChance                     bool   `json:"hasExtraChance"`
	HasFaculityStudyDuty               bool   `json:"hasFaculityStudyDuty"`
	HasImage                           bool   `json:"hasImage"`
	HasKsaStaffDuty                    bool   `json:"hasKsaStaffDuty"`
	HasOvertimePayments                bool   `json:"hasOvertimePayments"`
	HasOvertimePaymentsRequest         bool   `json:"hasOvertimePaymentsRequest"`
	HasPurchaseDuty                    bool   `json:"hasPurchaseDuty"`
	HasReportsDuty                     bool   `json:"hasReportsDuty"`
	HasResidenceDuty                   bool   `json:"hasResidenceDuty"`
	HasScientificExcellenceReward      bool   `json:"hasScientificExcellenceReward"`
	HasSectionDuty                     bool   `json:"hasSectionDuty"`
	HasSuggestionDuty                  bool   `json:"hasSuggestionDuty"`
	HasTravelOrderSaudi                bool   `json:"hasTravelOrderSaudi"`
	HasUnvMgrDuty                      bool   `json:"hasUnvMgrDuty"`
	HeadDepartDuty                     bool   `json:"headDepartDuty"`
	HightStudyAdvisor                  bool   `json:"hightStudyAdvisor"`
	HigtExpectGraduate                 bool   `json:"higtExpectGraduate"`
	HireCode                           string `json:"hireCode"`
	IamLogin                           bool   `json:"iamLogin"`
	ImgLang                            string `json:"imgLang"`
	InstructorHasNonHome               bool   `json:"instructorHasNonHome"`
	InstructorNameS                    string `json:"instructor_Name_S"`
	InvalidCapatch                     int    `json:"invalidCapatch"`
	InvalidLogin                       int    `json:"invalidLogin"`
	IsAdvisor                          bool   `json:"isAdvisor"`
	IsAlarm                            bool   `json:"isAlarm"`
	IsChangePassword                   bool   `json:"isChangePassword"`
	IsEmployee                         bool   `json:"isEmployee"`
	IsEmployeeDes                      string `json:"isEmployeeDes"`
	IsExpGrad                          bool   `json:"isExpGrad"`
	IsGivingDegree                     bool   `json:"isGivingDegree"`
	IsLoggedIn                         bool   `json:"isLoggedIn"`
	IsProctor                          bool   `json:"isProctor"`
	IsRegValid                         bool   `json:"isRegValid"`
	IsRegValid2                        bool   `json:"isRegValid2"`
	IsSupervisor                       bool   `json:"isSupervisor"`
	Job                                string `json:"job"`
	JoinSemester                       string `json:"joinSemester"`
	JoinSemesterDesc                   string `json:"joinSemesterDesc"`
	LangBool                           bool   `json:"langBool"`
	LangId                             int    `json:"langId"`
	LangStr                            string `json:"langStr"`
	LastFailLoginDate                  string `json:"lastFailLoginDate"`
	LastLoginDate                      string `json:"lastLoginDate"`
	LoginAttempts                      int    `json:"loginAttempts"`
	LoginLDAP                          bool   `json:"loginLDAP"`
	LoginMessageFirstShow              string `json:"loginMessageFirstShow"`
	LoginType                          string `json:"loginType"`
	MajorId                            string `json:"majorId"`
	MajorName                          string `json:"majorName"`
	MandatoryEveluation                bool   `json:"mandatoryEveluation"`
	MandatoryUpdateStaffInfoStatus     bool   `json:"mandatoryUpdateStaffInfoStatus"`
	MaritalStatus                      string `json:"maritalStatus"`
	MaritalStatusDes                   string `json:"maritalStatusDes"`
	MarkSemester                       string `json:"markSemester"`
	MarkSemesterDesc                   string `json:"markSemesterDesc"`
	MarksSemester                      string `json:"marksSemester"`
	MarksSemesterDesc                  string `json:"marksSemesterDesc"`
	MinPreparatoryGpa                  string `json:"minPreparatoryGpa"`
	Mobile                             string `json:"mobile"`
	NationalId                         string `json:"nationalId"`
	Nationality                        string `json:"nationality"`
	NationalityCode                    string `json:"nationalityCode"`
	NationalityType                    string `json:"nationalityType"`
	NewImageName                       string `json:"newImageName"`
	NewStudent                         bool   `json:"newStudent"`
	NextSemester                       string `json:"nextSemester"`
	NextSemesterDesc                   string `json:"nextSemesterDesc"`
	NumOfAdvisorMsgsReq                string `json:"numOfAdvisorMsgsReq"`
	NumOfRegistryExcesses              string `json:"numOfRegistryExcesses"`
	Password                           string `json:"password"`
	PlanEdition                        string `json:"planEdition"`
	PlanRemainHrs                      int    `json:"planRemainHrs"`
	PlanTakenHrs                       int    `json:"planTakenHrs"`
	PlanTotalHrs                       int    `json:"planTotalHrs"`
	PlanType3                          bool   `json:"planType3"`
	PlaneType                          string `json:"planeType"`
	PostLevelStudy                     bool   `json:"postLevelStudy"`
	PostponementSemesterCount          string `json:"postponementSemesterCount"`
	PreparatoryGPA                     string `json:"preparatoryGPA"`
	PreparatoryPlaneType               bool   `json:"preparatoryPlaneType"`
	PrintSemesterDesc                  string `json:"printSemesterDesc"`
	ProbationCount                     string `json:"probationCount"`
	ProbationMsg                       string `json:"probationMsg"`
	ProfileImageName                   string `json:"profileImageName"`
	PrvSemester                        string `json:"prvSemester"`
	PrvSemesterDesc                    string `json:"prvSemesterDesc"`
	Questionnaire                      bool   `json:"questionnaire"`
	Rank                               string `json:"rank"`
	RankCode                           string `json:"rankCode"`
	ReceiveMassege                     bool   `json:"receiveMassege"`
	RegAddCoursesPeriod                bool   `json:"regAddCoursesPeriod"`
	RegCampusName                      string `json:"regCampusName"`
	RegCampusNo                        string `json:"regCampusNo"`
	RegChangeSectionPeriod             bool   `json:"regChangeSectionPeriod"`
	RegDeleteCoursesPeriod             bool   `json:"regDeleteCoursesPeriod"`
	RegHrs                             int    `json:"regHrs"`
	RegSemester                        string `json:"regSemester"`
	RegSemesterDesc                    string `json:"regSemesterDesc"`
	ReportServer                       string `json:"reportServer"`
	SchoolBranch                       string `json:"schoolBranch"`
	SelectedAdvisedStudent             int    `json:"selectedAdvisedStudent"`
	SerialUpdateEnglishName            string `json:"serialUpdateEnglishName"`
	SessionId                          string `json:"sessionId"`
	ShowCASLogin                       bool   `json:"showCASLogin"`
	ShowLangLink                       bool   `json:"showLangLink"`
	ShowNavHomeTopLink                 bool   `json:"showNavHomeTopLink"`
	ShowServices                       bool   `json:"showServices"`
	SignOut                            bool   `json:"signOut"`
	Skin                               string `json:"skin"`
	SpecificationActive                bool   `json:"specificationActive"`
	StatusCode                         string `json:"statusCode"`
	StatusDesc                         string `json:"statusDesc"`
	StdAccountingConnection            string `json:"stdAccountingConnection"`
	StdShouldEnterChoicesOrChangeMagor bool   `json:"stdShouldEnterChoicesOrChangeMagor"`
	StudentDrInfo                      string `json:"studentDrInfo"`
	StudentGPA                         string `json:"studentGPA"`
	StudentHoldStatus                  string `json:"studentHoldStatus"`
	StudentType                        string `json:"studentType"`
	StudentLevel                       string `json:"studentlevel"`
	StudyCode                          string `json:"studyCode"`
	StudyDesc                          string `json:"studyDesc"`
	StudyDescS                         string `json:"studyDescS"`
	StudyPeriod                        string `json:"studyPeriod"`
	StudyType                          string `json:"studyType"`
	StudyTypeDesc                      string `json:"studyTypeDesc"`
	SuperAdmin                         string `json:"superAdmin"`
	TempRandomNumber                   string `json:"tempRandomNumber"`
	TransferCollegeCount               string `json:"transferCollegeCount"`
	TransferCollegeOutCountCount       string `json:"transferCollegeOutCountCount"`
	TransferStudent                    bool   `json:"transferStudent"`
	TransferUniversityCount            string `json:"transferUniversityCount"`
	UniNo                              string `json:"uniNo"`
	UnivCode                           string `json:"univCode"`
	UnivCountry                        string `json:"univCountry"`
	UnivDesc                           string `json:"univDesc"`
	UpdateEnglishName                  bool   `json:"updateEnglishName"`
	UploadStudentImage                 bool   `json:"uploadStudentImage"`
	UserId                             string `json:"userId"`
	UserNameWS                         string `json:"userNameWS"`
	Username                           string `json:"username"`
	VisitorRegCampus                   bool   `json:"visitorRegCampus"`
	VisitorStudent                     bool   `json:"visitorStudent"`
	VisitorsCount                      string `json:"visitorsCount"`
	WarningMessage                     string `json:"warningMesage"`
	YearlySemester                     string `json:"yearlySemester"`
	YearlySemesterDesc                 string `json:"yearlySemesterDesc"`
}

type LoginResponse struct {
	CommonInfo  CommonInfo  `json:"commonInfo"`
	Semester    Semester    `json:"semester"`
	Services    []Service   `json:"services"`
	SessionInfo SessionInfo `json:"sessionInfo"`
	PrivacyURL  string      `json:"privacyUrl"`
	SupportURL  string      `json:"supportUrl"`
}

type Client interface {
	Login(r *LoginRequest) (*LoginResponse, error)
}