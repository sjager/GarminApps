using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class ViewPositionDelegate extends Ui.BehaviorDelegate
{
	function onMenu()
	{
		Sys.println("Position");
		Ui.pushView(new ChooseHome(), new ChooseHomeDelegate(), Ui.SLIDE_LEFT);
	}
}

class ViewPosition extends Ui.View {
	//! Load your resources here
    function onLayout(dc) {
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
	function onUpdate(dc)
	{
		Sys.println("HI");
		dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_GREEN);
		dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
	}
}