RaviSpeak
=========

A tool to de-Ravify speech, so people can understand you. Inspired by Ravi's terrible grammar in Skype.


How to use:

  1. Open your terminal

  2. Navigate to your directory for RaviSpeak

  3. Install Ruby Skype and edit the wrapper with the chat.rb file following these commands:
    > gem install skype
    > cd [PATH TO RAVISPEAK]
    > sudo cp chat.rb /Library/Ruby/Gems/1.8/gems/skype-0.2.7/lib/skype/wrappers/chat.rb

      [PATH TO RAVISPEAK] is your path to wherever you installed this directory
      skype-0.2.7 is the version of Skype I am on, and that you are probably on. If not, replace it with your version.

  4. Open your users.rv file and put your Skype username in to replace mine (If you don't replace mine, it doesn't mean you can edit my messages. You still aren't logged in as me)

  5. Use the command > ruby sbot.rb

  6. Give it a bit to catch up to your chats (around a half a minute to a minute)

  7. Type in Skype and it will edit your messages for you



If you encounter bugs, have questions, or want to comment, contact me at testuser.development@gmail.com
