///string_interpret(text)
var text = argument0;
var reply = string_reply(reply_type.null);
var keyword_map = json_decode(string_keywords());

// return garbage if no keywords can be found
if (keyword_map == -1 || !encoded)
    return generate_key(16);

var list = ds_map_find_first(keyword_map), ignore = false;
for(var i = 0; i < ds_map_size(keyword_map); i++)
{
    var words = keyword_map[? list];
    for (var j = 0; j < ds_list_size(words); j++)
    {
        var word = words[| j];
        // matched input
        if (string_count(word, text))
        {
            switch(list)
            {
                case "bad":
                    if (pc)
                    {
                        chat_log(in_words, word);
                        reply = string_reply(reply_type.angry);
                        banned = true;
                        dock(noone, false);
                    }
                    else
                        ignore = true;
                        
                    // ToDo: add witty response
                    reply = string_reply(reply_type.angry);   
                    break;
                case "greetings":
                    chat_log(in_words, word);
                    reply = string_reply(reply_type.salutation);
                    break;
                case "goodbyes":
                    chat_log(in_words, word);
                    reply = string_reply(reply_type.regard);
                    break;
                case "sell":
                    var value = find_next_word(text, word), num = string_split(value, "x"), 
                        color = real(num[| 0]), amount = real(num[| 1]),
                        find = find_item(o_ship.inventory, color),
                        have = is_type(o_space_station) && !is_undefined(find)
                            && find[element.amount] >= amount,
                        want = roll_want(color, amount);
                        
                    reply = string_reply(ternary(have, ternary(want,
                        reply_type.accept, reply_type.disagree),
                    reply_type.empty));
                    
                    o_ship.offer_item = ternary(have && want, find, undefined);
                    o_ship.offer_amount = ternary(have && want, amount, -1);

                    ds_list_destroy(num);
                    chat_log_item(in_words, word, find, amount);
                    break;
                case "buy":
                    var value = find_next_word(text, word), num = string_split(value, "x"), 
                        color = real(num[| 0]), amount = real(num[| 1]),
                        find = find_item_range(inventory, color, 20),
                        have = is_type(o_space_station) && !is_undefined(find)
                            && find[element.amount] >= amount;
                        
                    reply = string_reply(ternary(have, reply_type.offer, reply_type.empty));
                        
                    offer_item = ternary(have, find, undefined);
                    offer_amount = ternary(have, amount, -1);
                    
                    ds_list_destroy(num);
                    chat_log_ext(in_words, word, undefined, undefined, value);
                    break;
                case "trade":
                    if (!is_undefined(o_ship.offer_item))
                    {
                        var value = find_next_word(text, word), num = string_split(value, "x"), 
                            color = real(num[| 0]), amount = real(num[| 1]),
                            find = find_item_range(inventory, color, 20),
                            have = is_type(o_space_station) && !is_undefined(find) 
                                && find[element.amount] >= amount;
                                
                        reply = string_reply(ternary(have, reply_type.offer, reply_type.empty));
                                
                        offer_item = ternary(have, find, undefined);
                        offer_amount = ternary(have, amount, -1);
                        deal = have;
                        
                        ds_list_destroy(num);
                        chat_log_ext(in_words, word, undefined, undefined, value);
                    }
                    else if (!is_undefined(offer_item))
                    {
                        var value = find_next_word(text, word), num = string_split(value, "x"), 
                            color = real(num[| 0]), amount = real(num[| 1]),
                            find = find_item(o_ship.inventory, color),
                            have = is_type(o_space_station) && !is_undefined(find)
                                && find[element.amount] >= amount,
                            want = roll_want(color, amount);
                        
                        reply = string_reply(ternary(have, ternary(want,
                            reply_type.deal, reply_type.disagree),
                        reply_type.none));

                        if (have && want)
                        {
                            // do exchange
                            exchange(offer_item[element.color], offer_amount, inventory, o_ship.inventory);
                            exchange(find[element.color], amount, o_ship.inventory, inventory);
                            chat_log_item(out_words, "offer", offer_item, offer_amount);
                            // clear offer (on success)
                            offer_item = undefined;
                            offer_amount = -1;
                            // add bonuses
                            o_ship.reputation += min(amount / 10, 5);
                            if (is_undefined(sales[? o_ship.id]))
                                ds_map_add(sales, o_ship.id, 1);
                            else
                                sales[? o_ship.id] += 1;
                        }
                        
                        ds_list_destroy(num);
                        chat_log_item(in_words, word, find, amount);
                    }
                    break;
                case "confirm":
                    if (!deal)
                    {
                        reply = string_reply(reply_type.counter);
                        break;
                    }
                        
                    // sell
                    if (!is_undefined(o_ship.offer_item))
                    {
                        reply = string_reply(reply_type.deal);
                        // do exchange
                        exchange(o_ship.offer_item[element.color], o_ship.offer_amount, o_ship.inventory, inventory);
                        exchange(offer_item[element.color], offer_amount, inventory, o_ship.inventory);
                        chat_log_item(out_words, "offer", offer_item, offer_amount);
                        // add bonuses
                        o_ship.reputation += min(o_ship.offer_amount / 10, 5);
                        if (is_undefined(sales[? o_ship.id]))
                            ds_map_add(sales, o_ship.id, 1);
                        else
                            sales[? o_ship.id] += 1;
                        // clear offers
                        o_ship.offer_item = undefined;
                        o_ship.offer_amount = -1;
                        offer_item = undefined;
                        offer_amount = -1;
                    }
                    // buy
                    else if (!is_undefined(offer_item))
                    {
                        // code here...
                    }
                    deal = false;
                    chat_log_item(in_words, word, o_ship.offer_item, o_ship.offer_amount);
                    break;
                case "deny":
                    if (!is_undefined(o_ship.offer_item))
                    {
                        reply = string_reply(reply_type.deny);
                        chat_log_item(in_words, word, o_ship.offer_item, o_ship.offer_amount);
                        o_ship.offer_item = undefined;
                        o_ship.offer_amount = -1;
                    }
                    else if (!is_undefined(offer_item))
                    {
                        reply = string_reply(reply_type.deny);
                        chat_log_item(in_words, word, offer_item, offer_amount);
                        offer_item = undefined;
                        offer_amount = -1;
                    }
                    deal = false;
                    break;
            }
            chat_log(out_words, reply);
            break;
        }
        if (ignore || banned)
            break;
    }
    list = ds_map_find_next(keyword_map, list);
}

// cleanup
ds_map_destroy(keyword_map);

return reply;
