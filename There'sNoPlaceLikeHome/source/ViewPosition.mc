using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Lang as Lang;
using Toybox.Application as App;

var timer;

class ViewPositionDelegate extends Ui.BehaviorDelegate
{
	// Go to "Select Home" screen
	function onMenu()
	{
		timer.stop();
		Ui.pushView(new ChooseHome(), new ChooseHomeDelegate(), Ui.SLIDE_LEFT);
	}
}

class ViewPosition extends Ui.DataField {	
	//! Update the view
	function redraw() {
		Ui.requestUpdate();
	}
	
	// Refresh this view every half-second
	function onShow() {
		timer = new Timer.Timer();
    	timer.start( method(:redraw), 500, true);
	}
	
	function onUpdate(dc)
	{
		dc.clear();
		
		// Set Background Color
		dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_DK_GRAY);
		dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
		
		// Get data from data store
		var app = App.getApp();
		var homeCoordLat = app.getProperty("Home_Coord_Latitude");
		var homeCoordLong = app.getProperty("Home_Coord_Longitude");
		var curCoordLat = app.getProperty("Current_Coord_Latitude");
		var curCoordLong = app.getProperty("Current_Coord_Longitude");
		
		// If "Home" coordinates have been entered
		if(homeCoordLong != null && homeCoordLat != null)
		{
			dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
			var distance = computeDist(homeCoordLat, homeCoordLong, curCoordLat, curCoordLong).toString();
			var distanceText = distance + " km";
			dc.drawText(dc.getWidth()/2, dc.getHeight()/3, Gfx.FONT_SMALL, "Distance from home:", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(dc.getWidth()/2, dc.getHeight()*2/3, Gfx.FONT_SMALL, distanceText, Gfx.TEXT_JUSTIFY_CENTER);
		} else {
			dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
			dc.drawText(dc.getWidth()/2, dc.getHeight()/3, Gfx.FONT_SMALL, "No home position recorded", Gfx.TEXT_JUSTIFY_CENTER);
			dc.drawText(dc.getWidth()/2, dc.getHeight()*2/3, Gfx.FONT_SMALL, "Press \"Menu\" to pick your home position", Gfx.TEXT_JUSTIFY_CENTER);
		}
	}
	
	// Compute the distance between two coordinates in kilometers.
	// Parameters are the Latitude and Longitude of the two points in degrees, represented as strings.
	function computeDist(pt1Lat, pt1Long, pt2Lat, pt2Long) {
	
		//Convert degree strings to float numbers
		var point1Lat = pt1Lat.toFloat();
		var point1Long = pt1Long.toFloat();
		var point2Lat = pt2Lat.toFloat();
		var point2Long = pt2Long.toFloat();
		
		var radius = 6371;
		
		//Convert to radians
		var radLat1 = point1Lat * (3.14159/180.0);
		var radLat2 = point2Lat * (3.14159/180.0);
		var dLat = (point2Lat - point1Lat) * (3.14159/180.0);
		var dLong = (point2Long - point1Long) * (3.14159/180.0);
		
		//Use the Haversine formula to calculate the great-circle distance between two coordinates
		var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
        	Math.cos(radLat1) * Math.cos(radLat2) *
        	Math.sin(dLong/2) * Math.sin(dLong/2);
        
        // Avoid DivideByZero error
        if(a > .000000001) {
			var c = 2 * atan2(Math.sqrt(a), Math.sqrt(1-a));
			var dist = radius * c;
			return dist;
		} else {
			return 0;
		}	
	}
	
	//Calculates the arctan such that the answer is in the correct quadrant. 
	function atan2(x,y) 
	{
		var result = 2 * Math.atan((Math.sqrt(Math.pow(x,2)+Math.pow(y,2))-y)/x);
		return result;
	}
}