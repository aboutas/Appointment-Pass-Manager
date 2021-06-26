--Fill enumeration
USE finalDB

INSERT INTO DEGREE_VALUES VALUES(N'TEI');
INSERT INTO DEGREE_VALUES VALUES(N'AEI');
INSERT INTO DEGREE_VALUES VALUES(N'Master');
INSERT INTO DEGREE_VALUES VALUES(N'PHD');

INSERT INTO CONTACT_AVAILABILITY_VALUES VALUES(1, N'8-10 πμ, κάθε μέρα');
INSERT INTO CONTACT_AVAILABILITY_VALUES VALUES(2, N'10-12 Δευτέρα, Τετάρτη, Παρασκευή');
INSERT INTO CONTACT_AVAILABILITY_VALUES VALUES(3, N'9-12 κάθε μέρα πλην Τρίτης');

INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(1 , 1 , N'ΔΕΥΤΕΡΑ' , 8 ,10);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(2 , 1 , N'ΤΡΙΤΗ' , 8 ,10);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(3 , 1 , N'ΤΕΤΑΡΤΗ' , 8 ,10);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(4 , 1 , N'ΠΕΜΠΤΗ' , 8 ,10);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(5 , 1 , N'ΠΑΡΑΣΚΕΥΗ' , 8 ,10);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(6 , 2 , N'ΔΕΥΤΕΡΑ' , 10 ,12);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(7 , 2 , N'ΤΕΤΑΡΤΗ' , 10 ,12);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(8 , 2 , N'ΠΑΡΑΣΚΕΥΗ' , 10 ,12);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(9 , 3 , N'ΔΕΥΤΕΡΑ' , 9 ,12);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(10 , 3 , N'ΤΕΤΑΡΤΗ' , 9 ,12);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(11 , 3 , N'ΠΕΜΠΤΗ' , 9 ,12);
INSERT INTO CONTACT_AVAILABILITY_MAPPING_VALUES VALUES(12 , 3 , N'ΠΑΡΑΣΚΕΥΗ' , 9 ,12);

-- insert customer table 

INSERT INTO CUSTOMERS VALUES(
    1,
    'Thanasis',
    'Bt',
    '6949660679',
    'thanasis@mail.com',
    'papaflessa 83',
    'Master',
    29,
    'MALE',
    7.77,
    N'10-12 Δευτέρα, Τετάρτη, Παρασκευή'
);

INSERT INTO CUSTOMERS VALUES(
    2,
    'Kostas',
    'Antetokoumpo',
    '693454545',
    'kostas@mail.com',
    'LA',
    'Master',
    21,
    'MALE',
    7.77,
    N'8-10 πμ, κάθε μέρα'
);

INSERT INTO CUSTOMERS VALUES(
    3,
    'Giannis',
    'Antetokoumpo',
    '693454545',
    'giannis@mail.com',
    'Milwuake',
    'Master',
    27,
    'MALE',
    7.77,
    N'9-12 κάθε μέρα πλην Τρίτης'
);

INSERT INTO CUSTOMERS VALUES(
    4,
    'thanasis',
    'Antetokoumpo',
    '693454545',
    'elevator@mail.com',
    'LA',
    'Master',
    21,
    'MALE',
    7.77,
    N'8-10 πμ, κάθε μέρα'
);

INSERT INTO CUSTOMERS VALUES(
    5,
    'kobe ',
    'bryant',
    '693454545',
    'kobe@mail.com',
    'LA',
    'Master',
    21,
    'MALE',
    7.77,
    N'9-12 κάθε μέρα πλην Τρίτης'
);
INSERT INTO CUSTOMERS VALUES(
    6,
    'Kavin',
    'Durant',
    '6949660679',
    'kavin@mail.com',
    'papaflessa 83',
    'Master',
    29,
    'MALE',
    7.77,
    N'10-12 Δευτέρα, Τετάρτη, Παρασκευή'
);

INSERT INTO CUSTOMERS VALUES(
    7,
    'Steven',
    'Curry',
    '693454545',
    'steven@mail.com',
    'LA',
    'Master',
    21,
    'MALE',
    7.77,
    N'8-10 πμ, κάθε μέρα'
);

INSERT INTO CUSTOMERS VALUES(
    8,
    'James ',
    'Harden',
    '693454545',
    'james@mail.com',
    'Houston',
    'Master',
    21,
    'MALE',
    7.77,
    N'9-12 κάθε μέρα πλην Τρίτης'
);

INSERT INTO CUSTOMERS VALUES(
    9,
    'Kawai',
    'Leonard',
    '693454545',
    'kawai@mail.com',
    'LA',
    'Master',
    21,
    'MALE',
    7.77,
    N'9-12 κάθε μέρα πλην Τρίτης'
);

INSERT INTO CUSTOMERS VALUES(
    10,
    'Cris',
    'Paul',
    '693454545',
    'cris@mail.com',
    'phoenix',
    'Master',
    21,
    'MALE',
    7.77,
    N'9-12 κάθε μέρα πλην Τρίτης'
);

SELECT * FROM dbo.SORT_CUSTOMERS(N'ΔΕΥΤΕΡΑ' , 11);

