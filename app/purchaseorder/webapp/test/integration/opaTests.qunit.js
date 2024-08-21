sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'my/purchaseorder/test/integration/FirstJourney',
		'my/purchaseorder/test/integration/pages/purchaseorderSetList',
		'my/purchaseorder/test/integration/pages/purchaseorderSetObjectPage',
		'my/purchaseorder/test/integration/pages/poitemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, purchaseorderSetList, purchaseorderSetObjectPage, poitemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('my/purchaseorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThepurchaseorderSetList: purchaseorderSetList,
					onThepurchaseorderSetObjectPage: purchaseorderSetObjectPage,
					onThepoitemsObjectPage: poitemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);