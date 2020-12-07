import 'package:rdbCalendar/calendar/calendar-kh.dart';
import 'package:rdbCalendar/service/service.dart';

class GenerateData{
	Map _month = {
		'january': {
			'holiday': {
				'1': {
					'en': "International New Year's Day",
					'kh': "ចូលឆ្នាំសកល",
					'index': 1
				},
				'7': {
					'en': "Victory over Genocide Day",
					'kh': "ទិវាជ័យជម្នះលើរបបប្រល័យពូជសាសន៍",
					'index': 2
				}
			},
			'other': {}
		},
		'february': {
			'holiday': {},
			'other': {}
		},
		'march': {
			'holiday': {
				'8': {
					'en': "International Women's Day",
					'kh': "ទិវានារីអន្តរជាតិ",
					'index': 1
				},
			},
			'other': {}
		},
		'april': {
			'holiday': {
				'14-15-16': {
					'en': "Khmer New Year's Day",
					'kh': "ពីធីបុណ្យចូលឆ្នាំខ្មែរ ប្រពៃណីជាតិ",
					'index': 1
				},
        '26': {
					'en': "Visak Bochea Day",
					'kh': "ពិធីបុណ្យវិសាខបូជា",
					'index': 2
				},
        '30': {
					'en': "Royal Plowing Ceremony",
					'kh': "ព្រះរាជពិធីច្រត់ព្រះនង្គ័ល",
					'index': 3
				},
			},
			'other': {}
		},
		'may': {
			'holiday': {
				'1': {
					'en': "International Labor Day",
					'kh': "ទិវាពលកម្មអន្តរជាតិ",
					'index': 1
				},
				'14': {
					'en': "His Majesty King Norodom Sihamoni's Birthday",
					'kh': "ព្រះរាជពិធីចម្រើនព្រះជន្មព្រះករុណាព្រះបាទសម្តេច ព្រះបរមនាថ នរោត្តម សីហមុនី",
					'index': 2
				},
			},
			'other': {}
		},
		'june': {
			'holiday': {
				'18': {
					'en': "Queen Norodom Monineath Sihanouk's Birthday",
					'kh': "ព្រះរាជពិធីចម្រើនព្រះជន្មសម្តេច​ ព្រះមហាក្សត្រី នរោត្តម មុនីនាថ សីហនុ",
					'index': 1
				},
			},
			'other': {}
		},
		'july': {
			'holiday': {},
			'other': {}
		},
		'august': {
			'holiday': {},
			'other': {}
		},
		'september': {
			'holiday': {
				'24': {
					'en': "Cambodian Constitutional Day",
					'kh': "ទិវាប្រកាសប្រើរដ្ឋធម្មនុញ្ញ",
					'index': 1
				},
			},
			'other': {}
		},
		'october': {
			'holiday': {
        '5-6-7': {
          'en': "Pchum Ben Day",
          'kh': "ពិធីបុណ្យភ្ជុំបិណ្ឌ",
          'index': 1
        },
				'15': {
					'en': "Commemoration Day of King Norodom Sihanouk",
					'kh': "ទិវាគោរពព្រះវិញ្ញាណក្ខន្ត ព្រះបាទសម្តេចនរោត្តម សីហនុ ព្រះបរមរតនៈកោដ្ឋ",
					'index': 2
				},
				'29': {
					'en': "Coronation of King Norodom Sihamoni",
					'kh': "ព្រះរាជពីធីគ្រងរាជសម្បត្តិព្រះមហាក្សត្រ ព្រះករុណាព្រះបាទសម្តេច ព្រះបរមនាថ នរោត្តម សីហមុនី",
					'index': 3
				}
			},
			'other': {}
		},
		'november': {
			'holiday': {
				'9': {
					'en': "Cambodian Independence Day",
					'kh': "បុណ្យឯករាជ្យជាតិ",
					'index': 1
				},
        '18-19-20': {
          'en': "Water Festival",
          'kh': "ព្រះរាជពិធីបុណ្យអុំទូក​ បណ្តែតប្រទីប សំពះព្រះខែ និងអកអំបុក",
          'index': 2
        }
			},
			'other': {}
		},
		'december': {
			'holiday': {},
			'other': {}
		},
	};

	void createData(int numYear){
		Map year = new Map();
		_month.forEach((k, v){
			Map month = new Map();
			v.forEach((key, value){
				Map day = new Map();
				value.forEach((d, data){
					day[RDBCalendar.convertToKhmerNum(d)] = data;
				});
				month[key] = day;
			});
			year[k] = month;
		});

		ServiceFS().createData(numYear.toString(), year);
	}
}