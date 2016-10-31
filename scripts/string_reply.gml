///string_reply(type)
var type = argument0, reply = "";

switch(type)
{
    case reply_type.none:
        reply = choose("Sorry, it looks like you don't have any of that.");
        break;
    case reply_type.empty:
        reply = choose("Sorry, I don't have any of that.");
        break;
    case reply_type.salutation:
        reply = choose("Greetings", "How are you?", "What's up?");
        break;
    case reply_type.regard:
        reply = choose("Goodbye", "Cya", "Ta ta!", "l8r");
        break;
    case reply_type.offer:
        reply = choose("What about this?", "I've got just the thing.");
        break;
    case reply_type.accept:
        reply = choose("Looks good.", "Sounds good.", "Okay", "Nioce!");
        break;
    case reply_type.disagree:
        reply = choose("Sorry, I don't want that.", "No thank you");
        break;
    case reply_type.counter:
        reply = choose("What do you want to trade?", 
            "What say you?", 
            "Yeah, so let's see what you got", 
            "Show me the moeny!");
        break;
    case reply_type.deny:
        reply = choose("Thought you wanted to get rid of that junk.", 
            "Okay nevermind.", "But it's one of a kind.");
        break;
    case reply_type.deal:
        reply = choose("Here you go.", "Enjoy!", "glhf", "Thank you, come again.");
        break;
    case reply_type.angry:
        reply = choose("gtfo!", "stfu!");
        break;
    default:
        reply = choose("I know not what you speak?");
        break;
}

return reply;
