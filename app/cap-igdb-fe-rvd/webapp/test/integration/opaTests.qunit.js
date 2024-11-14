sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'capigdbfervd/test/integration/FirstJourney',
		'capigdbfervd/test/integration/pages/StudentList',
		'capigdbfervd/test/integration/pages/StudentObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudentList, StudentObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('capigdbfervd') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudentList: StudentList,
					onTheStudentObjectPage: StudentObjectPage
                }
            },
            opaJourney.run
        );
    }
);