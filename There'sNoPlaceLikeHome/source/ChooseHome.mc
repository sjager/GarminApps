using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;

class ChooseHomeDelegate extends Ui.BehaviorDelegate
{
	function onPreviousPage()
	{
		Sys.println("Menu");
		Ui.popView(Ui.SLIDE_RIGHT);
	}
	
	function onKey(evt)
	{
		if(evt.getKey() == Ui.KEY_ENTER)
		{
			var app = App.getApp();
			var thing = app.getProperty("Current_Coords").toString();
			//var thing1 = app.getProperty("Current_Coord_Latitude");
			//var thing2 = app.getProperty("Current_Coord_Longitude");
			Sys.println(thing);
			//app.setProperty("Home_Coord_Latitude", thing1);
			//app.setProperty("Home_Coord_Longitude", thing2);
			Sys.println("Updating Data...");
			Ui.popView(Ui.SLIDE_RIGHT);
		}
	}
}

class ChooseHome extends Ui.View {
	//! Load your resources here
    function onLayout(dc) {
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
	function onUpdate(dc)
	{
		dc.setColor(Gfx.COLOR_DK_RED, Gfx.COLOR_DK_RED);
		dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
	}
}