class RDBDate{
	int dEn;
	String dKh;
	int mmEn;
	String mmKh;
	int yyEn;
	String yyKh;
	String animalYY;
	String sak;
	String s;
	String kr;

	RDBDate();

	RDBDate.clone(RDBDate other){
		dEn = other.dEn;
		dKh = other.dKh;
		mmEn = other.mmEn;
		mmKh = other.mmKh;
		yyEn = other.yyEn;
		yyKh = other.yyKh;
		animalYY = other.animalYY;
		sak = other.sak;
		s = other.s;
		kr = other.kr;
	}

	@override
	String toString() {
		return 'RDBDate{dEn: $dEn, dKh: $dKh, mmEn: $mmEn, mmKh: $mmKh, yyEn: $yyEn, yyKh: $yyKh, animalYY: $animalYY, sak: $sak, s: $s, kr: $kr}';
	}
}