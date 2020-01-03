import 'package:rdbCalendar/calendar/calendar-kh.dart';
import 'package:rdbCalendar/service/service.dart';

class GenerateData{
	/*Map _month = {
		'january': {
			'holiday': {
				'1': {
					'en': "International New Year Day",
					'kh': "ចូលឆ្នាំសកល",
					'index': 1
				},
				'7': {
					'en': "Victory Day Over the Genocidal Regime",
					'kh': "ទិវាជ័យជំនះលើរបបប្រល័យពូជសាសន៍",
					'index': 2
				}
			},
			'other': {}
		},
		'february': {
			'holiday': {
				'19': {
					'en': "MeakBochea Day",
					'kh': "ពិធីបុណ្យមាឃបូជា",
					'index': 1
				},
			},
			'other': {
				'14': {
					'en': "Valentine's Day",
					'kh': "ថ្ងៃបុណ្យនៃសេចក្តីស្រលាញ់",
					'index': 1
				}
			}
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
					'en': "Happy Khmer New Year",
					'kh': "ពីធីបុណ្យចូលឆ្នាំខ្មែរ ប្រពៃណីជាតិ",
					'index': 1
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
				'13-14-15': {
					'en': "King's Birthday, Norodom Sihamoni",
					'kh': "ព្រះរាជពិធីចម្រើនព្រះជន្ម ព្រះមហាក្សត្រ នរោត្តម សីហមុនី",
					'index': 2
				},
				'18': {
					'en': "Visak Bochea Day",
					'kh': "ពិធីបុណ្យវិសាខបូជា",
					'index': 3
				},
				'20': {
					'en': "National Day of Remembrance",
					'kh': "ទិវាជាតិនៃការចងចាំ",
					'index': 4
				},
				'22': {
					'en': "Royal Plowing Ceremony",
					'kh': "ព្រះរាជពិធីច្រត់ព្រះនង្គ័ល",
					'index': 5
				},
			},
			'other': {}
		},
		'june': {
			'holiday': {
				'1': {
					'en': "International Children's Day",
					'kh': "ទិវាកុមារអន្តរជាតិ",
					'index': 1
				},
				'18': {
					'en': "King's Mother Birthday, Norodom Monineath Sihanouk",
					'kh': "ព្រះរាជពិធីចម្រើនព្រះជន្ម​ ព្រះមហាក្សត្រី ព្រះវររាជមាតាជាតិខ្មែរ",
					'index': 2
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
					'en': "Constitutional Day",
					'kh': "ទិវាប្រកាសប្រើរដ្ឋធម្មនុញ្ញ",
					'index': 1
				},
				'27-28-29': {
					'en': "Pchum Ben Day",
					'kh': "ពិធីបុណ្យភ្ជុំបិណ្ឌ",
					'index': 2
				}
			},
			'other': {
				'14-26': {
					'en': "Kan Ben Day",
					'kh': "ថ្ងៃកាន់បិណ្ឌ",
					'index': 1
				}
			}
		},
		'october': {
			'holiday': {
				'15': {
					'en': "Commemoration Day of Father King Norodom Sihanouk",
					'kh': "ទិវាគោរពព្រះវិញ្ញាណក្ខន្ធ ព្រះបរមរតនកោដិ",
					'index': 1
				},
				'23': {
					'en': "Paris Peace Agreement's Day",
					'kh': "កិច្ចព្រមព្រៀងសន្តិភាពទីក្រុងប៉ារីស",
					'index': 2
				},
				'29': {
					'en': "King's Coronation Day, Norodom Sihamoni",
					'kh': "ទិវារាជាភិសេកព្រះមហាក្សត្រនៃព្រះរាជាណាចក្រកម្ពុជា",
					'index': 3
				},
			},
			'other': {}
		},
		'november': {
			'holiday': {
				'9': {
					'en': "Independence Day",
					'kh': "បុណ្យឯករាជ្យជាតិ",
					'index': 1
				},
				'10-11-12': {
					'en': "Water Festival",
					'kh': "ពិធីបុណ្យអុំទូក​ បណ្តែតប្រទីប សំពះព្រះខែ និងអកអំបុក",
					'index': 2
				}
			},
			'other': {}
		},
		'december': {
			'holiday': {
				'10': {
					'en': "International Human Rights Day",
					'kh': "ទិវាសិទ្ធមនុស្ស",
					'index': 1
				}
			},
			'other': {}
		},
	};*/

