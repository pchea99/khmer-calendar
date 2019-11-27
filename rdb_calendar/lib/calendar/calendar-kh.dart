import 'package:intl/intl.dart';
import 'package:rdb_calendar/core/config.dart';
import 'package:sprintf/sprintf.dart';

class RDBCalendar{
	static String _getCalendarLeap(int beYear) {
		String leap = _getBoditheyLeap(beYear);
		String leapP = _getBoditheyLeap(beYear - 1);

		if (leap == "MD") {
			return "M";
		}

		if (leapP == "MD") {
			return "D";
		}

		return leap;
	}

	static String _getBoditheyLeap(int beYear) {
		String str = "";
		bool isLeapDayYear = false;

		/*Current Year*/
		int aharkunMod = (beYear * 292207 + 499) % 800;
		int kromthupul = 800 - aharkunMod;
		bool isKhmerSolarLeap = false;
		if (kromthupul <= 207) {
			isKhmerSolarLeap = true;
		}

		/*End Current Year*/
		int aharkun = (((beYear * 292207 + 499)) / 800).floor() + 4;
		int avoman = (aharkun * 11 + 25) % 692;
		int aharkunN = ((((beYear + 1) * 292207 + 499)) / 800).floor() + 4;
		int avomanN = (aharkunN * 11 + 25) % 692;
		int aharkunP = ((((beYear + 1) * 292207 + 499)) / 800).floor() + 4;
		int avomanP = (aharkunP * 11 + 25) % 692;
		if (isKhmerSolarLeap && avoman < 127) {
			isLeapDayYear = true;
		}
		else {
			if (avoman < 138) {
				isLeapDayYear = true;
			}
			if (avoman == 137 && avomanN == 0) {
				isLeapDayYear = false;
			}
			if (avomanP == 138 && avoman == 0) {
				isLeapDayYear = true;
			}
		}

		int temp = (((aharkun * 11 + 25) / 692)).floor();
		int bodithey = (temp + aharkun + 29) % 30;
		int tempN = (((aharkunN * 11 + 25) / 692)).floor();
		int boditheyN = (tempN + aharkunN + 29) % 30;
		bool isLeapMonth = false;
		if (bodithey < 6 || bodithey > 24) {
			isLeapMonth = true;
		}
		if (bodithey == 24 && boditheyN == 6) {
			isLeapMonth = true;
		}
		if (bodithey == 25 && boditheyN == 5) {
			isLeapMonth = false;
		}
		if (isLeapMonth && isLeapDayYear) {
			str = "MD";
		}
		else if (isLeapMonth) {
			str = "M";
		}
		else if (isLeapDayYear) {
			str = "D";
		}

		return str;
	}

	static Map getKhmerLunarString(DateTime srcDate) {
		Map hsMonth = getHashMonth;
		Map hsAnimalYear = getHashAnimalYear;
		Map hsSak = getHashSak;
		String enText = _getKhmerLunarCode(srcDate);
		String sak = enText.substring(0, 2);
		String animalYear = enText.substring(2, 4);
		String year = enText.substring(4, 8);
		String month = enText.substring(8, 10);
		String kr = enText.substring(10, 11);
		String d = enText.substring(11, 13);
		String s = "";

		if (enText.length == 14) {
			s = enText.substring(13, 14);
		}

		if (s == "S") {
			s = "សីល";
		}
		sak = hsSak[sak].toString();
		year = convertToKhmerNum(year);
		month = hsMonth[month].toString();
		animalYear = hsAnimalYear[animalYear].toString();
		kr = kr.replaceAll("K", "កើត").replaceAll("R", "រោច");
		int dt = int.parse(d);
		d = convertToKhmerNum(dt.toString());
//		khText = "ថ្ងៃ "+d + kr + s + " ខែ" + month +" ព.ស "+year +" ឆ្នាំ "+animalYear+" "+sak;

		return {
			"d": d,
			"kr": kr,
			"s": s,
			"mm": month,
			"yy": year,
			"animalYY": animalYear,
			"sak": sak
		};
	}

	String getDayOfWeek(int num){
		return getWeekDayKH[num];
	}

