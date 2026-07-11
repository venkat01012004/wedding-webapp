package com.weddinginvitation;

import com.weddinginvitation.model.RsvpEntry;
import com.weddinginvitation.store.RsvpStore;
import org.junit.Before;
import org.junit.Test;

import java.lang.reflect.Field;
import java.util.concurrent.CopyOnWriteArrayList;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class RsvpStoreTest {

    @Before
    public void clearStore() throws Exception {
        // The store is a singleton; clear its internal list between tests
        // via reflection so tests stay isolated from one another.
        RsvpStore store = RsvpStore.getInstance();
        Field field = RsvpStore.class.getDeclaredField("entries");
        field.setAccessible(true);
        ((CopyOnWriteArrayList<?>) field.get(store)).clear();
    }

    @Test
    public void testAddAndFindAll() {
        RsvpStore store = RsvpStore.getInstance();
        store.add("Priya Sharma", "priya@example.com", "9876543210", 2, "So happy for you!");

        assertEquals(1, store.findAll().size());
        RsvpEntry saved = store.findAll().get(0);
        assertEquals("Priya Sharma", saved.getName());
        assertEquals(2, saved.getGuests());
    }

    @Test
    public void testTotalGuestCount() {
        RsvpStore store = RsvpStore.getInstance();
        store.add("Guest One", "one@example.com", "1111111111", 2, "");
        store.add("Guest Two", "two@example.com", "2222222222", 3, "");

        assertEquals(5, store.totalGuestCount());
        assertEquals(2, store.totalRsvpCount());
        assertTrue(store.findAll().size() == 2);
    }
}
