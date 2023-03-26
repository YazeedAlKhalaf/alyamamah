import 'package:alyamamah/ui/views/courses/models/time_mapping.dart';

final academicMappingParsed = academicMapping.map((e) {
  return TimeMapping.fromMap(e);
}).toList();

const academicMapping = [
  {
    'course_code': 'BUS 304',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [61, 211]
  },
  {
    'course_code': 'MIS 327',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [149, 45]
  },
  {
    'course_code': 'MIS 327',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 9, 'minute': 45},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [149, 45]
  },
  {
    'course_code': 'MIS 327',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 9, 'minute': 45},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [150, 46]
  },
  {
    'course_code': 'MIS 328',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [169, 47]
  },
  {
    'course_code': '',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 9, 'minute': 45},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [169, 47]
  },
  {
    'course_code': '',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 9, 'minute': 45},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [171, 48]
  },
  {
    'course_code': 'LAW 235',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [643, 622]
  },
  {
    'course_code': 'LAW 313',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [370, 188]
  },
  {
    'course_code': 'LAW 324 / LAW 444',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [362, 539, 192]
  },
  {
    'course_code': 'ENG 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [287, 430]
  },
  {
    'course_code': 'PSY 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [307, 34]
  },
  {
    'course_code': 'ARB 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [262, 342]
  },
  {
    'course_code': 'ISL 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [226, 240]
  },
  {
    'course_code': 'PHY 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [104, 383]
  },
  {
    'course_code': 'CIS 321',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [152, 132]
  },
  {
    'course_code': 'CIS 321',
    'activity': '',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [152, 132]
  },
  {
    'course_code': 'CIS 443',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [203, 138]
  },
  {
    'course_code': 'CIS 443',
    'activity': '',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [203, 138]
  },
  {
    'course_code': 'ENR 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [411, 37]
  },
  {
    'course_code': 'ENR 201',
    'activity': 'Tut',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [412, 36]
  },
  {
    'course_code': 'ENR 201',
    'activity': 'Lab',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 40}
    },
    'sections': [413, 38]
  },
  {
    'course_code': 'IEG 411',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 5],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 5],
      'start_time': {'hour': 9, 'minute': 45},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [447, 311]
  },
  {
    'course_code': 'IEG 411',
    'activity': 'Tut',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [448, 310]
  },
  {
    'course_code': 'IEG 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [416, 273]
  },
  {
    'course_code': 'IEG 301',
    'activity': '',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 50}
    },
    'sections': [416, 273]
  },
  {
    'course_code': 'IEG 301',
    'activity': 'Tut',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 35}
    },
    'sections': [417, 272]
  },
  {
    'course_code': 'IEG 301',
    'activity': 'Lab',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 50}
    },
    'sections': [418, 274]
  },
  {
    'course_code': 'IEG 303',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [449, 278]
  },
  {
    'course_code': 'IEG 303',
    'activity': '',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [449, 278]
  },
  {
    'course_code': 'IEG 303',
    'activity': 'Tut',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [450, 277]
  },
  {
    'course_code': 'IEG 303',
    'activity': 'Lab',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 7, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 40}
    },
    'sections': [451, 279]
  },
  {
    'course_code': 'MGT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [111, 64]
  },
  {
    'course_code': 'ACC 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [21, 143]
  },
  {
    'course_code': 'ACC 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [29, 149]
  },
  {
    'course_code': 'MGT 305',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [62, 76]
  },
  {
    'course_code': 'ACC 415',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [25, 153]
  },
  {
    'course_code': 'MGT 300',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [75, 72]
  },
  {
    'course_code': 'MGT 409',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [128, 81]
  },
  {
    'course_code': 'MIS 317',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [157, 42]
  },
  {
    'course_code': 'FIN 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [458]
  },
  {
    'course_code': 'FIN 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [470]
  },
  {
    'course_code': 'FIN 312',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [473]
  },
  {
    'course_code': 'LAW 326',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [573, 548]
  },
  {
    'course_code': 'LAW 342 / LAW 414',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [543, 342, 483, 199]
  },
  {
    'course_code': 'LAW 230',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [533, 473]
  },
  {
    'course_code': 'LAW 225',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [346, 183]
  },
  {
    'course_code': 'LAW 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [574, 549]
  },
  {
    'course_code': 'ENG 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [279, 421]
  },
  {
    'course_code': 'ENG 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [294, 431]
  },
  {
    'course_code': 'PHL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [308, 380]
  },
  {
    'course_code': 'ARB 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [256, 337]
  },
  {
    'course_code': 'ISL 401',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [237, 251]
  },
  {
    'course_code': 'CIS 221',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3, 5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3, 5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [185, 127]
  },
  {
    'course_code': 'CIS 221',
    'activity': 'Lab',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [186, 129]
  },
  {
    'course_code': 'IAR 412',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 50}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 30}
    },
    'sections': [292, 326]
  },
  {
    'course_code': 'ARC 413',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [301, 365]
  },
  {
    'course_code': 'ARC 212',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 50}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 12, 'minute': 10}
    },
    'sections': [272, 347]
  },
  {
    'course_code': 'ARC 216',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 50}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 30}
    },
    'sections': [274, 355]
  },
  {
    'course_code': 'ARCH 113',
    'activity': 'Laboratory',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 50}
    },
    'sections': [270, 375]
  },
  {
    'course_code': 'ARC 216',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [646]
  },
  {
    'course_code': 'MGT 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [99, 60]
  },
  {
    'course_code': 'ECO 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [35, 396]
  },
  {
    'course_code': 'MKT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [136, 90]
  },
  {
    'course_code': 'ACC 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [22, 144]
  },
  {
    'course_code': 'MGT 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [119, 68]
  },
  {
    'course_code': 'BUS 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [50, 205]
  },
  {
    'course_code': 'ACC 411',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [30, 152]
  },
  {
    'course_code': 'MKT 311',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [132, 93]
  },
  {
    'course_code': 'MKT 411',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [141, 99]
  },
  {
    'course_code': 'MKT 418',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [145, 104]
  },
  {
    'course_code': 'ECO 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [43, 401]
  },
  {
    'course_code': 'FIN 313',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [44, 410]
  },
  {
    'course_code': 'MGT 441',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [81, 84]
  },
  {
    'course_code': 'ACC 426',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [26, 155]
  },
  {
    'course_code': 'MIS 428',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [151, 54]
  },
  {
    'course_code': 'LAW 113 / LAW 203',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [628, 571, 546]
  },
  {
    'course_code': 'LAW 322',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [333, 190]
  },
  {
    'course_code': 'LAW 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [577, 552]
  },
  {
    'course_code': 'ENG 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [281, 422]
  },
  {
    'course_code': 'ENG 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [296, 432]
  },
  {
    'course_code': 'ARB 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [251, 333]
  },
  {
    'course_code': 'ISL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [224, 238]
  },
  {
    'course_code': 'ISL 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [227, 241]
  },
  {
    'course_code': 'ISL 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [232, 246]
  },
  {
    'course_code': 'MTH 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [79, 223]
  },
  {
    'course_code': 'STT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [92, 404]
  },
  {
    'course_code': 'NES 322',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [198, 257]
  },
  {
    'course_code': 'NES 424',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [211, 261]
  },
  {
    'course_code': 'CIS 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [608, 579]
  },
  {
    'course_code': 'CIS 202',
    'activity': '',
    'regular_time': {
      'days': [1, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [608, 579]
  },
  {
    'course_code': 'CIS 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [615, 587]
  },
  {
    'course_code': 'CIS 201',
    'activity': 'Lab',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [617, 588]
  },
  {
    'course_code': 'CIS 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [158, 112]
  },
  {
    'course_code': 'CIS 103',
    'activity': '',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [158, 112]
  },
  {
    'course_code': 'CIS 103',
    'activity': 'Lab',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [160, 116]
  },
  {
    'course_code': 'NES 341',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [199, 258]
  },
  {
    'course_code': '',
    'activity': '',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [293, 358]
  },
  {
    'course_code': '',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [200, 259]
  },
  {
    'course_code': 'ARC 312',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [293, 358]
  },
  {
    'course_code': 'IAR 414',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [312, 328]
  },
  {
    'course_code': 'MEC 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [275, 420]
  },
  {
    'course_code': 'ARC 314',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [313, 360]
  },
  {
    'course_code': 'IEG 323',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 11, 'minute': 55}
    },
    'sections': [441, 291]
  },
  {
    'course_code': 'IEG 323',
    'activity': '',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 50}
    },
    'sections': [441, 291]
  },
  {
    'course_code': 'IEG 323',
    'activity': 'Tut',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 10, 'minute': 40},
      'end_time': {'hour': 11, 'minute': 15}
    },
    'sections': [442, 290]
  },
  {
    'course_code': 'IEG 323',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 7, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 40}
    },
    'sections': [443, 292]
  },
  {
    'course_code': 'BUS 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [51, 206]
  },
  {
    'course_code': 'MKT 411',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [142, 100]
  },
  {
    'course_code': 'MKT 415',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [146, 103]
  },
  {
    'course_code': 'MIS 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [153, 434]
  },
  {
    'course_code': 'BUS 401',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [76, 215]
  },
  {
    'course_code': 'BUS 385',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [70, 213]
  },
  {
    'course_code': 'MGT 416',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [82, 82]
  },
  {
    'course_code': 'MIS 329',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [163, 49]
  },
  {
    'course_code': 'FIN 312',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [459]
  },
  {
    'course_code': 'FIN 311',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [472]
  },
  {
    'course_code': 'MIS 432',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 40}
    },
    'sections': [505, 468]
  },
  {
    'course_code': 'MIS 432',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 40}
    },
    'sections': [506, 469]
  },
  {
    'course_code': 'LAW 344 / LAW 430',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [544, 355, 484, 201]
  },
  {
    'course_code': 'LAW 235',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [579, 554]
  },
  {
    'course_code': 'LAW 308',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [592, 568]
  },
  {
    'course_code': 'ENG 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [288, 426]
  },
  {
    'course_code': 'SOS 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [309, 108]
  },
  {
    'course_code': 'PSY 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [302, 31]
  },
  {
    'course_code': 'ARB 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [254, 335]
  },
  {
    'course_code': 'ISL 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [229, 243]
  },
  {
    'course_code': 'ISL 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [233, 247]
  },
  {
    'course_code': 'STT 203',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [91, 406]
  },
  {
    'course_code': 'PHY 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [123, 386]
  },
  {
    'course_code': 'PHY 103',
    'activity': 'Lab',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [124, 389]
  },
  {
    'course_code': 'CIS 316',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [504, 465]
  },
  {
    'course_code': 'NES 485',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [266, 265]
  },
  {
    'course_code': 'NES 485',
    'activity': 'Lab',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 40}
    },
    'sections': [267, 266]
  },
  {
    'course_code': 'IEG 321',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [414, 287]
  },
  {
    'course_code': 'IEG 321',
    'activity': '',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 40}
    },
    'sections': [414, 287]
  },
  {
    'course_code': 'IEG 321',
    'activity': 'Tut',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 40}
    },
    'sections': [415, 286]
  },
  {
    'course_code': 'IEG 322',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 40}
    },
    'sections': [439, 289]
  },
  {
    'course_code': 'IEG 322',
    'activity': '',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [439, 289]
  },
  {
    'course_code': 'IEG 322',
    'activity': 'Tut',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 40}
    },
    'sections': [440, 288]
  },
  {
    'course_code': 'IEG 400',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 40}
    },
    'sections': [430, 308]
  },
  {
    'course_code': 'IEG 400',
    'activity': '',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [430, 308]
  },
  {
    'course_code': 'IEG 400',
    'activity': 'Tut',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [431, 307]
  },
  {
    'course_code': 'IEG 400',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 40}
    },
    'sections': [432, 309]
  },
  {
    'course_code': 'LAW 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [336, 159]
  },
  {
    'course_code': 'LAW 125 / LAW 309',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [356, 534, 172, 474]
  },
  {
    'course_code': 'LAW 226 / LAW 314',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [372, 536, 184, 476]
  },
  {
    'course_code': 'LAW 334',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [364, 196]
  },
  {
    'course_code': 'ARB 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [255, 336]
  },
  {
    'course_code': 'ISL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [220, 234]
  },
  {
    'course_code': 'ISL 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [228, 242]
  },
  {
    'course_code': 'MTH 104',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [65, 224]
  },
  {
    'course_code': 'MTH 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [69, 230]
  },
  {
    'course_code': 'STT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [52, 402]
  },
  {
    'course_code': 'STT 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [86, 58]
  },
  {
    'course_code': 'ECL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [110, 87]
  },
  {
    'course_code': 'PHY 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [424, 382]
  },
  {
    'course_code': 'CIS 381',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [192, 134]
  },
  {
    'course_code': 'CIS 304',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [204, 131]
  },
  {
    'course_code': 'CIS 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [172, 113]
  },
  {
    'course_code': 'CIS 103',
    'activity': '',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'sections': [172, 113]
  },
  {
    'course_code': 'CIS 103',
    'activity': 'Lab',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'sections': [173, 117]
  },
  {
    'course_code': 'CIS 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [180, 115]
  },
  {
    'course_code': 'CIS 103',
    'activity': '',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'sections': [180, 115]
  },
  {
    'course_code': 'CIS 103',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [181, 119]
  },
  {
    'course_code': 'NES 221',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'sections': [193, 255]
  },
  {
    'course_code': 'NES 221',
    'activity': '',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [193, 255]
  },
  {
    'course_code': 'NES 221',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'sections': [194, 256]
  },
  {
    'course_code': 'ARC A 426',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [315, 368]
  },
  {
    'course_code': 'ARC 314',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 14, 'minute': 50}
    },
    'sections': [642, 621]
  },
  {
    'course_code': 'ARC 213',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [278, 349]
  },
  {
    'course_code': 'ARC 214',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 12, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [284, 351]
  },
  {
    'course_code': 'MGT 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [100, 61]
  },
  {
    'course_code': 'MGT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [114, 65]
  },
  {
    'course_code': 'ECO 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [40, 398]
  },
  {
    'course_code': 'MKT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [133, 89]
  },
  {
    'course_code': 'MKT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [137, 91]
  },
  {
    'course_code': 'ACC 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [23, 145]
  },
  {
    'course_code': 'ACC 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [27, 147]
  },
  {
    'course_code': 'MGT 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [122, 69]
  },
  {
    'course_code': 'MGT 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [71, 74]
  },
  {
    'course_code': 'FIN 418',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [36, 416]
  },
  {
    'course_code': 'MGT 312',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [129, 80]
  },
  {
    'course_code': 'BUS 304',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [58, 209]
  },
  {
    'course_code': 'MKT 314',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [147, 97]
  },
  {
    'course_code': 'FIN 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [471]
  },
  {
    'course_code': 'LAW 211 /  LAW 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [357, 535, 173, 475]
  },
  {
    'course_code': 'LAW 222',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [352, 180]
  },
  {
    'course_code': 'LAW 231',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [575, 550]
  },
  {
    'course_code': 'LAW 116',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [576, 551]
  },
  {
    'course_code': 'ENG 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [282, 423]
  },
  {
    'course_code': 'ENG 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [633, 610]
  },
  {
    'course_code': 'SOS 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [314, 109]
  },
  {
    'course_code': 'PHL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [303, 378]
  },
  {
    'course_code': 'ARB 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [250, 332]
  },
  {
    'course_code': 'ARB 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [259, 340]
  },
  {
    'course_code': 'ISL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [225, 239]
  },
  {
    'course_code': 'MTH 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [72, 222]
  },
  {
    'course_code': 'MTH 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [66, 220]
  },
  {
    'course_code': 'MTH 204',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [87, 228]
  },
  {
    'course_code': 'MTH 304',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [54, 232]
  },
  {
    'course_code': 'ECL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [562, 540]
  },
  {
    'course_code': 'PHY 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [105, 384]
  },
  {
    'course_code': 'PHY 103',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 40}
    },
    'sections': [106, 387]
  },
  {
    'course_code': 'PHY 203',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [97, 390]
  },
  {
    'course_code': 'PHY 203',
    'activity': 'Lab',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 40}
    },
    'sections': [98, 393]
  },
  {
    'course_code': 'PHY 203',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [126, 392]
  },
  {
    'course_code': 'PHY 203',
    'activity': 'Lab',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 40}
    },
    'sections': [127, 395]
  },
  {
    'course_code': 'CIS 351',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [208, 133]
  },
  {
    'course_code': 'CIS 104',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [164, 120]
  },
  {
    'course_code': 'CIS 104',
    'activity': '',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [164, 120]
  },
  {
    'course_code': 'CIS 104',
    'activity': 'Lab',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [166, 122]
  },
  {
    'course_code': 'ARC 313',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 50}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 40}
    },
    'sections': [297, 359]
  },
  {
    'course_code': 'ARC 412',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [268, 364]
  },
  {
    'course_code': 'ARCH 101',
    'activity': 'Laboratory',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [249, 369]
  },
  {
    'course_code': 'ARCH 112',
    'activity': 'Laboratory',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [242, 373]
  },
  {
    'course_code': 'ARCH 112',
    'activity': 'Laboratory',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [243, 374]
  },
  {
    'course_code': 'ARC 211',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'sections': [345]
  },
  {
    'course_code': 'ARC 211',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'sections': [244]
  },
  {
    'course_code': 'ARC 215',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'sections': [463]
  },
  {
    'course_code': 'ARC 215',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'sections': [245, 619]
  },
  {
    'course_code': 'IAR 411',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'sections': [269, 325]
  },
  {
    'course_code': 'IEG 431',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [419, 315]
  },
  {
    'course_code': 'IEG 431',
    'activity': 'Tut',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [420, 314]
  },
  {
    'course_code': 'IEG 431',
    'activity': 'Lab',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [421, 316]
  },
  {
    'course_code': 'IEG 332',
    'activity': 'Lecture',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [459, 294]
  },
  {
    'course_code': 'IEG 332',
    'activity': '',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [459, 294]
  },
  {
    'course_code': 'IEG 332',
    'activity': 'Tut',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [460, 293]
  },
  {
    'course_code': 'IEG 332',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [461, 295]
  },
  {
    'course_code': 'MGT 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [620, 595]
  },
  {
    'course_code': 'BUS 404',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [84, 217]
  },
  {
    'course_code': 'MKT 315',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 17, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 10}
    },
    'sections': [140, 98]
  },
  {
    'course_code': 'MIS 326',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 40}
    },
    'sections': [165, 43]
  },
  {
    'course_code': 'MIS 326',
    'activity': 'Lab',
    'regular_time': {
      'days': [3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [167, 44]
  },
  {
    'course_code': 'LAW 218',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [581, 556]
  },
  {
    'course_code': 'LAW 311',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [334, 186]
  },
  {
    'course_code': 'LAW 332',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [358, 194]
  },
  {
    'course_code': 'LAW 204',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [578, 553]
  },
  {
    'course_code': 'LAW 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [583, 558]
  },
  {
    'course_code': 'SOS 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [316, 110]
  },
  {
    'course_code': 'PHL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [298, 377]
  },
  {
    'course_code': 'PSY 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [304, 32]
  },
  {
    'course_code': 'MTH 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [67, 221]
  },
  {
    'course_code': 'MTH 106',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [88, 227]
  },
  {
    'course_code': 'STT 203',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [93, 407]
  },
  {
    'course_code': 'CHM 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'sections': [112, 27]
  },
  {
    'course_code': 'CHM 101',
    'activity': 'Lab',
    'regular_time': {
      'days': [1],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 40}
    },
    'sections': [113, 29]
  },
  {
    'course_code': 'NES 443',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [205, 262]
  },
  {
    'course_code': 'SWE 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [209, 439]
  },
  {
    'course_code': 'SWE 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [1, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'sections': [610, 580]
  },
  {
    'course_code': 'SWE 322',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [217, 444]
  },
  {
    'course_code': 'SWE 322',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 40}
    },
    'sections': [218, 445]
  },
  {
    'course_code': 'LAW 312',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [343, 187]
  },
  {
    'course_code': 'LAW 327',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [582, 557]
  },
  {
    'course_code': 'LAW 309',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [632, 607]
  },
  {
    'course_code': 'LAW 331 / LAW 429',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [360, 540, 193, 480]
  },
  {
    'course_code': 'LAW 117',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [570, 545]
  },
  {
    'course_code': 'SOS 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [317, 111]
  },
  {
    'course_code': 'CIS 386',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3, 5],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [195, 136]
  },
  {
    'course_code': 'IEG 450',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 17, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'sections': [466, 318]
  },
  {
    'course_code': 'IEG 450',
    'activity': 'Tut',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 14, 'minute': 25}
    },
    'sections': [467, 317]
  },
  {
    'course_code': 'IEG 450',
    'activity': 'Lab',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 40}
    },
    'sections': [468, 319]
  },
  {
    'course_code': 'IEG 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 15, 'minute': 10},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [624, 599]
  },
  {
    'course_code': 'IEG 302',
    'activity': '',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [624, 599]
  },
  {
    'course_code': 'IEG 302',
    'activity': 'Tut',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 40}
    },
    'sections': [625, 600]
  },
  {
    'course_code': 'IEG 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 3],
      'start_time': {'hour': 17, 'minute': 30},
      'end_time': {'hour': 18, 'minute': 20}
    },
    'ramadan_time': {
      'days': [1, 3],
      'start_time': {'hour': 15, 'minute': 50},
      'end_time': {'hour': 16, 'minute': 25}
    },
    'sections': [634, 612]
  },
  {
    'course_code': 'IEG 202',
    'activity': 'Tut',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 17, 'minute': 30},
      'end_time': {'hour': 18, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 15, 'minute': 50},
      'end_time': {'hour': 16, 'minute': 25}
    },
    'sections': [635, 613]
  },
  {
    'course_code': 'FIN 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [377, 409]
  },
  {
    'course_code': 'MGT 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [73, 75]
  },
  {
    'course_code': 'BUS 401',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [77, 216]
  },
  {
    'course_code': 'MKT 414',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [134, 101]
  },
  {
    'course_code': 'MIS 427',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [154, 52]
  },
  {
    'course_code': 'MIS 427',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [155, 53]
  },
  {
    'course_code': 'MIS 316',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 7, 'minute': 30},
      'end_time': {'hour': 8, 'minute': 0}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'sections': [159, 40]
  },
  {
    'course_code': 'MIS 316',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 7, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [159, 40]
  },
  {
    'course_code': 'MIS 316',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [161, 41]
  },
  {
    'course_code': 'LAW 341',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [339, 198]
  },
  {
    'course_code': 'LAW 422',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [590, 566]
  },
  {
    'course_code': 'PHL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [305, 379]
  },
  {
    'course_code': 'ARB 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 10, 'minute': 45}
    },
    'sections': [264, 343]
  },
  {
    'course_code': 'ISL 110.',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 10, 'minute': 45}
    },
    'sections': [602, 584]
  },
  {
    'course_code': 'SWE 411',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [215, 447]
  },
  {
    'course_code': 'NES 483',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [212, 264]
  },
  {
    'course_code': 'SWE 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [187, 25]
  },
  {
    'course_code': 'CIS 104',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 50}
    },
    'sections': [188, 121]
  },
  {
    'course_code': 'CIS 104',
    'activity': 'Lab',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'sections': [189, 123]
  },
  {
    'course_code': 'CIS 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [518, 470]
  },
  {
    'course_code': 'CIS 201',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [521, 471]
  },
  {
    'course_code': 'ARC 315',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [276, 361]
  },
  {
    'course_code': 'ARC A 423',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 9, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 10, 'minute': 45}
    },
    'sections': [319, 367]
  },
  {
    'course_code': 'IAR 413',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 9, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [318, 327]
  },
  {
    'course_code': 'ARC 213',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 9, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 10, 'minute': 45}
    },
    'sections': [280, 350]
  },
  {
    'course_code': 'ARC 214',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 9, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 10, 'minute': 45}
    },
    'sections': [286, 352]
  },
  {
    'course_code': 'IEG 304',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 8, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 35},
      'end_time': {'hour': 10, 'minute': 10}
    },
    'sections': [626, 601]
  },
  {
    'course_code': 'IEG 304',
    'activity': '',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [626, 601]
  },
  {
    'course_code': 'IEG 304',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 10, 'minute': 45}
    },
    'sections': [627, 602]
  },
  {
    'course_code': 'IEG 311',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 8, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 35},
      'end_time': {'hour': 10, 'minute': 10}
    },
    'sections': [462, 283]
  },
  {
    'course_code': 'IEG 311',
    'activity': '',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [462, 283]
  },
  {
    'course_code': 'IEG 311',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 10, 'minute': 45}
    },
    'sections': [463, 282]
  },
  {
    'course_code': 'IEG 312',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 8, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 35},
      'end_time': {'hour': 10, 'minute': 10}
    },
    'sections': [425, 285]
  },
  {
    'course_code': 'IEG 312',
    'activity': '',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [425, 285]
  },
  {
    'course_code': 'IEG 312',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 10, 'minute': 45}
    },
    'sections': [426, 284]
  },
  {
    'course_code': 'IEG 430',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [464, 313]
  },
  {
    'course_code': 'IEG 430',
    'activity': '',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 8, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 35},
      'end_time': {'hour': 10, 'minute': 10}
    },
    'sections': [464, 313]
  },
  {
    'course_code': 'IEG 430',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 10, 'minute': 10},
      'end_time': {'hour': 10, 'minute': 45}
    },
    'sections': [465, 312]
  },
  {
    'course_code': 'IEG 345',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 0}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [436, 303]
  },
  {
    'course_code': 'IEG 345',
    'activity': '',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 13, 'minute': 10},
      'end_time': {'hour': 13, 'minute': 45}
    },
    'sections': [436, 303]
  },
  {
    'course_code': 'IEG 345',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 10, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 11, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 35}
    },
    'sections': [437, 302]
  },
  {
    'course_code': 'IEG 345',
    'activity': 'Lab',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 8, 'minute': 0},
      'end_time': {'hour': 9, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 9, 'minute': 50},
      'end_time': {'hour': 11, 'minute': 0}
    },
    'sections': [438, 304]
  },
  {
    'course_code': 'MGT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [115, 66]
  },
  {
    'course_code': 'ECO 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [37, 397]
  },
  {
    'course_code': 'MKT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [138, 92]
  },
  {
    'course_code': 'ACC 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [24, 146]
  },
  {
    'course_code': 'ACC 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [28, 148]
  },
  {
    'course_code': 'ACC 418',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [33, 154]
  },
  {
    'course_code': 'FIN 415',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [48, 414]
  },
  {
    'course_code': 'MKT 312',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [143, 95]
  },
  {
    'course_code': 'ECO 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [41, 399]
  },
  {
    'course_code': 'MIS 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [156, 435]
  },
  {
    'course_code': 'BUS 401',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [618, 589]
  },
  {
    'course_code': 'BUS 304',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [59, 210]
  },
  {
    'course_code': 'MIS 430',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [168, 55]
  },
  {
    'course_code': 'FIN 311',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [460]
  },
  {
    'course_code': 'LAW 335 / LAW 424',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [344, 542, 197, 482]
  },
  {
    'course_code': 'LAW 224',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 45}
    },
    'sections': [361]
  },
  {
    'course_code': 'LAW 119',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 45}
    },
    'sections': [584, 559]
  },
  {
    'course_code': 'ENG 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [283, 424]
  },
  {
    'course_code': 'ARB 110.',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 11, 'minute': 45}
    },
    'sections': [603]
  },
  {
    'course_code': 'ECL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [117, 88]
  },
  {
    'course_code': 'NES 342',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [206, 260]
  },
  {
    'course_code': 'SWE 401',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [214, 446]
  },
  {
    'course_code': 'NES 212',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 0}
    },
    'sections': [201, 254]
  },
  {
    'course_code': 'CIS 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'sections': [177, 114]
  },
  {
    'course_code': 'CIS 103',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [178, 118]
  },
  {
    'course_code': 'CIS 103',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 12, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [625]
  },
  {
    'course_code': 'ARC 212',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 40}
    },
    'sections': [273, 348]
  },
  {
    'course_code': 'ARC 215',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 40}
    },
    'sections': [261, 354]
  },
  {
    'course_code': 'ARC 511',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 14, 'minute': 40}
    },
    'sections': [248, 366]
  },
  {
    'course_code': 'ARC 511',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 14, 'minute': 40}
    },
    'sections': [467]
  },
  {
    'course_code': 'IAR A 423',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [295, 57]
  },
  {
    'course_code': 'ARCH 113',
    'activity': 'Laboratory',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 9, 'minute': 30},
      'end_time': {'hour': 11, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [271, 376]
  },
  {
    'course_code': 'IEG 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [621, 596]
  },
  {
    'course_code': 'IEG 201',
    'activity': 'Tut',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 12, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 12, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 55}
    },
    'sections': [622, 597]
  },
  {
    'course_code': 'IEG 201',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 11, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [623, 598]
  },
  {
    'course_code': 'IEG 351',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 12, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 12, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 55}
    },
    'sections': [454, 306]
  },
  {
    'course_code': 'IEG 351',
    'activity': '',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 11, 'minute': 0},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [454, 306]
  },
  {
    'course_code': 'IEG 351',
    'activity': 'Tut',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 11, 'minute': 10},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'sections': [455, 305]
  },
  {
    'course_code': 'MGT 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [102, 62]
  },
  {
    'course_code': 'MGT 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [130, 70]
  },
  {
    'course_code': 'MGT 305',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [125, 79]
  },
  {
    'course_code': 'FIN 418',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [38, 417]
  },
  {
    'course_code': 'MKT 312',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [144, 96]
  },
  {
    'course_code': 'MKT 415',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [139, 102]
  },
  {
    'course_code': 'MKT 418',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [148, 105]
  },
  {
    'course_code': 'ECO 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [42, 400]
  },
  {
    'course_code': 'MIS 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [162, 436]
  },
  {
    'course_code': 'MIS 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [612, 582]
  },
  {
    'course_code': 'FIN 414',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [46, 413]
  },
  {
    'course_code': 'BUS 304',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [63, 212]
  },
  {
    'course_code': 'BUS 385',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [74, 214]
  },
  {
    'course_code': 'ACC 428',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [32, 156]
  },
  {
    'course_code': 'MIS 431',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [174, 56]
  },
  {
    'course_code': 'FIN 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [461]
  },
  {
    'course_code': 'LAW 205',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [572, 547]
  },
  {
    'course_code': 'LAW 328',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [591, 567]
  },
  {
    'course_code': 'LAW 212',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [330]
  },
  {
    'course_code': 'LAW 227',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [348]
  },
  {
    'course_code': 'ENG 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [289, 427]
  },
  {
    'course_code': 'ENG 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [299, 433]
  },
  {
    'course_code': 'PHL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [310, 381]
  },
  {
    'course_code': 'ARB 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [257, 338]
  },
  {
    'course_code': 'ISL 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 5}
    },
    'sections': [234, 248]
  },
  {
    'course_code': 'MTH 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [57, 219]
  },
  {
    'course_code': 'STT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [56, 403]
  },
  {
    'course_code': 'STT 203',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [94, 408]
  },
  {
    'course_code': 'ENR 203',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [96, 39]
  },
  {
    'course_code': 'SWE 321',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [179, 443]
  },
  {
    'course_code': 'CIS 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'sections': [170, 126]
  },
  {
    'course_code': 'ARC 411',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [247, 363]
  },
  {
    'course_code': 'ARC 411',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 11, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [464]
  },
  {
    'course_code': 'MGT 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [109, 63]
  },
  {
    'course_code': 'MGT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [116, 67]
  },
  {
    'course_code': 'MGT 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [131, 71]
  },
  {
    'course_code': 'MGT 305',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [64, 77]
  },
  {
    'course_code': 'BUS 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [300, 208]
  },
  {
    'course_code': 'BUS 404',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [85, 218]
  },
  {
    'course_code': 'ACC 311',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [34, 151]
  },
  {
    'course_code': 'FIN 411',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [47, 412]
  },
  {
    'course_code': 'MKT 311',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [135, 94]
  },
  {
    'course_code': 'MGT 425',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [60, 83]
  },
  {
    'course_code': 'MGT 300',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [78, 73]
  },
  {
    'course_code': 'LAW 333',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [349]
  },
  {
    'course_code': 'LAW 216 / LAW 304',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [568, 567, 543]
  },
  {
    'course_code': 'LAW 404',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [376, 203]
  },
  {
    'course_code': 'LAW 321',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 0}
    },
    'sections': [374, 189]
  },
  {
    'course_code': 'ENG 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [285, 425]
  },
  {
    'course_code': 'ENG 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [290, 429]
  },
  {
    'course_code': 'SOS 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [563, 541]
  },
  {
    'course_code': 'PSY 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [311, 35]
  },
  {
    'course_code': 'ARB 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 0}
    },
    'sections': [252, 334]
  },
  {
    'course_code': 'ARB 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 0}
    },
    'sections': [260, 341]
  },
  {
    'course_code': 'ISL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 0}
    },
    'sections': [221, 235]
  },
  {
    'course_code': 'ISL 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 0}
    },
    'sections': [230, 244]
  },
  {
    'course_code': 'ISL 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 13, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 0}
    },
    'sections': [235]
  },
  {
    'course_code': 'MTH 104',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [68, 225]
  },
  {
    'course_code': 'MTH 106',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [80, 226]
  },
  {
    'course_code': 'MTH 304 / MTH 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [55, 705, 233]
  },
  {
    'course_code': 'STT 102',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [95, 405]
  },
  {
    'course_code': 'STT 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [89, 59]
  },
  {
    'course_code': 'PHY 103',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [107, 385]
  },
  {
    'course_code': 'PHY 103',
    'activity': 'Lab',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [108, 388]
  },
  {
    'course_code': 'PHY 203',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [101, 391]
  },
  {
    'course_code': 'PHY 203',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [103, 394]
  },
  {
    'course_code': 'CHM 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [120, 28]
  },
  {
    'course_code': 'CHM 101',
    'activity': 'Lab',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [121, 30]
  },
  {
    'course_code': 'SWE 300',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [184, 440]
  },
  {
    'course_code': 'NES 212',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [629, 603]
  },
  {
    'course_code': 'NES 482',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [196, 267]
  },
  {
    'course_code': 'NES 482',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 35}
    },
    'sections': [197, 268]
  },
  {
    'course_code': 'ARC 311',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [246, 357]
  },
  {
    'course_code': 'ARC 311',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 12, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 15, 'minute': 45}
    },
    'sections': [466]
  },
  {
    'course_code': 'ARC 216',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 15}
    },
    'sections': [277, 356]
  },
  {
    'course_code': 'ARC 211',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 15, 'minute': 25}
    },
    'sections': [346]
  },
  {
    'course_code': 'ARC 211',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 15, 'minute': 25}
    },
    'sections': [263, 585]
  },
  {
    'course_code': 'IEG 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 35}
    },
    'sections': [422, 276]
  },
  {
    'course_code': 'IEG 302',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 35}
    },
    'sections': [423, 275]
  },
  {
    'course_code': 'IEG 341',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 13, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 0}
    },
    'sections': [433, 297]
  },
  {
    'course_code': 'IEG 341',
    'activity': '',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 35}
    },
    'sections': [433, 297]
  },
  {
    'course_code': 'IEG 341',
    'activity': 'Tut',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 15, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 35},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [434, 296]
  },
  {
    'course_code': 'IEG 341',
    'activity': 'Lab',
    'regular_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [3],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [435, 295]
  },
  {
    'course_code': 'IEG 342',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 35}
    },
    'sections': [427, 300]
  },
  {
    'course_code': 'IEG 342',
    'activity': '',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 13, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 0}
    },
    'sections': [427, 300]
  },
  {
    'course_code': 'IEG 342',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 15, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 35},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [428, 299]
  },
  {
    'course_code': 'IEG 342',
    'activity': 'Lab',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [429, 301]
  },
  {
    'course_code': 'IEG 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 35}
    },
    'sections': [444]
  },
  {
    'course_code': 'IEG 201',
    'activity': 'Tut',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 15, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 35},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [445]
  },
  {
    'course_code': 'IEG 201',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [446]
  },
  {
    'course_code': 'IEG 304',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 13, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 0}
    },
    'sections': [281]
  },
  {
    'course_code': 'IEG 304',
    'activity': '',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 14, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 14, 'minute': 35}
    },
    'sections': [281]
  },
  {
    'course_code': 'IEG 304',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [280]
  },
  {
    'course_code': 'BUS 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [53, 207]
  },
  {
    'course_code': 'MIS 423',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [175, 50]
  },
  {
    'course_code': 'MIS 423',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [176, 51]
  },
  {
    'course_code': 'LAW 118',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [580, 555]
  },
  {
    'course_code': 'LAW 229',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 14, 'minute': 55}
    },
    'sections': [532, 472]
  },
  {
    'course_code': 'LAW 115',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 14, 'minute': 55}
    },
    'sections': [373, 167]
  },
  {
    'course_code': 'LAW 122',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 14, 'minute': 55}
    },
    'sections': [369]
  },
  {
    'course_code': 'LAW 221',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 14, 'minute': 55}
    },
    'sections': [350, 179]
  },
  {
    'course_code': 'ENG 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [291, 428]
  },
  {
    'course_code': 'SOS 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [469, 26]
  },
  {
    'course_code': 'CHI 107',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [611, 581]
  },
  {
    'course_code': 'ISL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 14, 'minute': 55}
    },
    'sections': [222, 236]
  },
  {
    'course_code': 'ISL 401',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 14, 'minute': 55}
    },
    'sections': [238, 252]
  },
  {
    'course_code': 'MTH 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [83, 231]
  },
  {
    'course_code': 'MTH 204 / MTH 211',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [90, 704, 229]
  },
  {
    'course_code': 'CIS 383',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 10}
    },
    'sections': [213, 135]
  },
  {
    'course_code': 'CIS 221',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [190, 128]
  },
  {
    'course_code': 'CIS 221',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [191, 130]
  },
  {
    'course_code': 'SWE 312',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [210, 442]
  },
  {
    'course_code': 'SWE 312',
    'activity': 'Lab',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [607, 577]
  },
  {
    'course_code': 'MEG 211',
    'activity': 'Lecture',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'sections': [456, 450]
  },
  {
    'course_code': 'MEG 211',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 16, 'minute': 30},
      'end_time': {'hour': 17, 'minute': 20}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 16, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 35}
    },
    'sections': [457, 449]
  },
  {
    'course_code': 'MEG 211',
    'activity': 'Lab',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 0},
      'end_time': {'hour': 15, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 13, 'minute': 25},
      'end_time': {'hour': 15, 'minute': 5}
    },
    'sections': [458, 451]
  },
  {
    'course_code': 'ARCH 111',
    'activity': 'Laboratory',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 16, 'minute': 0}
    },
    'sections': [240, 371]
  },
  {
    'course_code': 'ARCH 111',
    'activity': 'Laboratory',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 16, 'minute': 0}
    },
    'sections': [241, 372]
  },
  {
    'course_code': 'ARCH 102',
    'activity': 'Laboratory',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 14, 'minute': 20},
      'end_time': {'hour': 16, 'minute': 0}
    },
    'sections': [253, 370]
  },
  {
    'course_code': 'LAW 223',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 15, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 55}
    },
    'sections': [366, 181]
  },
  {
    'course_code': 'LAW 345',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 15, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 55}
    },
    'sections': [331, 202]
  },
  {
    'course_code': 'ISL 101',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 15, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 55}
    },
    'sections': [223, 237]
  },
  {
    'course_code': 'ISL 401',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 15, 'minute': 30},
      'end_time': {'hour': 16, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 15, 'minute': 20},
      'end_time': {'hour': 15, 'minute': 55}
    },
    'sections': [239, 253]
  },
  {
    'course_code': 'IEG 322',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2],
      'start_time': {'hour': 16, 'minute': 0},
      'end_time': {'hour': 17, 'minute': 50}
    },
    'ramadan_time': {
      'days': [2],
      'start_time': {'hour': 15, 'minute': 20},
      'end_time': {'hour': 16, 'minute': 30}
    },
    'sections': [636, 614]
  },
  {
    'course_code': 'IEG 322',
    'activity': '',
    'regular_time': {
      'days': [5],
      'start_time': {'hour': 16, 'minute': 30},
      'end_time': {'hour': 17, 'minute': 20}
    },
    'ramadan_time': {
      'days': [5],
      'start_time': {'hour': 15, 'minute': 50},
      'end_time': {'hour': 16, 'minute': 25}
    },
    'sections': [636, 614]
  },
  {
    'course_code': 'IEG 322',
    'activity': 'Tut',
    'regular_time': {
      'days': [4],
      'start_time': {'hour': 16, 'minute': 0},
      'end_time': {'hour': 17, 'minute': 50}
    },
    'ramadan_time': {
      'days': [4],
      'start_time': {'hour': 15, 'minute': 20},
      'end_time': {'hour': 16, 'minute': 30}
    },
    'sections': [637, 615]
  },
  {
    'course_code': 'LAW 343',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 16, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 35}
    },
    'sections': [340, 200]
  },
  {
    'course_code': 'LAW 213',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 16, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 35}
    },
    'sections': [365, 175]
  },
  {
    'course_code': 'ARB 202',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 16, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 35}
    },
    'sections': [258, 339]
  },
  {
    'course_code': 'ARB 302',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 16, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 35}
    },
    'sections': [265, 344]
  },
  {
    'course_code': 'ISL 201',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 16, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 35}
    },
    'sections': [231, 245]
  },
  {
    'course_code': 'ISL 301',
    'activity': 'Lecture',
    'regular_time': {
      'days': [2, 4],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 14, 'minute': 20}
    },
    'ramadan_time': {
      'days': [2, 4],
      'start_time': {'hour': 16, 'minute': 0},
      'end_time': {'hour': 16, 'minute': 35}
    },
    'sections': [236, 250]
  }
];