	static String convertToKhmerNum(String src) {
		return src
			.replaceAll("0", "០")
			.replaceAll("1", "១")
			.replaceAll("2", "២")
			.replaceAll("3", "៣")
			.replaceAll("4", "៤")
			.replaceAll("5", "៥")
			.replaceAll("6", "៦")
			.replaceAll("7", "៧")
			.replaceAll("8", "៨")
			.replaceAll("9", "៩");
	}

	static String _getKhmerLunarCode(DateTime srcDate) {
		Map hsDay = new Map();
		hsDay[1] = "01K01";
		hsDay[2] = "01K02";
		hsDay[3] = "01K03";
		hsDay[4] = "01K04";
		hsDay[5] = "01K05";
		hsDay[6] = "01K06";
		hsDay[7] = "01K07";
		hsDay[8] = "01K08S";
		hsDay[9] = "01K09";
		hsDay[10] = "01K10";
		hsDay[11] = "01K11";
		hsDay[12] = "01K12";
		hsDay[13] = "01K13";
		hsDay[14] = "01K14";
		hsDay[15] = "01K15S";
		hsDay[16] = "01R01";
		hsDay[17] = "01R02";
		hsDay[18] = "01R03";
		hsDay[19] = "01R04";
		hsDay[20] = "01R05";
		hsDay[21] = "01R06";
		hsDay[22] = "01R07";
		hsDay[23] = "01R08S";
		hsDay[24] = "01R09";
		hsDay[25] = "01R10";
		hsDay[26] = "01R11";
		hsDay[27] = "01R12";
		hsDay[28] = "01R13";
		hsDay[29] = "01R14S";
		hsDay[30] = "02K01";
		hsDay[31] = "02K02";
		hsDay[32] = "02K03";
		hsDay[33] = "02K04";
		hsDay[34] = "02K05";
		hsDay[35] = "02K06";
		hsDay[36] = "02K07";
		hsDay[37] = "02K08S";
		hsDay[38] = "02K09";
		hsDay[39] = "02K10";
		hsDay[40] = "02K11";
		hsDay[41] = "02K12";
		hsDay[42] = "02K13";
		hsDay[43] = "02K14";
		hsDay[44] = "02K15S";
		hsDay[45] = "02R01";
		hsDay[46] = "02R02";
		hsDay[47] = "02R03";
		hsDay[48] = "02R04";
		hsDay[49] = "02R05";
		hsDay[50] = "02R06";
		hsDay[51] = "02R07";
		hsDay[52] = "02R08S";
		hsDay[53] = "02R09";
		hsDay[54] = "02R10";
		hsDay[55] = "02R11";
		hsDay[56] = "02R12";
		hsDay[57] = "02R13";
		hsDay[58] = "02R14";
		hsDay[59] = "02R15S";
		hsDay[60] = "03K01";
		hsDay[61] = "03K02";
		hsDay[62] = "03K03";
		hsDay[63] = "03K04";
		hsDay[64] = "03K05";
		hsDay[65] = "03K06";
		hsDay[66] = "03K07";
		hsDay[67] = "03K08S";
		hsDay[68] = "03K09";
		hsDay[69] = "03K10";
		hsDay[70] = "03K11";
		hsDay[71] = "03K12";
		hsDay[72] = "03K13";
		hsDay[73] = "03K14";
		hsDay[74] = "03K15S";
		hsDay[75] = "03R01";
		hsDay[76] = "03R02";
		hsDay[77] = "03R03";
		hsDay[78] = "03R04";
		hsDay[79] = "03R05";
		hsDay[80] = "03R06";
		hsDay[81] = "03R07";
		hsDay[82] = "03R08S";
		hsDay[83] = "03R09";
		hsDay[84] = "03R10";
		hsDay[85] = "03R11";
		hsDay[86] = "03R12";
		hsDay[87] = "03R13";
		hsDay[88] = "03R14S";
		hsDay[89] = "04K01";
		hsDay[90] = "04K02";
		hsDay[91] = "04K03";
		hsDay[92] = "04K04";
		hsDay[93] = "04K05";
		hsDay[94] = "04K06";
		hsDay[95] = "04K07";
		hsDay[96] = "04K08S";
		hsDay[97] = "04K09";
		hsDay[98]= "04K10";
		hsDay[99]= "04K11";
		hsDay[100]= "04K12";
		hsDay[101]= "04K13";
		hsDay[102]= "04K14";
		hsDay[103]= "04K15S";
		hsDay[104]= "04R01";
		hsDay[105]= "04R02";
		hsDay[106]= "04R03";
		hsDay[107]= "04R04";
		hsDay[108]= "04R05";
		hsDay[109]= "04R06";
		hsDay[110]= "04R07";
		hsDay[111]= "04R08S";
		hsDay[112]= "04R09";
		hsDay[113]= "04R10";
		hsDay[114]= "04R11";
		hsDay[115]= "04R12";
		hsDay[116]= "04R13";
		hsDay[117]= "04R14";
		hsDay[118]= "04R15S";
		hsDay[119]= "05K01";
		hsDay[120]= "05K02";
		hsDay[121]= "05K03";
		hsDay[122]= "05K04";
		hsDay[123]= "05K05";
		hsDay[124]= "05K06";
		hsDay[125]= "05K07";
		hsDay[126]= "05K08S";
		hsDay[127]= "05K09";
		hsDay[128]= "05K10";
		hsDay[129]= "05K11";
		hsDay[130]= "05K12";
		hsDay[131]= "05K13";
		hsDay[132]= "05K14";
		hsDay[133]= "05K15S";
		hsDay[134]= "05R01";
		hsDay[135]= "05R02";
		hsDay[136]= "05R03";
		hsDay[137]= "05R04";
		hsDay[138]= "05R05";
		hsDay[139]= "05R06";
		hsDay[140]= "05R07";
		hsDay[141]= "05R08S";
		hsDay[142]= "05R09";
		hsDay[143]= "05R10";
		hsDay[144]= "05R11";
		hsDay[145]= "05R12";
		hsDay[146]= "05R13";
		hsDay[147]= "05R14S";
		hsDay[148]= "06K01";
		hsDay[149]= "06K02";
		hsDay[150]= "06K03";
		hsDay[151]= "06K04";
		hsDay[152]= "06K05";
		hsDay[153]= "06K06";
		hsDay[154]= "06K07";
		hsDay[155]= "06K08S";
		hsDay[156]= "06K09";
		hsDay[157]= "06K10";
		hsDay[158]= "06K11";
		hsDay[159]= "06K12";
		hsDay[160]= "06K13";
		hsDay[161]= "06K14";
		hsDay[162]= "06K15S";
		hsDay[163]= "06R01";
		hsDay[164]= "06R02";
		hsDay[165]= "06R03";
		hsDay[166]= "06R04";
		hsDay[167]= "06R05";
		hsDay[168]= "06R06";
		hsDay[169]= "06R07";
		hsDay[170]= "06R08S";
		hsDay[171]= "06R09";
		hsDay[172]= "06R10";
		hsDay[173]= "06R11";
		hsDay[174]= "06R12";
		hsDay[175]= "06R13";
		hsDay[176]= "06R14";
		hsDay[177]= "06R15S";
		hsDay[178]= "07K01";
		hsDay[179]= "07K02";
		hsDay[180]= "07K03";
		hsDay[181]= "07K04";
		hsDay[182]= "07K05";
		hsDay[183]= "07K06";
		hsDay[184]= "07K07";
		hsDay[185]= "07K08S";
		hsDay[186]= "07K09";
		hsDay[187]= "07K10";
		hsDay[188]= "07K11";
		hsDay[189]= "07K12";
		hsDay[190]= "07K13";
		hsDay[191]= "07K14";
		hsDay[192]= "07K15S";
		hsDay[193]= "07R01";
		hsDay[194]= "07R02";
		hsDay[195]= "07R03";
		hsDay[196]= "07R04";
		hsDay[197]= "07R05";
		hsDay[198]= "07R06";
		hsDay[199]= "07R07";
		hsDay[200]= "07R08S";
		hsDay[201]= "07R09";
		hsDay[202]= "07R10";
		hsDay[203]= "07R11";
		hsDay[204]= "07R12";
		hsDay[205]= "07R13";
		hsDay[206]= "07R14";//206
		hsDay[207]= "07R15S";//207
		hsDay[208]= "08K01";//208
		hsDay[209]= "08K02";
		hsDay[210]= "08K03";
		hsDay[211]= "08K04";
		hsDay[212]= "08K05";
		hsDay[213]= "08K06";
		hsDay[214]= "08K07";
		hsDay[215]= "08K08S";
		hsDay[216]= "08K09";
		hsDay[217]= "08K10";
		hsDay[218]= "08K11";
		hsDay[219]= "08K12";
		hsDay[220]= "08K13";
		hsDay[221]= "08K14";
		hsDay[222]= "08K15S";
		hsDay[223]= "08R01";
		hsDay[224]= "08R02";
		hsDay[225]= "08R03";
		hsDay[226]= "08R04";
		hsDay[227]= "08R05";
		hsDay[228]= "08R06";
		hsDay[229]= "08R07";
		hsDay[230]= "08R08S";
		hsDay[231]= "08R09";
		hsDay[232]= "08R10";
		hsDay[233]= "08R11";
		hsDay[234]= "08R12";
		hsDay[235]= "08R13";
		hsDay[236]= "08R14";
		hsDay[237]= "08R15S";//237
		hsDay[238]= "09K01";
		hsDay[239]= "09K02";
		hsDay[240]= "09K03";
		hsDay[241]= "09K04";
		hsDay[242]= "09K05";
		hsDay[243]= "09K06";
		hsDay[244]= "09K07";
		hsDay[245]= "09K08S";
		hsDay[246]= "09K09";
		hsDay[247]= "09K10";
		hsDay[248]= "09K11";
		hsDay[249]= "09K12";
		hsDay[250]= "09K13";
		hsDay[251]= "09K14";
		hsDay[252]= "09K15S";
		hsDay[253]= "09R01";
		hsDay[254]= "09R02";
		hsDay[255]= "09R03";
		hsDay[256]= "09R04";
		hsDay[257]= "09R05";
		hsDay[258]= "09R06";
		hsDay[259]= "09R07";
		hsDay[260]= "09R08S";
		hsDay[261]= "09R09";
		hsDay[262]= "09R10";
		hsDay[263]= "09R11";
		hsDay[264]= "09R12";
		hsDay[265]= "09R13";
		hsDay[266]= "09R14";
		hsDay[267]= "09R15S";
		hsDay[268]= "10K01";
		hsDay[269]= "10K02";
		hsDay[270]= "10K03";
		hsDay[271]= "10K04";
		hsDay[272]= "10K05";
		hsDay[273]= "10K06";
		hsDay[274]= "10K07";
		hsDay[275]= "10K08S";
		hsDay[276]= "10K09";
		hsDay[277]= "10K10";
		hsDay[278]= "10K11";
		hsDay[279]= "10K12";
		hsDay[280]= "10K13";
		hsDay[281]= "10K14";
		hsDay[282]= "10K15S";
		hsDay[283]= "10R01";
		hsDay[284]= "10R02";
		hsDay[285]= "10R03";
		hsDay[286]= "10R04";
		hsDay[287]= "10R05";
		hsDay[288]= "10R06";
		hsDay[289]= "10R07";
		hsDay[290]= "10R08S";
		hsDay[291]= "10R09";
		hsDay[292]= "10R10";
		hsDay[293]= "10R11";
		hsDay[294]= "10R12";
		hsDay[295]= "10R13";
		hsDay[296]= "10R14";
		hsDay[297]= "10R15S";
		hsDay[298]= "11K01";//298
		hsDay[299]= "11K02";
		hsDay[300]= "11K03";
		hsDay[301]= "11K04";
		hsDay[302]= "11K05";
		hsDay[303]= "11K06";
		hsDay[304]= "11K07";
		hsDay[305]= "11K08S";
		hsDay[306]= "11K09";
		hsDay[307]= "11K10";
		hsDay[308]= "11K11";
		hsDay[309]= "11K12";
		hsDay[310]= "11K13";
		hsDay[311]= "11K14";
		hsDay[312]= "11K15S";
		hsDay[313]= "11R01";
		hsDay[314]= "11R02";
		hsDay[315]= "11R03";
		hsDay[316]= "11R04";
		hsDay[317]= "11R05";
		hsDay[318]= "11R06";
		hsDay[319]= "11R07";
		hsDay[320]= "11R08S";
		hsDay[321]= "11R09";
		hsDay[322]= "11R10";
		hsDay[323]= "11R11";
		hsDay[324]= "11R12";
		hsDay[325]= "11R13";
		hsDay[326]= "11R14S";
		hsDay[327]= "12K01";
		hsDay[328]= "12K02";
		hsDay[329]= "12K03";
		hsDay[330]= "12K04";
		hsDay[331]= "12K05";
		hsDay[332]= "12K06";
		hsDay[333]= "12K07";
		hsDay[334]= "12K08S";
		hsDay[335]= "12K09";
		hsDay[336]= "12K10";
		hsDay[337]= "12K11";
		hsDay[338]= "12K12";
		hsDay[339]= "12K13";
		hsDay[340]= "12K14";
		hsDay[341]= "12K15S";
		hsDay[342]= "12R01";
		hsDay[343]= "12R02";
		hsDay[344]= "12R03";
		hsDay[345]= "12R04";
		hsDay[346]= "12R05";
		hsDay[347]= "12R06";
		hsDay[348]= "12R07";
		hsDay[349]= "12R08S";
		hsDay[350]= "12R09";
		hsDay[351]= "12R10";
		hsDay[352]= "12R11";
		hsDay[353]= "12R12";
		hsDay[354]= "12R13";
		hsDay[355]= "12R14";
		hsDay[356]= "12R15S";
		hsDay[357]= "13K01";
		hsDay[358]= "13K02";
		hsDay[359]= "13K03";
		hsDay[360]= "13K04";
		hsDay[361]= "13K05";
		hsDay[362]= "13K06";
		hsDay[363]= "13K07";
		hsDay[364]= "13K08S";
		hsDay[365]= "13K09";
		hsDay[366]= "13K10";
		hsDay[367]= "13K11";
		hsDay[368]= "13K12";
		hsDay[369]= "13K13";
		hsDay[370]= "13K14";
		hsDay[371]= "13K15S";
		hsDay[372]= "13R01";
		hsDay[373]= "13R02";
		hsDay[374]= "13R03";
		hsDay[375]= "13R04";
		hsDay[376]= "13R05";
		hsDay[377]= "13R06";
		hsDay[378]= "13R07";
		hsDay[379]= "13R08S";
		hsDay[380]= "13R09";
		hsDay[381]= "13R10";
		hsDay[382]= "13R11";
		hsDay[383]= "13R12";
		hsDay[384]= "13R13";
		hsDay[385]= "13R14S";
		hsDay[386]= "14K01";
		hsDay[387]= "14K02";
		hsDay[388]= "14K03";
		hsDay[389]= "14K04";
		hsDay[390]= "14K05";
		hsDay[391]= "14K06";
		hsDay[392]= "14K07";
		hsDay[393]= "14K08S";
		hsDay[394]= "14K09";
		hsDay[395]= "14K10";
		hsDay[396]= "14K11";
		hsDay[397]= "14K12";
		hsDay[398]= "14K13";
		hsDay[399]= "14K14";
		hsDay[400]= "14K15S";
		hsDay[401]= "14R01";
		hsDay[402]= "14R02";
		hsDay[403]= "14R03";
		hsDay[404]= "14R04";
		hsDay[405]= "14R05";
		hsDay[406]= "14R06";
		hsDay[407]= "14R07";
		hsDay[408]= "14R08S";
		hsDay[409]= "14R09";
		hsDay[410]= "14R10";
		hsDay[411]= "14R11";
		hsDay[412]= "14R12";
		hsDay[413]= "14R13";
		hsDay[414]= "14R14";
		hsDay[415]= "14R15S";


		//predfine by year hash on date 01 Jan
		int minDefineYear = 1900;
		int maxDefineYear = 2100;

		Map hsYear = new Map();
		hsYear[1900]= 30;
		hsYear[1901]= 41;
		hsYear[1902]= 22;
		hsYear[1903]= 32;
		hsYear[1904]= 43;
		hsYear[1905]= 25;
		hsYear[1906]= 36;
		hsYear[1907]= 46;
		hsYear[1908]= 27;
		hsYear[1909]= 39;
		hsYear[1910]= 20;
		hsYear[1911]= 31;
		hsYear[1912]= 41;
		hsYear[1913]= 23;
		hsYear[1914]= 34;
		hsYear[1915]= 45;
		hsYear[1916]= 26;
		hsYear[1917]= 38;
		hsYear[1918]= 48;
		hsYear[1919]= 29;
		hsYear[1920]= 40;
		hsYear[1921]= 22;
		hsYear[1922]= 33;
		hsYear[1923]= 43;
		hsYear[1924]= 24;
		hsYear[1925]= 36;
		hsYear[1926]= 47;
		hsYear[1927]= 28;
		hsYear[1928]= 38;
		hsYear[1929]= 20;
		hsYear[1930]= 31;
		hsYear[1931]= 42;
		hsYear[1932]= 23;
		hsYear[1933]= 34;
		hsYear[1934]= 45;
		hsYear[1935]= 26;
		hsYear[1936]= 37;
		hsYear[1937]= 49;
		hsYear[1938]= 30;
		hsYear[1939]= 40;
		hsYear[1940]= 21;
		hsYear[1941]= 33;
		hsYear[1942]= 44;
		hsYear[1943]= 25;
		hsYear[1944]= 35;
		hsYear[1945]= 47;
		hsYear[1946]= 28;
		hsYear[1947]= 39;
		hsYear[1948]= 20;
		hsYear[1949]= 31;
		hsYear[1950]= 42;
		hsYear[1951]= 23;
		hsYear[1952]= 34;
		hsYear[1953]= 46;
		hsYear[1954]= 27;
		hsYear[1955]= 37;
		hsYear[1956]= 48;
		hsYear[1957]= 30;
		hsYear[1958]= 41;
		hsYear[1959]= 22;
		hsYear[1960]= 32;
		hsYear[1961]= 44;
		hsYear[1962]= 25;
		hsYear[1963]= 36;
		hsYear[1964]= 46;
		hsYear[1965]= 28;
		hsYear[1966]= 39;
		hsYear[1967]= 20;
		hsYear[1968]= 31;
		hsYear[1969]= 42;
		hsYear[1970]= 23;
		hsYear[1971]= 34;
		hsYear[1972]= 45;
		hsYear[1973]= 27;
		hsYear[1974]= 37;
		hsYear[1975]= 48;
		hsYear[1976]= 29;
		hsYear[1977]= 41;
		hsYear[1978]= 22;
		hsYear[1979]= 32;
		hsYear[1980]= 43;
		hsYear[1981]= 25;
		hsYear[1982]= 36;
		hsYear[1983]= 47;
		hsYear[1984]= 28;
		hsYear[1985]= 39;
		hsYear[1986]= 20;
		hsYear[1987]= 31;
		hsYear[1988]= 42;
		hsYear[1989]= 24;
		hsYear[1990]= 34;
		hsYear[1991]= 45;
		hsYear[1992]= 26;
		hsYear[1993]= 38;
		hsYear[1994]= 19;
		hsYear[1995]= 29;
		hsYear[1996]= 40;
		hsYear[1997]= 22;
		hsYear[1998]= 33;
		hsYear[1999]= 44;
		hsYear[2000]= 25;
		hsYear[2001]= 36;
		hsYear[2002]= 47;
		hsYear[2003]= 28;
		hsYear[2004]= 39;
		hsYear[2005]= 21;
		hsYear[2006]= 31;
		hsYear[2007]= 42;
		hsYear[2008]= 23;
		hsYear[2009]= 35;
		hsYear[2010]= 45;
		hsYear[2011]= 26;
		hsYear[2012]= 37;
		hsYear[2013]= 19;
		hsYear[2014]= 30;
		hsYear[2015]= 41;
		hsYear[2016]= 22;
		hsYear[2017]= 33;
		hsYear[2018]= 44;
		hsYear[2019]= 25;
		hsYear[2020]= 36;
		hsYear[2021]= 47;
		hsYear[2022]= 28;
		hsYear[2023]= 39;
		hsYear[2024]= 20;
		hsYear[2025]= 32;
		hsYear[2026]= 42;
		hsYear[2027]= 23;
		hsYear[2028]= 34;
		hsYear[2029]= 46;
		hsYear[2030]= 27;
		hsYear[2031]= 37;
		hsYear[2032]= 18;
		hsYear[2033]= 30;
		hsYear[2034]= 41;
		hsYear[2035]= 22;
		hsYear[2036]= 32;
		hsYear[2037]= 44;
		hsYear[2038]= 25;
		hsYear[2039]= 36;
		hsYear[2040]= 47;
		hsYear[2041]= 29;
		hsYear[2042]= 39;
		hsYear[2043]= 20;
		hsYear[2044]= 31;
		hsYear[2045]= 43;
		hsYear[2046]= 24;
		hsYear[2047]= 34;
		hsYear[2048]= 45;
		hsYear[2049]= 27;
		hsYear[2050]= 38;
		hsYear[2051]= 19;
		hsYear[2052]= 29;
		hsYear[2053]= 41;
		hsYear[2054]= 22;
		hsYear[2055]= 33;
		hsYear[2056]= 44;
		hsYear[2057]= 26;
		hsYear[2058]= 36;
		hsYear[2059]= 47;
		hsYear[2060]= 28;
		hsYear[2061]= 40;
		hsYear[2062]= 21;
		hsYear[2063]= 31;
		hsYear[2064]= 42;
		hsYear[2065]= 24;
		hsYear[2066]= 35;
		hsYear[2067]= 45;
		hsYear[2068]= 26;
		hsYear[2069]= 38;
		hsYear[2070]= 19;
		hsYear[2071]= 30;
		hsYear[2072]= 40;
		hsYear[2073]= 22;
		hsYear[2074]= 33;
		hsYear[2075]= 44;
		hsYear[2076]= 25;
		hsYear[2077]= 36;
		hsYear[2078]= 47;
		hsYear[2079]= 28;
		hsYear[2080]= 39;
		hsYear[2081]= 21;
		hsYear[2082]= 32;
		hsYear[2083]= 42;
		hsYear[2084]= 23;
		hsYear[2085]= 35;
		hsYear[2086]= 46;
		hsYear[2087]= 27;
		hsYear[2088]= 37;
		hsYear[2089]= 19;
		hsYear[2090]= 30;
		hsYear[2091]= 41;
		hsYear[2092]= 22;
		hsYear[2093]= 33;
		hsYear[2094]= 44;
		hsYear[2095]= 25;
		hsYear[2096]= 36;
		hsYear[2097]= 48;
		hsYear[2098]= 29;
		hsYear[2099]= 39;
		hsYear[2100]= 20;

		DateTime beginDate = DateFormat().add_yMd().parse("1/1/1900");
		int correspondNum = 30;

		if (srcDate.year > maxDefineYear) {
			beginDate = DateFormat().add_yMd().parse("1/1/"+maxDefineYear.toString());
			correspondNum = int.parse(hsYear[maxDefineYear]);
		}
		else if (srcDate.year < minDefineYear) {
			throw new Exception("Uncalculatable");
		}
		else {
			beginDate = DateFormat().add_yMd().parse("1/1/"+srcDate.year.toString());
			correspondNum = hsYear[srcDate.year];
		}

		int yearPath = beginDate.year + 543;
		DateTime tmpDate = beginDate;
		int diffDate = srcDate.difference(beginDate).inDays;
		int cNum = correspondNum;

		for (int i = 0; i < diffDate; i++) {
			String leap = _getCalendarLeap(tmpDate.add(Duration(days: i)).year + 544);
			cNum = cNum + 1;
			if (cNum == 207) {
				if (!(leap == "D")) {
					cNum = 208;
				}
			}

			if (cNum == 208) {
				if (leap == "M") {
					cNum = 238;
				}
			}

			if (cNum == 238) {
				if (leap != "M") {
					cNum = 298;
				}
			}

			if (cNum == 416) {
				cNum = 1;
			}

			if (cNum == 163) {
				yearPath = yearPath + 1;
			}
		}

		//check if animal year/sak increase
		int tmpNewYearDay = 11;
		int dayOfNewYear = (srcDate.year + 4) % 7;
		while (tmpNewYearDay <= 17) {
			DateTime tmp = new DateTime(srcDate.year,4,tmpNewYearDay);
			if (tmp.weekday == dayOfNewYear) {
				break;
			}
			tmpNewYearDay++;
		}
		DateTime newYearDay = new DateTime(srcDate.year, 4, tmpNewYearDay);

		int animalYear;
		int sak;
		if (srcDate.isAfter(newYearDay)) {
			animalYear = (srcDate.year + 8) % 12 + 1;
			sak = (srcDate.year + 1) % 10 + 1;
		}
		else {
			animalYear = (srcDate.year + 7) % 12 + 1;
			sak = (srcDate.year + 0) % 10 + 1;
		}

		String result = hsDay[cNum].toString();
		if(result == "07R14" && _getCalendarLeap(srcDate.year + 544) != "D") {
			result = result + "S";
		}

		//year path
		result = sprintf("%02i", [sak])+sprintf("%02i", [animalYear])+sprintf("%04i", [yearPath])+result;

		return result;
	}
}