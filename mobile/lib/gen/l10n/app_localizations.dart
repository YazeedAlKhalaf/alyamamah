import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'University ID'**
  String get username;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @unknown_service_error.
  ///
  /// In en, this message translates to:
  /// **'Unknown service error'**
  String get unknown_service_error;

  /// No description provided for @invalid_credentials.
  ///
  /// In en, this message translates to:
  /// **'The university ID or password is wrong'**
  String get invalid_credentials;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @about_us.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get about_us;

  /// No description provided for @rate_us_on_the_store.
  ///
  /// In en, this message translates to:
  /// **'Rate us on the {store}'**
  String rate_us_on_the_store(Object store);

  /// No description provided for @app_store.
  ///
  /// In en, this message translates to:
  /// **'App Store'**
  String get app_store;

  /// No description provided for @play_store.
  ///
  /// In en, this message translates to:
  /// **'Play Store'**
  String get play_store;

  /// No description provided for @follow_us_on_twitter.
  ///
  /// In en, this message translates to:
  /// **'Follow us on Twitter'**
  String get follow_us_on_twitter;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @student_information.
  ///
  /// In en, this message translates to:
  /// **'Student Information'**
  String get student_information;

  /// No description provided for @mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @degree.
  ///
  /// In en, this message translates to:
  /// **'Degree'**
  String get degree;

  /// No description provided for @campus.
  ///
  /// In en, this message translates to:
  /// **'Campus'**
  String get campus;

  /// No description provided for @faculty.
  ///
  /// In en, this message translates to:
  /// **'Faculty'**
  String get faculty;

  /// No description provided for @major.
  ///
  /// In en, this message translates to:
  /// **'Major'**
  String get major;

  /// No description provided for @study_type.
  ///
  /// In en, this message translates to:
  /// **'Study Type'**
  String get study_type;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @my_courses.
  ///
  /// In en, this message translates to:
  /// **'My Courses'**
  String get my_courses;

  /// No description provided for @session_expired.
  ///
  /// In en, this message translates to:
  /// **'Session expired'**
  String get session_expired;

  /// No description provided for @break_word.
  ///
  /// In en, this message translates to:
  /// **'Break'**
  String get break_word;

  /// No description provided for @welcome_to_alyamamah.
  ///
  /// In en, this message translates to:
  /// **'Welcome in Al Yamamah'**
  String get welcome_to_alyamamah;

  /// No description provided for @absences.
  ///
  /// In en, this message translates to:
  /// **'Absences'**
  String get absences;

  /// No description provided for @absences_count.
  ///
  /// In en, this message translates to:
  /// **'Absences: {count}'**
  String absences_count(Object count);

  /// No description provided for @absence_details.
  ///
  /// In en, this message translates to:
  /// **'Absences details'**
  String get absence_details;

  /// No description provided for @excused.
  ///
  /// In en, this message translates to:
  /// **'Excused'**
  String get excused;

  /// No description provided for @late.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get late;

  /// No description provided for @no_absences.
  ///
  /// In en, this message translates to:
  /// **'No absences'**
  String get no_absences;

  /// No description provided for @university_id_is_required.
  ///
  /// In en, this message translates to:
  /// **'University ID is required'**
  String get university_id_is_required;

  /// No description provided for @password_is_required.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get password_is_required;

  /// No description provided for @collapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get collapse;

  /// No description provided for @lates_count.
  ///
  /// In en, this message translates to:
  /// **'Lates: {count}'**
  String lates_count(Object count);

  /// No description provided for @no_absences_description.
  ///
  /// In en, this message translates to:
  /// **'Keep up the good work and try to never miss a class!'**
  String get no_absences_description;

  /// No description provided for @course_code.
  ///
  /// In en, this message translates to:
  /// **'Course Code'**
  String get course_code;

  /// No description provided for @room.
  ///
  /// In en, this message translates to:
  /// **'Room'**
  String get room;

  /// No description provided for @activity_description.
  ///
  /// In en, this message translates to:
  /// **'Activity Description'**
  String get activity_description;

  /// No description provided for @instructor.
  ///
  /// In en, this message translates to:
  /// **'Instructor'**
  String get instructor;

  /// No description provided for @credit_hours.
  ///
  /// In en, this message translates to:
  /// **'Credit Hours'**
  String get credit_hours;

  /// No description provided for @campus_name.
  ///
  /// In en, this message translates to:
  /// **'Campus Name'**
  String get campus_name;

  /// No description provided for @course_deleted_q.
  ///
  /// In en, this message translates to:
  /// **'Course Deleted?'**
  String get course_deleted_q;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @section.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get section;

  /// No description provided for @regular.
  ///
  /// In en, this message translates to:
  /// **'Regular'**
  String get regular;

  /// No description provided for @ramadan.
  ///
  /// In en, this message translates to:
  /// **'Ramadan'**
  String get ramadan;

  /// No description provided for @choose_semester.
  ///
  /// In en, this message translates to:
  /// **'Choose Semester'**
  String get choose_semester;

  /// No description provided for @choose_semester_description.
  ///
  /// In en, this message translates to:
  /// **'This shows all the semester since you have joined the university.'**
  String get choose_semester_description;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'current'**
  String get current;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'previous'**
  String get previous;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @update_mobile.
  ///
  /// In en, this message translates to:
  /// **'Update Mobile'**
  String get update_mobile;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @update_email.
  ///
  /// In en, this message translates to:
  /// **'Update Email'**
  String get update_email;

  /// No description provided for @enter_your_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enter_your_email;

  /// No description provided for @enter_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get enter_valid_email;

  /// No description provided for @enter_your_mobile.
  ///
  /// In en, this message translates to:
  /// **'Please enter your mobile'**
  String get enter_your_mobile;

  /// No description provided for @enter_valid_mobile.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid mobile'**
  String get enter_valid_mobile;

  /// No description provided for @semester_progress_tool.
  ///
  /// In en, this message translates to:
  /// **'Semester Progress tool'**
  String get semester_progress_tool;

  /// No description provided for @tuwaiq_rooms_tool.
  ///
  /// In en, this message translates to:
  /// **'Tuwaiq Rooms tool'**
  String get tuwaiq_rooms_tool;

  /// No description provided for @pm.
  ///
  /// In en, this message translates to:
  /// **'PM'**
  String get pm;

  /// No description provided for @am.
  ///
  /// In en, this message translates to:
  /// **'AM'**
  String get am;

  /// No description provided for @manage_link.
  ///
  /// In en, this message translates to:
  /// **'Manage Link'**
  String get manage_link;

  /// No description provided for @manage_link_description.
  ///
  /// In en, this message translates to:
  /// **'This link provides convenient access to the e.g. Zoom meeting for your class'**
  String get manage_link_description;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get link;

  /// No description provided for @link_cannot_be_empty.
  ///
  /// In en, this message translates to:
  /// **'Link cannot be empty'**
  String get link_cannot_be_empty;

  /// No description provided for @enter_a_valid_link.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid link'**
  String get enter_a_valid_link;

  /// No description provided for @set.
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get set;

  /// No description provided for @click_here_to_open_the_link.
  ///
  /// In en, this message translates to:
  /// **'Click here to open the link'**
  String get click_here_to_open_the_link;

  /// No description provided for @click_set_to_define_the_link.
  ///
  /// In en, this message translates to:
  /// **'Click \'Set\' to define the link'**
  String get click_set_to_define_the_link;

  /// No description provided for @delete_link.
  ///
  /// In en, this message translates to:
  /// **'Delete Link'**
  String get delete_link;

  /// No description provided for @you_sure_delete_link.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this link?'**
  String get you_sure_delete_link;

  /// No description provided for @failed_to_open_link.
  ///
  /// In en, this message translates to:
  /// **'Failed to open link 😢'**
  String get failed_to_open_link;

  /// No description provided for @gpa.
  ///
  /// In en, this message translates to:
  /// **'GPA'**
  String get gpa;

  /// No description provided for @alyamamah_gpt_title.
  ///
  /// In en, this message translates to:
  /// **'AlYamamahGPT'**
  String get alyamamah_gpt_title;

  /// No description provided for @alyamamah_gpt_description.
  ///
  /// In en, this message translates to:
  /// **'Unlocks unlimited messages to AlYamamahGPT'**
  String get alyamamah_gpt_description;

  /// No description provided for @current_packages.
  ///
  /// In en, this message translates to:
  /// **'Current Packages'**
  String get current_packages;

  /// No description provided for @lifetime.
  ///
  /// In en, this message translates to:
  /// **'Lifetime'**
  String get lifetime;

  /// No description provided for @annual.
  ///
  /// In en, this message translates to:
  /// **'Annually'**
  String get annual;

  /// No description provided for @six_month.
  ///
  /// In en, this message translates to:
  /// **'6 Months'**
  String get six_month;

  /// No description provided for @three_month.
  ///
  /// In en, this message translates to:
  /// **'3 Months'**
  String get three_month;

  /// No description provided for @two_month.
  ///
  /// In en, this message translates to:
  /// **'2 Months'**
  String get two_month;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @alyamamah_gpt.
  ///
  /// In en, this message translates to:
  /// **'AlYamamahGPT'**
  String get alyamamah_gpt;

  /// No description provided for @you_need_to_subscribe_first.
  ///
  /// In en, this message translates to:
  /// **'You need to subscribe first 😁'**
  String get you_need_to_subscribe_first;

  /// No description provided for @active_with_emoji.
  ///
  /// In en, this message translates to:
  /// **'Active ✅'**
  String get active_with_emoji;

  /// No description provided for @ask_alyamamah_gpt.
  ///
  /// In en, this message translates to:
  /// **'Ask AlYamamahGPT'**
  String get ask_alyamamah_gpt;

  /// No description provided for @new_word.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get new_word;

  /// No description provided for @type_your_message_here.
  ///
  /// In en, this message translates to:
  /// **'Type your message here'**
  String get type_your_message_here;

  /// No description provided for @human.
  ///
  /// In en, this message translates to:
  /// **'Human'**
  String get human;

  /// No description provided for @ai.
  ///
  /// In en, this message translates to:
  /// **'AI'**
  String get ai;

  /// No description provided for @invalid_request.
  ///
  /// In en, this message translates to:
  /// **'Invalid Request'**
  String get invalid_request;

  /// No description provided for @payment_required.
  ///
  /// In en, this message translates to:
  /// **'Payment Required'**
  String get payment_required;

  /// No description provided for @purchase_has_been_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Purchase has been cancelled'**
  String get purchase_has_been_cancelled;

  /// No description provided for @purchase_invalid.
  ///
  /// In en, this message translates to:
  /// **'Purchase is invalid'**
  String get purchase_invalid;

  /// No description provided for @purchase_not_allowed.
  ///
  /// In en, this message translates to:
  /// **'Purchase is not allowed'**
  String get purchase_not_allowed;

  /// No description provided for @purchase_pending.
  ///
  /// In en, this message translates to:
  /// **'Purchase is pending'**
  String get purchase_pending;

  /// No description provided for @we_couldnt_find_any_offerings_for_you.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find any offerings for you'**
  String get we_couldnt_find_any_offerings_for_you;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @too_many_requests.
  ///
  /// In en, this message translates to:
  /// **'You have reached the limit of requests. Please try again later.'**
  String get too_many_requests;

  /// No description provided for @gpt_4_limits_message.
  ///
  /// In en, this message translates to:
  /// **'GPT-4 currently has a cap of 25 messages every 3 hours.'**
  String get gpt_4_limits_message;

  /// No description provided for @user_is_generating.
  ///
  /// In en, this message translates to:
  /// **'Only one concurrent generation is allowed per user, wait for the current generation to finish.'**
  String get user_is_generating;

  /// No description provided for @your_best_companion_for_school_work.
  ///
  /// In en, this message translates to:
  /// **'Your best companion for school work!'**
  String get your_best_companion_for_school_work;

  /// No description provided for @context_length_exceeded.
  ///
  /// In en, this message translates to:
  /// **'Your chat is too long for this model\'s context, start a new chat.'**
  String get context_length_exceeded;

  /// No description provided for @first_semester_year1_year2.
  ///
  /// In en, this message translates to:
  /// **'First Semester ({year1}/{year2})'**
  String first_semester_year1_year2(Object year1, Object year2);

  /// No description provided for @second_semester_year1_year2.
  ///
  /// In en, this message translates to:
  /// **'Second Semester ({year1}/{year2})'**
  String second_semester_year1_year2(Object year1, Object year2);

  /// No description provided for @summer_semester_year1_year2.
  ///
  /// In en, this message translates to:
  /// **'Summer Semester ({year1}/{year2})'**
  String summer_semester_year1_year2(Object year1, Object year2);

  /// No description provided for @this_semester_has_no_courses_yet.
  ///
  /// In en, this message translates to:
  /// **'This semester has no courses yet'**
  String get this_semester_has_no_courses_yet;

  /// No description provided for @join_semester.
  ///
  /// In en, this message translates to:
  /// **'Join Semester'**
  String get join_semester;

  /// No description provided for @finished_restoring_successfully.
  ///
  /// In en, this message translates to:
  /// **'Finished restoring successfully'**
  String get finished_restoring_successfully;

  /// No description provided for @something_went_wrong_restoring_try_again.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while restoring, please try again'**
  String get something_went_wrong_restoring_try_again;

  /// No description provided for @grades.
  ///
  /// In en, this message translates to:
  /// **'Grades'**
  String get grades;

  /// No description provided for @the_grades_of_this_semester_are_not_available_yet.
  ///
  /// In en, this message translates to:
  /// **'The grades of this semester are not available yet'**
  String get the_grades_of_this_semester_are_not_available_yet;

  /// No description provided for @something_went_wrong_fetching_grades_for_this_semester.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while fetching grades for this semester'**
  String get something_went_wrong_fetching_grades_for_this_semester;

  /// No description provided for @semester_gpa.
  ///
  /// In en, this message translates to:
  /// **'Semester GPA'**
  String get semester_gpa;

  /// No description provided for @cumulative_gpa.
  ///
  /// In en, this message translates to:
  /// **'Cumulative GPA'**
  String get cumulative_gpa;

  /// No description provided for @no_student_gpa_returned.
  ///
  /// In en, this message translates to:
  /// **'No student GPA returned'**
  String get no_student_gpa_returned;

  /// No description provided for @unlock_a_world_of_instant_updates.
  ///
  /// In en, this message translates to:
  /// **'Unlock a world of instant updates! 🌟'**
  String get unlock_a_world_of_instant_updates;

  /// No description provided for @dont_miss_a_beat_enable_notifications_we_promise_only_to_ping_when_its_worth_your_while.
  ///
  /// In en, this message translates to:
  /// **'Don\'t miss a beat, enable notifications. We promise only to ping when it\'s worth your while.'**
  String get dont_miss_a_beat_enable_notifications_we_promise_only_to_ping_when_its_worth_your_while;

  /// No description provided for @allow_notifications.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get allow_notifications;

  /// No description provided for @skip_for_now.
  ///
  /// In en, this message translates to:
  /// **'Skip for Now'**
  String get skip_for_now;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @terms_of_use.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get terms_of_use;

  /// No description provided for @build_my_schedule.
  ///
  /// In en, this message translates to:
  /// **'Build My Schedule'**
  String get build_my_schedule;

  /// No description provided for @offered_courses.
  ///
  /// In en, this message translates to:
  /// **'Offered Courses'**
  String get offered_courses;

  /// No description provided for @schedule_builder.
  ///
  /// In en, this message translates to:
  /// **'Schedule Builder'**
  String get schedule_builder;

  /// No description provided for @something_went_wrong_fetching_your_offered_courses.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while fetching your offered courses'**
  String get something_went_wrong_fetching_your_offered_courses;

  /// No description provided for @please_try_again.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get please_try_again;

  /// No description provided for @no_offered_courses_found.
  ///
  /// In en, this message translates to:
  /// **'No offered courses found'**
  String get no_offered_courses_found;

  /// No description provided for @wait_till_the_university_releases_the_courses_or_talk_to_your_advisor.
  ///
  /// In en, this message translates to:
  /// **'Wait till the university releases the courses or talk to your advisor'**
  String get wait_till_the_university_releases_the_courses_or_talk_to_your_advisor;

  /// No description provided for @min_x.
  ///
  /// In en, this message translates to:
  /// **'Min\n{hours}'**
  String min_x(Object hours);

  /// No description provided for @max_x.
  ///
  /// In en, this message translates to:
  /// **'Max\n{hours}'**
  String max_x(Object hours);

  /// No description provided for @attempted_x.
  ///
  /// In en, this message translates to:
  /// **'Attempted\n{hours}'**
  String attempted_x(Object hours);

  /// No description provided for @selected_x.
  ///
  /// In en, this message translates to:
  /// **'Selected\n{hours}'**
  String selected_x(Object hours);

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @choose_schedule.
  ///
  /// In en, this message translates to:
  /// **'Choose Schedule'**
  String get choose_schedule;

  /// No description provided for @schedule_has_conflicts.
  ///
  /// In en, this message translates to:
  /// **'Schedule has conflicts'**
  String get schedule_has_conflicts;

  /// No description provided for @remove_course.
  ///
  /// In en, this message translates to:
  /// **'Remove Course'**
  String get remove_course;

  /// No description provided for @you_have_to_pay_before_saving_this_schedule.
  ///
  /// In en, this message translates to:
  /// **'You have to pay before saving this schedule'**
  String get you_have_to_pay_before_saving_this_schedule;

  /// No description provided for @open_payment_link.
  ///
  /// In en, this message translates to:
  /// **'Open Payment Link'**
  String get open_payment_link;

  /// No description provided for @previous_credit_x.
  ///
  /// In en, this message translates to:
  /// **'📚 Previous Credit: {amount}'**
  String previous_credit_x(Object amount);

  /// No description provided for @semester_fees_x.
  ///
  /// In en, this message translates to:
  /// **'💵 Semester Fees: {amount}'**
  String semester_fees_x(Object amount);

  /// No description provided for @total_x.
  ///
  /// In en, this message translates to:
  /// **'💼 Total: {amount}'**
  String total_x(Object amount);

  /// No description provided for @by_tapping_the_button_above_youll_pay_youre_fees_securely_on_the_universitys_site.
  ///
  /// In en, this message translates to:
  /// **'By tapping the above button, you\'ll pay your fees securely on the university\'s site.'**
  String get by_tapping_the_button_above_youll_pay_youre_fees_securely_on_the_universitys_site;

  /// No description provided for @oops_it_looks_like_theres_a_problem_with_your_payment__please_confirm_your_payment_information_and_try_again.
  ///
  /// In en, this message translates to:
  /// **'Oops! It looks like there\'s a problem with your payment. Please confirm your payment information and try again.'**
  String get oops_it_looks_like_theres_a_problem_with_your_payment__please_confirm_your_payment_information_and_try_again;

  /// No description provided for @your_schedule_has_been_set_successfully__you_can_view_it_in_the_courses_tab.
  ///
  /// In en, this message translates to:
  /// **'Your schedule has been set successfully. You can view it in the courses tab.'**
  String get your_schedule_has_been_set_successfully__you_can_view_it_in_the_courses_tab;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @something_went_wrong_fetching_your_chats.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while fetching your chats'**
  String get something_went_wrong_fetching_your_chats;

  /// No description provided for @no_chats.
  ///
  /// In en, this message translates to:
  /// **'No chats'**
  String get no_chats;

  /// No description provided for @no_chats_description.
  ///
  /// In en, this message translates to:
  /// **'No chats yet, those are linked to your courses'**
  String get no_chats_description;

  /// No description provided for @syncing_chats.
  ///
  /// In en, this message translates to:
  /// **'Syncing chats'**
  String get syncing_chats;

  /// No description provided for @loading_chats.
  ///
  /// In en, this message translates to:
  /// **'Loading chats'**
  String get loading_chats;

  /// No description provided for @get_chats.
  ///
  /// In en, this message translates to:
  /// **'Get Chats'**
  String get get_chats;

  /// No description provided for @all_the_courses_that_you_have_selected_have_conflicts_please_remove_some_courses_and_try_again.
  ///
  /// In en, this message translates to:
  /// **'All the courses that you have selected have conflicts. Please remove some courses and try again.'**
  String get all_the_courses_that_you_have_selected_have_conflicts_please_remove_some_courses_and_try_again;

  /// No description provided for @go_back.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get go_back;

  /// No description provided for @temporary_maintenance.
  ///
  /// In en, this message translates to:
  /// **'Temporary Maintenance'**
  String get temporary_maintenance;

  /// No description provided for @temporary_maintenance_description.
  ///
  /// In en, this message translates to:
  /// **'The app is currently undergoing maintenance to enhance your experience. I\'m working hard to bring it back up. Thank you for your patience and understanding.'**
  String get temporary_maintenance_description;

  /// No description provided for @for_any_concerns_or_feedback_feel_free_to_reach_out.
  ///
  /// In en, this message translates to:
  /// **'For any concerns or feedback, feel free to reach out:'**
  String get for_any_concerns_or_feedback_feel_free_to_reach_out;

  /// No description provided for @email_x.
  ///
  /// In en, this message translates to:
  /// **'Email: {x}'**
  String email_x(Object x);

  /// No description provided for @failed_to_launch_email_app.
  ///
  /// In en, this message translates to:
  /// **'Failed to launch email app.'**
  String get failed_to_launch_email_app;

  /// No description provided for @twitter_dm.
  ///
  /// In en, this message translates to:
  /// **'Twitter DM'**
  String get twitter_dm;

  /// No description provided for @failed_to_launch_twitter_app.
  ///
  /// In en, this message translates to:
  /// **'Failed to launch Twitter app.'**
  String get failed_to_launch_twitter_app;

  /// No description provided for @feedback_for_student_council.
  ///
  /// In en, this message translates to:
  /// **'Feedback for Student Council'**
  String get feedback_for_student_council;

  /// No description provided for @voice_your_concerns.
  ///
  /// In en, this message translates to:
  /// **'Voice Your Concerns!'**
  String get voice_your_concerns;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @body.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get body;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @failed_to_load_feedback_categories.
  ///
  /// In en, this message translates to:
  /// **'Failed to load feedback categories'**
  String get failed_to_load_feedback_categories;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return SAr();
    case 'en': return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
