///string_keywords()
var result = "";

// input matching
var greetings = ds_list_create();
ds_list_add(greetings, "hey", "hi", "hello", "howdy", "yo", "sup", "what's up");
var goodbyes = ds_list_create();
ds_list_add(goodbyes, "goodbye", "bye", "cya", "l8r", "peace");
var sell = ds_list_create();
ds_list_add(sell, "wts", "want to sell", "offer");
var buy = ds_list_create();
ds_list_add(buy, "wtb", "want to buy");
var bad = ds_list_create();
ds_list_add(bad, "fuck", "fuck you", "shit", "stfu", "fu", "bitch");
var trade = ds_list_create();
ds_list_add(trade, "wtt", "want to trade", "have", "need");
var confirm = ds_list_create();
ds_list_add(confirm, "take", "get", "yes", "ok", "deal", "hell yeah", "fuck yeah", "looks good");
var deny = ds_list_create();
ds_list_add(deny, "no", "no thanks", "no way", "hell no", "fuck that");

// all words
var keywords = ds_map_create();
ds_map_add_list(keywords, "bad", bad);
ds_map_add_list(keywords, "greetings", greetings);
ds_map_add_list(keywords, "goodbyes", goodbyes);
ds_map_add_list(keywords, "sell", sell);
ds_map_add_list(keywords, "buy", buy);
ds_map_add_list(keywords, "trade", trade);
ds_map_add_list(keywords, "confirm", confirm);
ds_map_add_list(keywords, "deny", deny);
result = json_encode(keywords);

// cleanup
ds_map_destroy(keywords);
ds_list_destroy(bad);
ds_list_destroy(greetings);
ds_list_destroy(goodbyes);
ds_list_destroy(sell);
ds_list_destroy(buy);
ds_list_destroy(trade);
ds_list_destroy(confirm);
ds_list_destroy(deny);

return result;