	Map _month = {
		'january': {
			'holiday': {
				'1': {
					'en': "International New Year Day",
					'kh': "ចូលឆ្នាំសកល",
					'index': 1
				},
				'7': {
					'en': "Victory Day Over the Genocidal Regime",
					'kh': "ទិវាជ័យជំនះលើរបបប្រល័យពូជសាសន៍",
					'index': 2
				}
			},
			'other': {
				'24': {
					'en': "Chinese New Year's Eve",
					'kh': "ថ្ងៃសែនចូលឆ្នាំចិន",
					'index': 1
				},
				'25': {
					'en': "Chinese New Year Day",
					'kh': "ចូលឆ្នាំចិន​ ឆ្នាំជូត​",
					'index': 2
				},
				'26': {
					'en': "Chinese New Year Day",
					'kh': "ចូលឆ្នាំចិន​ ឆ្នាំជូត",
					'index': 3
				},
				'27': {
					'en': "Chinese New Year Day",
					'kh': "ចូលឆ្នាំចិន​ ឆ្នាំជូត",
					'index': 4
				}
			}
		},
		'february': {
			'holiday': {},
			'other': {
				'14': {
					'en': "Valentine's Day",
					'kh': "ថ្ងៃបុណ្យនៃសេចក្តីស្រលាញ់",
					'index': 1
				},
				'19': {
					'en': "MeakBochea Day",
					'kh': "ពិធីបុណ្យមាឃបូជា",
					'index': 2
				},
			}
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
				'13-14-15-16': {
					'en': "Happy Khmer New Year",
					'kh': "ពីធីបុណ្យចូលឆ្នាំខ្មែរ ប្រពៃណីជាតិ",
					'index': 1
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
				'6': {
					'en': "Visak Bochea Day",
					'kh': "ពិធីបុណ្យវិសាខបូជា",
					'index': 2
				},
				'10': {
					'en': "Royal Plowing Ceremony",
					'kh': "ព្រះរាជពិធីច្រត់ព្រះនង្គ័ល",
					'index': 3
				},
				'14': {
					'en': "King's Birthday, Norodom Sihamoni",
					'kh': "ព្រះរាជពិធីចម្រើនព្រះជន្ម ព្រះមហាក្សត្រ នរោត្តម សីហមុនី",
					'index': 4
				},
			},
			'other': {
				'20': {
					'en': "National Day of Remembrance",
					'kh': "ទិវាជាតិនៃការចងចាំ",
					'index': 1
				},
			}
		},
		'june': {
			'holiday': {
				'18': {
					'en': "King's Mother Birthday, Norodom Monineath Sihanouk",
					'kh': "ព្រះរាជពិធីចម្រើនព្រះជន្ម​ ព្រះមហាក្សត្រី ព្រះវររាជមាតាជាតិខ្មែរ",
					'index': 1
				},
			},
			'other': {
				'1': {
					'en': "International Children's Day",
					'kh': "ទិវាកុមារអន្តរជាតិ",
					'index': 1
				},
			}
		},
		'july': {
			'holiday': {},
			'other': {
				'6': {
					'en': "Jol Preah Vosa",
					'kh': "ចូលព្រះវស្សា",
					'index': 1
				}
			}
		},
		'august': {
			'holiday': {},
			'other': {}
		},
		'september': {
			'holiday': {
				'16-17-18': {
					'en': "Pchum Ben Day",
					'kh': "ពិធីបុណ្យភ្ជុំបិណ្ឌ",
					'index': 1
				},
				'24': {
					'en': "Constitutional Day",
					'kh': "ទិវាប្រកាសប្រើរដ្ឋធម្មនុញ្ញ",
					'index': 2
				},
			},
			'other': {
				'3-15': {
					'en': "Kan Ben Day",
					'kh': "ថ្ងៃកាន់បិណ្ឌ",
					'index': 1
				}
			}
		},
		'october': {
			'holiday': {
				'15': {
					'en': "Commemoration Day of Father King Norodom Sihanouk",
					'kh': "ទិវាគោរពព្រះវិញ្ញាណក្ខន្ធ ព្រះបរមរតនកោដិ",
					'index': 1
				},
				'29': {
					'en': "King's Coronation Day, Norodom Sihamoni",
					'kh': "ទិវារាជាភិសេកព្រះមហាក្សត្រនៃព្រះរាជាណាចក្រកម្ពុជា",
					'index': 2
				},
				'30-31': {
					'en': "Water Festival",
					'kh': "ពិធីបុណ្យអុំទូក​ បណ្តែតប្រទីប សំពះព្រះខែ និងអកអំបុក",
					'index': 3
				},
			},
			'other': {}
		},
		'november': {
			'holiday': {
				'1': {
					'en': "Water Festival",
					'kh': "ពិធីបុណ្យអុំទូក​ បណ្តែតប្រទីប សំពះព្រះខែ និងអកអំបុក",
					'index': 1
				},
				'9': {
					'en': "Independence Day",
					'kh': "បុណ្យឯករាជ្យជាតិ",
					'index': 2
				},
			},
			'other': {}
		},
		'december': {
			'holiday': {},
			'other': {
				'10': {
					'en': "International Human Rights Day",
					'kh': "ទិវាសិទ្ធមនុស្ស",
					'index': 1
				}
			}
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