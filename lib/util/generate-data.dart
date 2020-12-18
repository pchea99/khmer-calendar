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
			'other': {
        '28': {
          'en': "Meak Bochea",
          'kh': "ពិធីបុណ្យមាឃបូជា",
          'index': 1
        }
      }
		},
		'february': {
			'holiday': {},
			'other': {
        '11-12-13-14': {
          'en': "Chinese New Year",
          'kh': "ពិធីបុណ្យចូលឆ្នាំចិន",
          'index': 1
        },
        '14': {
          'en': "Valentine's Day",
          'kh': "ថ្ងៃបុណ្យនៃសេចក្តីស្រលាញ់",
          'index': 2
        },
        '21': {
          'en': "National Day on Maternal, Newborn and Child Health",
          'kh': "ទិវាជាតិសុខភាពមាតា និងទារក",
          'index': 3
        },
        '26': {
          'en': "Spirit Parade",
          'kh': "ហែអ្នកតាចិន",
          'index': 4
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
			'other': {
        '3': {
          'en': "National Culture Day",
          'kh': "ទិវាវប្បធម៌ជាតិ",
          'index': 1
        },
        '24': {
          'en': "World Tuberculosis Day",
          'kh': "ទិវាពិភពលោកកំចាត់ជម្ងឺរបេង",
          'index': 2
        },
      }
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
			'other': {
        '5': {
          'en': "Tomb-Sweeping Day - Qingming Festival",
          'kh': "ឆេងម៉េង",
          'index': 1
        },
        '7': {
          'en': "World Health Day",
          'kh': "ទិវាសុខភាពពិភពលោក",
          'index': 2
        },
        '30': {
          'en': "Cambodia joined The Association of Southeast Asian Nation - ASEAN",
          'kh': "កម្ពុជាចូលជាសមាជិកអាស៊ាន",
          'index': 3
        },
      }
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
			'other': {
        '3': {
          'en': "World Press Freedom Day",
          'kh': "ទិវាសេរីភាពសារពត៌មានពិភពលោក",
          'index': 1
        },
        '8': {
          'en': "World Red Cross and Red Crescent Day",
          'kh': "ទិវាពិភពលោកកាកបាទក្រហម អឌ្ឍចន្ទក្រហម",
          'index': 2
        },
        '20': {
          'en': "National Day of Remembrance",
          'kh': "ទិវាជាតិនៃការចងចាំ",
          'index': 3
        },
      }
		},
		'june': {
			'holiday': {
				'18': {
					'en': "Queen Norodom Monineath Sihanouk's Birthday",
					'kh': "ព្រះរាជពិធីចម្រើនព្រះជន្មសម្តេច​ ព្រះមហាក្សត្រី នរោត្តម មុនីនាថ សីហនុ",
					'index': 1
				},
			},
			'other': {
        '1': {
          'en': "International Children's Day",
          'kh': "ទិវាកុមារអន្តរជាតិ",
          'index': 1
        },
        '5': {
          'en': "National and World Environment Day",
          'kh': "ទិវាបរិស្ថានជាតិ និងបរស្ថានពិភពលោក",
          'index': 2
        },
        '12': {
          'en': "Happy World Day Against Child Labour",
          'kh': "ទិវាពិភពលោកប្រឆាំងពលកម្មកុមារ",
          'index': 3
        },
        '14': {
          'en': "Sticky Rice Dumplings - Zongzi",
          'kh': "សែននំចាំង",
          'index': 4
        },
        '15': {
          'en': "International Court of Justice in The Hague declared Cambodia is the owner of the Preah Vihear Temple",
          'kh': "តុលាការយុត្តិធម៌អន្តរជាតិក្រុងឡាអេ សម្រចឱ្យកម្ពុជាជាម្ចាស់កម្មសិទ្ធិ លើប្រាសាទព្រះវិហារ",
          'index': 5
        },
        '26': {
          'en': "International Day Against Drug Abuse and Illicit Trafficking",
          'kh': "ទិវាអន្តរជាតិប្រយុទ្ធប្រឆាំងគ្រឿងញៀន",
          'index': 6
        },
      }
		},
		'july': {
			'holiday': {},
			'other': {
        '3': {
          'en': "Cambodia joined UNESCO",
          'kh': "កម្ពុជាចូលជាសមាជិកអង្គការយូណេស្កូ",
          'index': 1
        },
        '7': {
          'en': "Prasat Preah Vihear recognized as UNESCO's World Heritage",
          'kh': "ប្រាសាទព្រះវិហារ ត្រូវបានចុះក្នុងបញ្ជីបេតិកភណ្ឌពិភពលោក នៃអង្គការពិភពលោកយូណេស្កូ",
          'index': 2
        },
        '8': {
          'en': "Prasat Sambor Prei Kuk recognized as UNESCO's World Heritage",
          'kh': "ប្រាសាទសំបូរព្រៃគុក ត្រូវបានចុះក្នុងបញ្ជីបេតិកភណ្ឌពិភពលោក នៃអង្គការពិភពលោកយូណេស្កូ",
          'index': 3
        },
        '25': {
          'en': "Beginning of Buddhist Lent",
          'kh': "ចូលព្រះវស្សា",
          'index': 4
        },
        '31': {
          'en': "The archives of Tuol Sleng Genocide Museum are registered as part of the Memory of the World by UNESCO",
          'kh': "សារមន្ទីរឧក្រិដ្ឋកម្មប្រល័យពូជសាសន៍ទួលស្លែង ត្រូវបានចុះក្នុងបញ្ជីស្មារតីចងចាំ នៃអង្គការពិភពលោកយូណេស្កូ",
          'index': 5
        },
      }
		},
		'august': {
			'holiday': {},
			'other': {
        '22': {
          'en': "Ghost Festival",
          'kh': "សែនក្បាលទឹក",
          'index': 1
        },
      }
		},
		'september': {
			'holiday': {
				'24': {
					'en': "Cambodian Constitutional Day",
					'kh': "ទិវាប្រកាសប្រើរដ្ឋធម្មនុញ្ញ",
					'index': 1
				},
			},
			'other': {
        '21': {
          'en': "Mid-Autumn Festival",
          'kh': "សែនលោកខែ",
          'index': 1
        },
        '22': {
          'en': "Kan Ben Day",
          'kh': "ថ្ងៃកាន់បិណ្ឌ",
          'index': 2
        },
      }
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
			'other': {
        '21': {
          'en': "Ending of Buddhist Lent",
          'kh': "ចេញព្រះវស្សា",
          'index': 1
        },
        '22': {
          'en': "Kathen Kal",
          'kh': "កឋិនកាល",
          'index': 2
        },
        '23': {
          'en': "Paris Peace Agreement Day",
          'kh': "ទិវារំលឹកខួបនៃកិច្ចព្រមព្រៀងសន្តិភាពទីក្រុងប៉ារិស",
          'index': 3
        },
      }
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
			'other': {
        '7': {
          'en': "Royal Ballet of Cambodia inducted into the Representative List of the Intangible Cultural Heritage of Humanity",
          'kh': "របាំព្រះរាជទ្រព្យ ត្រូវបានចុះក្នុងបញ្ជីបេតិកភណ្ឌវប្បធម៌អរូបីនៃមនុស្សជាតិ",
          'index': 1
        },
        '25': {
          'en': "Khmer Shadow Theatre inducted into the Representative List of the Intangible Cultural Heritage of Humanity",
          'kh': "ល្ខោនស្រមោលស្បែក ត្រូវបានចុះក្នុងបញ្ជីបេតិកភណ្ឌវប្បធម៌អរូបីនៃមនុស្សជាតិ",
          'index': 2
        },
        '28': {
          'en': "Khmer Masked Theatre inducted into the Representative List of the Intangible Cultural Heritage in Need of Urgent Safeguarding",
          'kh': "ល្ខោនខោល ត្រូវបានចុះក្នុងបញ្ជីបេតិកភណ្ឌវប្បធម៌អរូបីនៃមនុស្សជាតិ",
          'index': 3
        },
        '30': {
          'en': "Chapei Dang Veng inducted into the Representative List of the Intangible Cultural Heritage in Need of Urgent Safeguarding",
          'kh': "ចាប៉ីដងវែង ត្រូវបានចុះក្នុងបញ្ជីបេតិកភណ្ឌវប្បធម៌អរូបីនៃមនុស្សជាតិ",
          'index': 4
        },
      }
		},
		'december': {
			'holiday': {},
			'other': {
        '2': {
          'en': "Tug of War inducted into the Representative List of the Intangible Cultural Heritage of Humanity",
          'kh': "ល្បែងទាញព្រ័ត្រ ត្រូវបានចុះក្នុងបញ្ជីបេតិកភណ្ឌវប្បធម៌អរូបីនៃមនុស្សជាតិ",
          'index': 1
        },
        '10': {
          'en': "Human Rights Day",
          'kh': "ទិវាសិទ្ធិមនុស្សអន្តរជាតិ",
          'index': 2
        },
        '14': {
          'en': "Angkor Wat recognized as UNESCO's World Heritage List",
          'kh': "ប្រាសាទអង្គរវត្ត ត្រូវបានបញ្ចូលក្នុងបញ្ជីបេតិកភណ្ឌពិភពលោក",
          'index': 3
        },
        '14 ': {
          'en': "Cambodia became a member of the United Nations",
          'kh': "កម្ពុជាចូលជាសមាជិកអង្គការសហប្រជាជាតិ",
          'index': 4
        },
        '21': {
          'en': "Winter Solstice Festival",
          'kh': "សែននំអ៉ី",
          'index': 5
        },
        '25': {
          'en': "Christmas Day",
          'kh': "បុណ្យគ្រិស្តម៉ាស",
          'index': 6
        },
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