import 'package:alyamamah/ui/views/courses/models/time_mapping.dart';

final interlinkMappingParsed = interlinkMapping.map((e) {
  return TimeMapping.fromMap(e);
}).toList();

const interlinkMapping = [
  {
    'course_code': 'MTH 001',
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
    'sections': [452]
  },
  {
    'course_code': 'MTH 001',
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
    'sections': [324]
  },
  {
    'course_code': 'MTH 001',
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
    'sections': [453]
  },
  {
    'course_code': 'MTH 001',
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
    'sections': [325]
  },
  {
    'course_code': 'MTH 001',
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
    'sections': [454]
  },
  {
    'course_code': 'MTH 001',
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
    'sections': [326]
  },
  {
    'course_code': 'MTH 001',
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
    'sections': [455]
  },
  {
    'course_code': 'MTH 001',
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
    'sections': [327]
  },
  {
    'course_code': 'MTH 001',
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
    'sections': [456]
  },
  {
    'course_code': 'MTH 001',
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
    'sections': [328]
  },
  {
    'course_code': 'CELP 03-A',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [707]
  },
  {
    'course_code': 'ORN 01-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [708]
  },
  {
    'course_code': 'ORN 01-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [709]
  },
  {
    'course_code': 'ORN 01-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [710]
  },
  {
    'course_code': 'ORN 02-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [711]
  },
  {
    'course_code': 'ORN 02-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [712]
  },
  {
    'course_code': 'ORN 03-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [713]
  },
  {
    'course_code': 'ORN 03-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [714]
  },
  {
    'course_code': 'ORN 03-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [715]
  },
  {
    'course_code': 'ORN 04-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [716]
  },
  {
    'course_code': 'ORN 04-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [717]
  },
  {
    'course_code': 'ORN 04-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [718]
  },
  {
    'course_code': 'ORN 05-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [719]
  },
  {
    'course_code': 'ORN 05-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [720]
  },
  {
    'course_code': 'ORN 05-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [721]
  },
  {
    'course_code': 'CELP 03-A',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [642]
  },
  {
    'course_code': 'ORN 01-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [643]
  },
  {
    'course_code': 'ORN 02-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [644]
  },
  {
    'course_code': 'ORN 02-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [645]
  },
  {
    'course_code': 'ORN 03-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [646]
  },
  {
    'course_code': 'ORN 04-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [648]
  },
  {
    'course_code': 'ORN 04-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [649]
  },
  {
    'course_code': 'ORN 04-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [650]
  },
  {
    'course_code': 'ORN 05-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [651]
  },
  {
    'course_code': 'ORN 05-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [652]
  },
  {
    'course_code': 'ORN 05-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 8, 'minute': 30},
      'end_time': {'hour': 10, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 0},
      'end_time': {'hour': 11, 'minute': 10}
    },
    'sections': [653]
  },
  {
    'course_code': 'CELP 02-A',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [706]
  },
  {
    'course_code': 'CELP 03-B',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [723]
  },
  {
    'course_code': 'ORN 01-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [725]
  },
  {
    'course_code': 'ORN 01-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [724]
  },
  {
    'course_code': 'ORN 02-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [726]
  },
  {
    'course_code': 'ORN 02-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [727]
  },
  {
    'course_code': 'ORN 03-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [728]
  },
  {
    'course_code': 'ORN 03-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [729]
  },
  {
    'course_code': 'ORN 04-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [730]
  },
  {
    'course_code': 'ORN 04-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [731]
  },
  {
    'course_code': 'ORN 05-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [732]
  },
  {
    'course_code': 'ORN 05-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [733]
  },
  {
    'course_code': 'ORN 05-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [734]
  },
  {
    'course_code': 'CELP 02-A',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [641]
  },
  {
    'course_code': 'CELP 03-B',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [656]
  },
  {
    'course_code': 'ORN 01-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [657]
  },
  {
    'course_code': 'ORN 02-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [658]
  },
  {
    'course_code': 'ORN 02-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [659]
  },
  {
    'course_code': 'ORN 03-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [660]
  },
  {
    'course_code': 'ORN 03-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [661]
  },
  {
    'course_code': 'ORN 04-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [662]
  },
  {
    'course_code': 'ORN 04-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [663]
  },
  {
    'course_code': 'ORN 05-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [664]
  },
  {
    'course_code': 'ORN 05-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [665]
  },
  {
    'course_code': 'ORN 05-C',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 10, 'minute': 30},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 11, 'minute': 20},
      'end_time': {'hour': 12, 'minute': 30}
    },
    'sections': [666]
  },
  {
    'course_code': 'CELP 02-B',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [722]
  },
  {
    'course_code': 'CELP 02-B',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [655]
  },
  {
    'course_code': 'ORN 03-R',
    'activity': 'Lecture',
    'regular_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 13, 'minute': 30},
      'end_time': {'hour': 15, 'minute': 30}
    },
    'ramadan_time': {
      'days': [1, 2, 3, 4, 5],
      'start_time': {'hour': 13, 'minute': 50},
      'end_time': {'hour': 15, 'minute': 0}
    },
    'sections': [647]
  }
];
