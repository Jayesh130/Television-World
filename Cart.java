package com.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items = new ArrayList<>();

    public void addItem(CartItem item) {
        for (CartItem existingItem : items) {
            if (existingItem.getProduct().getId() == item.getProduct().getId()) {
                existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(int productId) {
        items.removeIf(item -> item.getProduct().getId() == productId);
    }

    public List<CartItem> getItems() {
        return items;
    }

    public float getTotalPrice() {
        float total = 0;
        for (CartItem item : items) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }
        return total;
    }
}