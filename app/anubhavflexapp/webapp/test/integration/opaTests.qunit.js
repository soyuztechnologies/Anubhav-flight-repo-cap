sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/anubhav/travel/anubhavflexapp/test/integration/FirstJourney',
		'com/anubhav/travel/anubhavflexapp/test/integration/pages/TravelMain'
    ],
    function(JourneyRunner, opaJourney, TravelMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/anubhav/travel/anubhavflexapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTravelMain: TravelMain
                }
            },
            opaJourney.run
        );
    }
);