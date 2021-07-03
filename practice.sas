data a;
length names$20.  country$25. sex$4.;
input names age sex country;
cards;
rupesh_chilamathuru 20 male   republic_of_india
vidya_sagar         30 male   united_staes_of_america
basha_khan          40 female republic_of_canada
run;
filename rupesh "D:\S A S\practice\data1.txt";

data b;
infile rupesh dlm=',';
input names$ age;
run;

filename rush "D:\S A S\practice\data.txt";

data c;
infile rush dlm=' ';
input names$ age;
run;
data d;
infile cards scanover;
input @ 'chi' names$ age;
cards;
rupesh chi   53  
radha chi     43
dev chi     14
meghana chi   13
run;

data e;
infile "D:\S A S\practice\data3.txt" dlm='*'firstobs=2;
input name$ age dob;
informat dob date10.;
format dob worddate.;
run;
data x;
input ph_no address$18. name$ sal;
cards;
6399160579 265_milton drive  rupesh    55000
6399572224 874_gardner_drive rajesh    65000
6396396399 7_belmont_cresent geeta     75000
6334455667 75_newman_road    veena     85000
run;
proc sort data=x out=x2;
by name;
run;
data y;
length sal$10. name$20.;
input name$ dob sal$;
informat dob date9.;
format dob worddatx.;
cards;
rupesh_chilamathuru 01jun1989 350000011
rajesh_rampthadu 24sep1990    45000
geeta_golagamudi 27jan1987     50000
jyothi_jaipur 15dec1985        55000
run;
proc sort data=y1 out =y2;
by name;
run;
data y1(rename=(salary=sal)drop=sal);
set y;
salary=input(sal,best12.);
run;

data xy2;
merge x y;
by name;
run;
data up;
update x2 y2;
by name;
run;

data xy1;
set x y1 ;
run;
data com;
merge x2(in=a) y2(in=b);
by name;
if a and b;
run;
data notcom;
merge x2(in=a) y2(in=b);
if a ne b;
by name;
run;

data mer;
length sal$10. name$20.;
merge x2 y2;
run;
data merby;
length sal$10. name$20.;
merge x2 y2;
by name;
run;
