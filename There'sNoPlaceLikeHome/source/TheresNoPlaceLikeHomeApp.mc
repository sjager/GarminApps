using Toybox.Application as App;
using Toybox.System as Sys;

enum {
	HOME_COORDS
}

class TheresNoPlaceLikeHomeApp extends App.AppBase {

    //! onStart() is called on application start up
    function onStart() {
    	initializeListener();
    }
	    
    function onPosition(info)
	{
		//Sys.println("Position " +
		//info.position.toGeoString(Position.GEO_DM));

		var app = App.getApp();
		app.setProperty("Current_Coords", info.position.toGeoString(Position.GEO_DM));
		//app.setProperty("Current_Coord_Latitude", info.position.toDegrees()[0]);
		//app.setProperty("Current_Coord_Longitude", info.position.toDegrees()[1]);
	}
	
	function initializeListener()
	{
		Position.enableLocationEvents(
		1,
		method(:onPosition));
	}

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new ViewPosition(), new ViewPositionDelegate() ];
    }

}