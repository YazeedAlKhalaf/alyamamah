const finalExamsResponse =
    '''<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">





    
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=11; IE=10; IE=9; IE=8; IE=7; IE=EDGE"/>
    <title>Al-Yamamah Private University :: EduGate
    </title>
    <LINK REL=StyleSheet HREF='/yu/include/css/style.css' TYPE="text/css">
    <script type="text/javascript" src='/yu/include/js/table/table.js'></script>
    <script type="text/javascript" src="/yu/include/js/menu/styleswitcher.js"></script>
    <link href="/yu/include/css/style_en.css" rel="stylesheet"
          type="text/css"/>
    <LINK REL="STYLESHEET"
          HREF="/yu/skins/1/style_en.css"
          TYPE="text/css">
    <link rel="stylesheet" href="/yu/include/primeui/jquery-ui.css"/>
    <link rel="stylesheet"
          href="/yu/skins/1/primeui/theme_en.css"/>
    <link rel="stylesheet" href="/yu/include/primeui/primeui_en.css"/>
    <script type="text/javascript" src="/yu/include/primeui/jquery.js"></script>
    <script type="text/javascript" src="/yu/include/primeui/jquery-ui.js"></script>
    <script type="text/javascript" src="/yu/include/primeui/primeui.js"></script>
    <script type="text/javascript" src="/yu/include/js/common/primeUI-v1.js"></script>
    <script type="text/javascript" src="/yu/include/js/common/validatePrimeUI.js"></script>
    <script language="javascript" type="text/javascript">
        function clearText(field) {
            if (field.defaultValue == field.value) field.value = '';
            else if (field.value == '') field.value = field.defaultValue;
        }
    </script>
</head>
<body dir='LTR'>
<center>
    
                 
 
                 


<div id="dlgPrint" title='&nbsp;Print' style="display:none" >
    <table align="right" cellpadding="0" cellspacing="0">
        <tr><td><a id="printFrameLink" name="printFrameLink" href="" onclick="javascript:printFrame('framePrint');return false;" class="printButton"></a></td></tr>
    </table>
    <iframe id="framePrint" width="1" height="1" frameborder="0"></iframe>
</div>

<div id="dlgPrintPDF" title='&nbsp;Print' style="display:none" >
    <iframe id="framePrintPDF" width="1" height="1" frameborder="0"></iframe>
</div>

<div id="msgBar"  style="display:none">
    <table align="center" width="100%" cellspacing="0" cellpadding="0" border="0">
        <tr><td height="5" ></td></tr>
        <tr>
            <td align="center" class="fontText" ><label id="msgLabel"></label></td>
            <td width="12"></td>
            <td ><div class="pui-growl-image-warn-image"></div></td>
        </tr>
        <tr><td height="5" ></td></tr>
    </table>
</div>      

<div id="msgInfoBar"  style="display:none">
    <table align="center" width="100%" cellspacing="0" cellpadding="0" border="0">
        <tr><td height="5" ></td></tr>
        <tr>
            <td align="center" class="fontText" ><label id="msgInfoLabel"></label></td>
            <td width="12"></td>
            <td ><div class="pui-growl-image-info-image"></div></td>
        </tr>
        <tr><td height="5" ></td></tr>
    </table>
</div>      


<div id="msgDialog"  title="" style="display:none">
    <table align="center" width="100%" cellspacing="0" cellpadding="0" border="0">
        <tr><td height="5" ></td></tr>
        <tr>
            <td align="center" class="fontText" ><label id="msgDialogLabel"></label></td>
            <td width="12"></td>
            <td ><div class="pui-growl-image-warn-image"></div></td>
        </tr>
        <tr><td height="5" ></td></tr>
    </table>
</div>

<div id="doneMsgDialog"  title="" style="display:none">
    <table align="center" width="100%" cellspacing="0" cellpadding="0" border="0">
        <tr><td height="5" ></td></tr>
        <tr>
            <td align="center" class="toolTipText" ><label style="font-color:green" id="doneMsgDialogLabel"></label></td>
            <td width="12"></td>
            <td ><div class="pui-growl-image-done-image"></div></td>
        </tr>
        <tr><td height="5" ></td></tr>
    </table>
</div>


<div id="msgLoadDialog"  title="" style="display:none">
    <table align="center" width="100%" cellspacing="0" cellpadding="0" border="0">
        <tr><td height="5" ></td></tr>
        <tr>
            <td align="center" class="fontText" ><label id="msgLoadDialogLabel"></label></td>
            <td width="12"></td>
            <td ><img src="/yu/images/loading2.gif" style="border-width: 0pt;"  /></td>
        </tr>
        <tr><td height="5" ></td></tr>
    </table>
</div>

<div id="confDialog" title="" class="bottonDlgFix"  style="display: none;">
  <table align="right" width="100%" cellspacing="0" cellpadding="0" border="0">
        <tr><td height="5" ></td></tr>
        <tr>
            <td align="left" ><label id="confMsgLable"></label></td>
        </tr>
        <tr><td height="5" ></td></tr>
    </table>
</div>

<div class="fontText" id="msgGrowl" ></div>
    <div id="container">
        <div id="all">
            <div id="top">
                <div class="logo">&nbsp;</div>
                <div class="links">
                    
<form id="headerForm" name="headerForm" method="post" action="/yu/ui/student/final_exams/index/finalExamsIndex.faces" enctype="application/x-www-form-urlencoded">
<input type="hidden" name="headerForm" value="headerForm" />

                        <ul>
                            <li>
                                
<script type="text/javascript" src="/yu/javax.faces.resource/jsf.js.faces?ln=javax.faces"></script>
<a id="headerForm:signoutLink" href="#" onclick="mojarra.jsfcljs(document.getElementById('headerForm'),{'headerForm:signoutLink':'headerForm:signoutLink'},'');return false">Sign Out</a>
                            </li>
                            <li>
                                <a href="/yu/ui/student/homeIndex.faces">Home Page</a>
                            </li>
                        </ul>
                    <input type="hidden" name="javax.faces.ViewState" id="j_id_id0:javax.faces.ViewState:0" value="423936249064564852:6049645500832811260" autocomplete="off" />
</form>
                </div>
            </div>
        </div>
        
    



<script type="text/javascript" src="/yu/include/js/common/ajaxHome.js"></script>
<script language="javascript" type="text/javascript">
    function ajaxCategoryMenu(id,value){
        if(id.getAttribute("aria-expanded") == 'false'){
            onAjaxHome('studentCategory',value+"");
        }
        else{
            onAjaxHome('studentCategory','-1');
        }
    }
</script>
<script language="javascript" type="text/javascript">
    function openWindow(url) {
        window.open(url, 'mywindow', 'width=800,height=550,resizable=yes,scrollbars=yes');
    }
</script>

<div id="center">
    <div id="data">
        <div id="right">
            <div id="menu">
                <div class="top_menu"><h2>Main Menu</h2></div>
                <div class="all_menu">
                    
<form id="menuForm" name="menuForm" method="post" action="/yu/ui/student/final_exams/index/finalExamsIndex.faces" enctype="application/x-www-form-urlencoded">
<input type="hidden" name="menuForm" value="menuForm" />
<table id="menuForm:menuTable" border="0" cellpadding="0" cellspacing="0" style="display:none;" width="100%">
<tbody>
<tr>
<td><div id="menuForm:menuTable:0:menuDiv"><h3 id='menuDivH3' onclick='javascript:ajaxCategoryMenu(this,0)'><table id="menuForm:menuTable:0:categories" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Academic</td>
</tr>
</tbody>
</table>
</h3><div id="menuForm:menuTable:0:Divs"><table id="menuForm:menuTable:0:services" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td><a id="menuForm:menuTable:0:services:0:urlMenu" name="menuForm:menuTable:0:services:0:urlMenu" href="/yu/ui/student/admission_choices/index/forwardAdmissionChoices.faces">Admission Choices</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:1:urlMenu" name="menuForm:menuTable:0:services:1:urlMenu" href="/yu/ui/student/student_plan/index/forwardAllPlanIndex.faces">Student Plan</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:2:urlMenu" name="menuForm:menuTable:0:services:2:urlMenu" href="/yu/ui/student/courses_results/index/forwardCoursesResults.faces">Courses Results</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:3:urlMenu" name="menuForm:menuTable:0:services:3:urlMenu" href="/yu/ui/student/academic_transactions/index/academicTransactionsIndex.faces">Past Academic Transactions</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:4:urlMenu" name="menuForm:menuTable:0:services:4:urlMenu" href="/yu/ui/student/final_exams/index/finalExamsIndex.faces">Final Exams</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:5:urlMenu" name="menuForm:menuTable:0:services:5:urlMenu" href="/yu/ui/student/student_evaluation/index/forwardTypes.faces">Evaluations</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:6:urlMenu" name="menuForm:menuTable:0:services:6:urlMenu" href="/yu/ui/student/student_transcript/index/studentTranscriptAllIndex.faces">Transcript</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:7:urlMenu" name="menuForm:menuTable:0:services:7:urlMenu" href="/yu/ui/student/student_skills/index/studentSkillsConditionsIndex.faces">Student Skills</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:8:urlMenu" name="menuForm:menuTable:0:services:8:urlMenu" href="/yu/ui/student/student_absences/index/courseAbsencesIndex.faces">Absences</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:9:urlMenu" name="menuForm:menuTable:0:services:9:urlMenu" href="/yu/ui/student/student_plan/index/forwardTakenPlanIndex.faces">Courses Passed</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:10:urlMenu" name="menuForm:menuTable:0:services:10:urlMenu" href="/yu/ui/student/student_plan/index/forwardRemainPlanIndex.faces">Student Remain Courses</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:0:services:11:urlMenu" name="menuForm:menuTable:0:services:11:urlMenu" href="/yu/ui/student/student_punishments/index/studentPunishmentsIndex.faces">Punishments</a></td>
</tr>
<tr>
<td></td>
</tr>
</tbody>
</table>
</div></div></td>
</tr>
<tr>
<td><div id="menuForm:menuTable:1:menuDiv"><h3 id='menuDivH3' onclick='javascript:ajaxCategoryMenu(this,1)'><table id="menuForm:menuTable:1:categories" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reports</td>
</tr>
</tbody>
</table>
</h3><div id="menuForm:menuTable:1:Divs"><table id="menuForm:menuTable:1:services" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td><a id="menuForm:menuTable:1:services:0:urlMenu" name="menuForm:menuTable:1:services:0:urlMenu" href="/yu/ui/student/reports/index/forwardReports.faces">Students Issues and Reports</a></td>
</tr>
<tr>
<td></td>
</tr>
<tr>
<td></td>
</tr>
</tbody>
</table>
</div></div></td>
</tr>
<tr>
<td><div id="menuForm:menuTable:2:menuDiv"><h3 id='menuDivH3' onclick='javascript:ajaxCategoryMenu(this,2)'><table id="menuForm:menuTable:2:categories" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Entry Application</td>
</tr>
</tbody>
</table>
</h3><div id="menuForm:menuTable:2:Divs"><table id="menuForm:menuTable:2:services" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td><a id="menuForm:menuTable:2:services:0:urlMenuPostLevelStudy" name="menuForm:menuTable:2:services:0:urlMenuPostLevelStudy" href="/yu/ui/student/courses_request/index/mainCoursesRequestIndex.faces">Courses Request</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:2:services:1:urlMenu" name="menuForm:menuTable:2:services:1:urlMenu" href="/yu/ui/student/entered_transactions/index/mainEnteredTransactionsIndex.faces">Entered Academic Transactions</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:2:services:2:urlMenu" name="menuForm:menuTable:2:services:2:urlMenu" href="/yu/ui/student/level_exam/index/mainLevelExamIndex.faces">Placement Test</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:2:services:3:urlMenu" name="menuForm:menuTable:2:services:3:urlMenu" href="/yu/ui/student/withdrawal_course/index/mainWithdrawalCourseIndex.faces">Withdrawal on Course</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:2:services:4:urlMenu" name="menuForm:menuTable:2:services:4:urlMenu" href="/yu/ui/student/request_Major_change/index/mainMajorChangeIndex.faces">Request Major Change</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:2:services:5:urlMenu" name="menuForm:menuTable:2:services:5:urlMenu" href="/yu/ui/student/registry_excesses/index/forwardRegistryExcessesIndex.faces">Registry Excesses</a></td>
</tr>
</tbody>
</table>
</div></div></td>
</tr>
<tr>
<td><div id="menuForm:menuTable:3:menuDiv"><h3 id='menuDivH3' onclick='javascript:ajaxCategoryMenu(this,3)'><table id="menuForm:menuTable:3:categories" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Registration</td>
</tr>
</tbody>
</table>
</h3><div id="menuForm:menuTable:3:Divs"><table id="menuForm:menuTable:3:services" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td><a id="menuForm:menuTable:3:services:0:urlMenu" name="menuForm:menuTable:3:services:0:urlMenu" href="/yu/ui/student/student_schedule/index/forwardStudentSchedule.faces">Registered Courses</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:3:services:1:urlMenu" name="menuForm:menuTable:3:services:1:urlMenu" href="/yu/ui/student/offeredCourses/index/offeredCoursesIndex.faces">Offered Courses</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:3:services:2:urlMenu" name="menuForm:menuTable:3:services:2:urlMenu" href="/yu/ui/student/registration/index/forwardMainReg.faces">Drop-Add Courses</a></td>
</tr>
</tbody>
</table>
</div></div></td>
</tr>
<tr>
<td><div id="menuForm:menuTable:4:menuDiv"><h3 id='menuDivH3' onclick='javascript:ajaxCategoryMenu(this,4)'><table id="menuForm:menuTable:4:categories" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Personal</td>
</tr>
</tbody>
</table>
</h3><div id="menuForm:menuTable:4:Divs"><table id="menuForm:menuTable:4:services" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td><a id="menuForm:menuTable:4:services:0:serLinkChgePass1" name="menuForm:menuTable:4:services:0:serLinkChgePass1" href="javascript:openWindow('http://etc.yu.edu.sa/studentmail');">Change Password</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:4:services:1:urlMenu" name="menuForm:menuTable:4:services:1:urlMenu" href="/yu/ui/student/installment/index/forwardInstallmentresult.faces">Installment Request Follow</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:4:services:2:urlMenu" name="menuForm:menuTable:4:services:2:urlMenu" href="/yu/ui/student/student_info/index/studentInfoIndex.faces">Student Information</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:4:services:3:urlMenu" name="menuForm:menuTable:4:services:3:urlMenu" href="/yu/ui/student/sendEmail/index/sendEmailIndex.faces">Send Email</a></td>
</tr>
<tr>
<td><a id="menuForm:menuTable:4:services:4:urlMenuUpdateName" name="menuForm:menuTable:4:services:4:urlMenuUpdateName" href="/yu/ui/student/update_english_name/index/forwardUpdateEnglishName.faces">Update English Name</a></td>
</tr>
<tr>
<td></td>
</tr>
</tbody>
</table>
</div></div></td>
</tr>
<tr>
<td><div id="menuForm:menuTable:5:menuDiv"><h3 id='menuDivH3' onclick='javascript:ajaxCategoryMenu(this,5)'><table id="menuForm:menuTable:5:categories" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Online payment</td>
</tr>
</tbody>
</table>
</h3><div id="menuForm:menuTable:5:Divs"><table id="menuForm:menuTable:5:services" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td><a id="menuForm:menuTable:5:services:0:urlMenu" name="menuForm:menuTable:5:services:0:urlMenu" href="/yu/ui/student/onlinePayment/index/forwardPaymentIndex.faces">Online payment</a></td>
</tr>
</tbody>
</table>
</div></div></td>
</tr>
<tr>
<td><div id="menuForm:menuTable:6:menuDiv"><h3 id='menuDivH3' onclick='javascript:ajaxCategoryMenu(this,6)'><table id="menuForm:menuTable:6:categories" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Financial record</td>
</tr>
</tbody>
</table>
</h3><div id="menuForm:menuTable:6:Divs"><table id="menuForm:menuTable:6:services" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
<td><a id="menuForm:menuTable:6:services:0:urlMenu" name="menuForm:menuTable:6:services:0:urlMenu" href="/yu/ui/student/financialRecord/index/financialRecordIndex.faces">Financial Record</a></td>
</tr>
</tbody>
</table>
</div></div></td>
</tr>
</tbody>
</table>
<input type="hidden" name="javax.faces.ViewState" id="j_id_id0:javax.faces.ViewState:1" value="423936249064564852:6049645500832811260" autocomplete="off" />
</form>
                </div>
            </div>
        </div>
        <div id="left">
            <div class="forget">
                <h1><span id="title" class="titel">Final Exams</span></h1>
                
                    
                    <a id="calHeaderLink" name="calHeaderLink" href="/yu/calendarservlet?showCal=no" class="calender"><img id="calHeaderImg" src="/yu/images/Calendar.png" style="border-width: 0pt;" /></a>
                    
                
                
                    
                    
                        <span><span id="currentSemesterTitle">First Semester 2023/2024</span></span>
                    
                
            </div>
            <div class="data_in">
                <table width="699px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="n6"><p><span id="studName">Student Name</span> :</p></td>
                        <td class="n41">
                            
                            
                                <p><span id="studNameEnText">YAZEED FADI MOHAMMAD ALKHALAF</span></p>
                            
                        </td>
                        <td class="n6">&nbsp;</td>
                        <td class="n6"><p><span id="facName">Faculty</span> :</p></td>
                        <td class="n41"><p><span id="facNameText">Engineering and Architecture</span></p></td>
                    </tr>
                    <tr>
                        <td class="n6"><p><span id="studNoText">Student No.</span> :</p></td>
                        <td class="n41"><p><span id="studNo">202211123</span></p></td>
                        <td class="n6">&nbsp;</td>
                        <td class="n6"><p><span id="majorNameText">Major</span> :</p></td>
                        <td class="n41"><p><span id="majorName">Software Engineering</span></p></td>
                    </tr>
                    <tr>
                        <td class="n6"><p><span id="regSemesterDesc">Registration Semester</span> :</p></td>
                        <td class="n41"><p><span id="regSemesterDescTxt">First Semester 2023/2024</span></p></td>
                        <td class="n6">&nbsp;</td>
                        <td class="n6"><p><span id="campusTxt">Campus</span> :</p></td>
                        <td class="n41"><p><span id="campusName">Riyadh  Male</span></p></td>
                    </tr>
                </table>
            </div>
            <div class="data_in">
                <div>
                    <table>
                        <tr>
                            <td height="12"></td>
                        </tr>
                    </table>
                    <table cellSpacing="0" cellPadding="0" width="100%" border="0" align="center">
                        <tr>
                            <td valign="top"><!-- service BODY CELL -->
                                <table align="center" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            


<input id="hiddenValue" type="hidden" name="hiddenValue" value="false" />
<script type="text/javascript">
    try {
        showAccordionPrimeUI('msgsForms:defaultMsg', false);
    } catch (e) {
    }
</script>

    

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <script type="text/javascript">
                    var indexCat = parseInt('0');
                    var root = '/yu';
                    \$(function () {
                        try {
                            for (k = 0; k < 10; k++) {
                                \$(document.getElementById('menuForm:menuTable:' + k + ':menuDiv')).puiaccordion({
                                    change: function (event, panel) {
                                        try {
                                            for (i = 0; i < 10; i++) {
                                                if (event.target.id != 'menuForm:menuTable:' + i + ':menuDiv') {
                                                    \$(document.getElementById('menuForm:menuTable:' + i + ':menuDiv')).puiaccordion('unselect', 0);
                                                }
                                            }
                                        } catch (e) {
                                        }
                                    }
                                });
                                if (k != indexCat) {
                                    \$(document.getElementById('menuForm:menuTable:' + k + ':menuDiv')).puiaccordion('unselect', 0);
                                } else {
                                }
                            }
                        } catch (e) {
                        }
                        document.getElementById('menuForm:menuTable').style.display = '';
                    });
                </script>
    




 

 












<form id="j_id_id153" name="j_id_id153" method="post" action="/yu/ui/student/final_exams/index/finalExamsIndex.faces" enctype="application/x-www-form-urlencoded">
<input type="hidden" name="j_id_id153" value="j_id_id153" />
<input type="hidden" name="j_id_id153:j_id_id154" value="" />
    
    <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" style="word-break: keep-all;">
        <tr>
            <td>
                
                    <table width="10%" align="right" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="10%">
                                <a id="j_id_id153:printLink" name="j_id_id153:printLink" href="javascript:showDilaogPrintPrimeUI('/yu/ui/student/final_exams/printFinalExams.faces');" title="Print" class="printButton"></a>
                            </td>
                        </tr>
                    </table>
                
            </td>
        </tr>
        <tr>
            <td>
                
                    <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" style="word-break: keep-all;">
                        <tr>
                            <td height="5"></td>
                        </tr>
                        <tr>
                            <td>
                                <table id="j_id_id153:finalExamsTable" border="0" cellpadding="1" cellspacing="1" width="100%">
<thead>
<tr>
<th class="HEADING" scope="col">Course Code</th>
<th class="HEADING" scope="col">Course Name</th>
<th class="HEADING" scope="col">Section</th>
<th class="HEADING" scope="col">Exam Room</th>
<th class="HEADING" scope="col">Exam Day</th>
<th class="HEADING" scope="col">Exam Time</th>
<th class="HEADING" scope="col">Hijrah exam date</th>
<th class="HEADING" scope="col">Gregorian exam date</th>
</tr>
</thead>
<tbody>
<tr class="ROW1">
<td>CIS 201</td>
<td>Fundamentals of Web Design</td>
<td>423</td>
<td>B001. Main Building</td>
<td>Tuesday  </td>
<td>14:30</td>
<td>1445-06-06</td>
<td>19-12-2023</td>
</tr>
<tr class="ROW2">
<td>SWE 202</td>
<td>Introduction to Software Engineering</td>
<td>434</td>
<td>Najd Hall in Najd Building</td>
<td>Wednesday</td>
<td>11:30</td>
<td>1445-06-14</td>
<td>27-12-2023</td>
</tr>
<tr class="ROW1">
<td>MTH 304</td>
<td>Differential Equations</td>
<td>12</td>
<td>Library Hall (2) Main Building</td>
<td>Tuesday  </td>
<td>11:30</td>
<td>1445-06-20</td>
<td>02-01-2024</td>
</tr>
<tr class="ROW2">
<td>CIS 202</td>
<td>Data Structures</td>
<td>412</td>
<td>Najd Hall in Najd Building</td>
<td>Wednesday</td>
<td>14:30</td>
<td>1445-06-07</td>
<td>20-12-2023</td>
</tr>
<tr class="ROW1">
<td>ISL 201</td>
<td>Foundation of Islamic Economy</td>
<td>92</td>
<td>Library Hall (1) Main Building</td>
<td>Wednesday</td>
<td>11:30</td>
<td>1445-05-29</td>
<td>13-12-2023</td>
</tr>
<tr class="ROW2">
<td>ARB 202</td>
<td>Writing Skills in Arabic</td>
<td>127</td>
<td>Library Hall (1) Main Building</td>
<td>Thursday </td>
<td>11:30</td>
<td>1445-06-01</td>
<td>14-12-2023</td>
</tr>
<tr class="ROW1">
<td>CIS 221</td>
<td>Introduction to Database Systems</td>
<td>484</td>
<td>Library Hall (1) Main Building</td>
<td>Tuesday  </td>
<td>14:30</td>
<td>1445-06-13</td>
<td>26-12-2023</td>
</tr>
</tbody>
</table>

                            </td>
                        </tr>
                        <tr>
                            <td height="5"></td>
                        </tr>
                        <tr>
                            <td>
                                <span id="j_id_id153:noteMsg" class="ERR_MSG">Please refer to the Gregorian Exam date in case of Hijri date is not matching correctly</span>
                            </td>
                        </tr>
                    </table>
                    <br>
                
                
            </td>
        </tr>
        <tr>
            <td>
                <br>
                <table class="back" align="right" border="0" cellpadding="0"
                       cellspacing="0" style="width:10%; word-break: keep-all;">
                    <tr>
                        <td valign="bottom" height="18">
                            <a id="j_id_id153:homeCmdLink" href="#" title="Back" onclick="mojarra.jsfcljs(document.getElementById('j_id_id153'),{'j_id_id153:homeCmdLink':'j_id_id153:homeCmdLink'},'');return false" class="backButton"></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
<input type="hidden" name="javax.faces.ViewState" id="j_id_id0:javax.faces.ViewState:2" value="423936249064564852:6049645500832811260" autocomplete="off" />
</form>
    

</div></div></div></div>
<div id="footer">
    <div class="texter">&nbsp;</div>
    <div class="bottom_links">
        <ul>
            <li><a href="#">&nbsp;</a></li>
        </ul>
    </div>
</div>
</div>
</div>
</center><div style="clear: both"></div><!-- MYFACES JAVASCRIPT -->

</body></html>''';
