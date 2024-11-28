using { studentAppSrv } from '../../srv/service.cds';

annotate studentAppSrv.Students with @UI.DataPoint #firstName: {
  Value: firstName,
  Title: 'First Name',
};
annotate studentAppSrv.Students with @UI.DataPoint #lastName: {
  Value: lastName,
  Title: 'Last Name',
};
annotate studentAppSrv.Students with @UI.DataPoint #email: {
  Value: email,
  Title: 'Email',
};
annotate studentAppSrv.Students with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#firstName', ID: 'FirstName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#lastName', ID: 'LastName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#email', ID: 'Email' }
];
annotate studentAppSrv.Students with @UI.HeaderInfo: {
  TypeName: 'Student',
  TypeNamePlural: 'Students',
  Title: { Value: studentID }
};
annotate studentAppSrv.Students with {
  ID @UI.Hidden
};
annotate studentAppSrv.Students with @UI.Identification: [{ Value: studentID }];
annotate studentAppSrv.Students with {
  studentID @Common.Label: 'Student ID';
  firstName @Common.Label: 'First Name';
  lastName @Common.Label: 'Last Name';
  email @Common.Label: 'Email';
  age @Common.Label: 'Age';
  FavoriteGames @Common.Label: 'Games'
};
annotate studentAppSrv.Students with {
  ID @Common.Text: { $value: studentID, ![@UI.TextArrangement]: #TextOnly };
};
annotate studentAppSrv.Students with @UI.SelectionFields : [
 studentID,
 firstName,
 lastName,
 email,
 age
];
annotate studentAppSrv.Students with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: studentID },
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: age }
];
annotate studentAppSrv.Students with @UI.FieldGroup #studentDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: studentID },
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: age }

  ]
};


annotate studentAppSrv.Games with @UI.LineItem #favoriteGames: [
    { $Type: 'UI.DataField', Value: gameID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: releaseDate },
    { $Type: 'UI.DataField', Value: studentID }

  ];


annotate studentAppSrv.Students with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'overviewTab',
    Label: 'Overview',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'studentDetails', Label: 'Student Details', Target: '@UI.FieldGroup#studentDetails' },
      { $Type: 'UI.ReferenceFacet', ID: 'favoriteGames', Label: 'Favorite Games', Target: 'FavoriteGames/@UI.LineItem#favoriteGames' } ]
  }
];
annotate studentAppSrv.Games with {
  students @Common.ValueList: {
    CollectionPath: 'Students',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: students_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'studentID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'age'
      },
    ],
  }
};
annotate studentAppSrv.Games with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate studentAppSrv.Games with @UI.DataPoint #studentID: {
  Value: studentID,
  Title: 'Student ID',
};
annotate studentAppSrv.Games with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title', ID: 'Title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#studentID', ID: 'StudentID' }
];
annotate studentAppSrv.Games with @UI.HeaderInfo: {
  TypeName: 'Game',
  TypeNamePlural: 'Games',
  Title: { Value: gameID }
};
annotate studentAppSrv.Games with {
  ID @UI.Hidden
};
annotate studentAppSrv.Games with @UI.Identification: [{ Value: gameID }];
annotate studentAppSrv.Games with {
  gameID @Common.Label: 'Game ID';
  title @Common.Label: 'Title';
  genre @Common.Label: 'Genre';
  releaseDate @Common.Label: 'Release Date';
  studentID @Common.Label: 'Student ID';
  students @Common.Label: 'Student'
};
annotate studentAppSrv.Games with {
  ID @Common.Text: { $value: gameID, ![@UI.TextArrangement]: #TextOnly };
  students @Common.Text: { $value: students.studentID, ![@UI.TextArrangement]: #TextOnly };
};
annotate studentAppSrv.Games with @UI.SelectionFields: [
  students_ID
];
annotate studentAppSrv.Games with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: gameID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: releaseDate },
    { $Type: 'UI.DataField', Value: studentID },
    { $Type: 'UI.DataField', Label: 'Student', Value: students_ID }
];
annotate studentAppSrv.Games with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: gameID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: genre },
    { $Type: 'UI.DataField', Value: releaseDate },
    { $Type: 'UI.DataField', Value: studentID },
    { $Type: 'UI.DataField', Label: 'Student', Value: students_ID }
]};
annotate studentAppSrv.Games with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];