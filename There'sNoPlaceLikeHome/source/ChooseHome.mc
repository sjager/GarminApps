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
			Sys.println(thing);
			app.setProperty("Home_Coords", thing);
			Sys.println(app.getProperty("Home_Coords"));
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
		var app = App.getApp();
		dc.setColor(Gfx.COLOR_DK_RED, Gfx.COLOR_DK_RED);
		dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
		
		dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
		var text = "Choose a home position:";
		dc.drawText(dc.getWidth()/2, dc.getHeight()/3, Gfx.FONT_SMALL, text, Gfx.TEXT_JUSTIFY_CENTER);
		
		dc.drawText(dc.getWidth()/2, dc.getHeight()/3*2, Gfx.FONT_SMALL, app.getProperty("Current_Coords"), Gfx.TEXT_JUSTIFY_CENTER);	
	}
}