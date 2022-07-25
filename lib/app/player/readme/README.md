## A little background on the architecture of how events and data will flow throughout the app.

![Take a look at the following diagram](architecture_diagram.png?raw=true)

When some event like pressing a button happens in the app, this event is passed through the layers as successive method calls until it finally reaches the system audio player. Since the event also causes a change in state, data about the state change is passed back through the layers in the form of a stream or notifiers. Finally the data makes it back to the UI where it’s used to update how the UI looks.