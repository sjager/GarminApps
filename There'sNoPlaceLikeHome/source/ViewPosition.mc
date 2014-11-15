using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;

class ViewPositionDelegate extends Ui.BehaviorDelegate
{
	function onMenu()
	{
		Sys.println("Position");
		Ui.pushView(new ChooseHome(), new ChooseHomeDelegate(), Ui.SLIDE_LEFT);
	}
}

class ViewPosition extends Ui.DataField {
	function initialize()
	{
		
	}
	
	//! Update the view
	function compute(info)
	{
		Sys.println("Compute Function");
		var app = App.getApp();
	
		var homeCoordLong = app.getProperty("Home_Coord_Longitude"); 
		//AppBase.getProperty("HomeCoords");
		if(homeCoordLong != null)
		{
			return homeCoordLong;
		} else {
			return "none";
		}
	}
	
	function onUpdate(dc)
	{
		//dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLUE);
		//dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
	}
}