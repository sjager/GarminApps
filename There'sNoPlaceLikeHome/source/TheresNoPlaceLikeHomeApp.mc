using Toybox.Application as App;

enum {
	HOME_COORDS
}

class TheresNoPlaceLikeHomeApp extends App.AppBase {

    //! onStart() is called on application start up
    function onStart() {
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new ViewPosition(), new ViewPositionDelegate() ];
    }

}