package com.weddinginvitation.store;

import com.weddinginvitation.model.RsvpEntry;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Thread-safe, application-scoped, in-memory store for RSVP submissions.
 *
 * This keeps the application dependency-free (no database required) which
 * matches the "Servlets and JSP only" requirement. Data lives for the
 * lifetime of the Tomcat process; if persistence across restarts is needed
 * later, swap this class's internals for a JDBC-backed DAO without
 * touching the servlets or JSPs that call it.
 */
public final class RsvpStore {

    private static final RsvpStore INSTANCE = new RsvpStore();

    private final List<RsvpEntry> entries = new CopyOnWriteArrayList<>();
    private final AtomicInteger idGenerator = new AtomicInteger(1);

    private RsvpStore() {
    }

    public static RsvpStore getInstance() {
        return INSTANCE;
    }

    public RsvpEntry add(String name, String email, String phone, int guests, String message) {
        RsvpEntry entry = new RsvpEntry(idGenerator.getAndIncrement(), name, email, phone, guests, message);
        entries.add(entry);
        return entry;
    }

    public List<RsvpEntry> findAll() {
        return Collections.unmodifiableList(entries);
    }

    public int totalGuestCount() {
        int total = 0;
        for (RsvpEntry entry : entries) {
            total += entry.getGuests();
        }
        return total;
    }

    public int totalRsvpCount() {
        return entries.size();
    }
}
