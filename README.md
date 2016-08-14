iOS App:

check NSUserDefaults to see if the user has logged into a repose account from this device.

if they have,
    show the login screen.
        a user enters their credentials these are sent to the rails server. The server uses the api validation endpoint and checks the validity of the credentials.
        if they are valid,
            the api sends back a message of success
            NSUserDefaults loginStatus = true
            the user is redirected to the home screen
        if they aren't valid,
            the server sends back a failure message.
            the iOS app shows an error message.

if they haven't logged into a repose account from this device ,
    show the create account screen.
        a user will enter a username and password that are sent to the rails server
        if the username and password are valid,
            a new User object is created by the server. 
            the api sends back a message of success
            NSUserDefaults loginStatus = false

        if they aren't valid,
            the server sends back a failure messaage
            the iOS app shows an error message.


if a user taps the logout button
    NSUserDefaults loginStatus = false


API JSON Event Storage Call

    The user ends their event and a survey pops up
        they answer some questions that are stored in a Survey object
        the survey Object is serialized.
    the iOS app makes a post request to the API with username and password for the user

    

