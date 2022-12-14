package ru.practicum.shareit.item;

import ru.practicum.shareit.item.dto.CommentDto;
import ru.practicum.shareit.item.dto.ItemDto;
import ru.practicum.shareit.item.dto.ItemWithDateBooking;

import java.util.List;

public interface ItemService {

    ItemDto addItem(long userId, ItemDto itemDto);

    ItemWithDateBooking findItemById(long userId, long id);

    List<ItemWithDateBooking> getAllItemsFromUser(long userId, int from, int size);

    ItemDto updateItemById(long userId, ItemDto item, long itemId);

    List<ItemDto> searchItems(long userId, String query);

    CommentDto addComment(long userId, long itemId, CommentDto comment);
}
