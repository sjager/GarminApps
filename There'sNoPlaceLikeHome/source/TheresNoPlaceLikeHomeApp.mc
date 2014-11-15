using Toybox.Application as App;

class TheresNoPlaceLikeHomeApp extends App.AppBase {

    //! onStart() is called on application start up
    function onStart() {
    	initializeListener();
    }
	    
    function onPosition(info)
	{
		// Fake data since data types are not precise enough to use simulated data
		var fakeLats = [70, 27.357, -51.33];
		var fakeLongs = [1.26, -33.992, 107];
		var rand = Math.rand()%3;
		
		// Store data into data store
		var app = App.getApp();
		app.setProperty("Current_Coords", info.position.toGeoString(Position.GEO_DM));
		app.setProperty("Current_Coord_Latitude", fakeLats[rand].toString());
		app.setProperty("Current_Coord_Longitude", fakeLongs[rand].toString());
	}
	
	function initializeListener()
	{
		Position.enableLocationEvents(1, method(:onPosition));
	}

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new ViewPosition(), new ViewPositionDelegate() ];
    }

}