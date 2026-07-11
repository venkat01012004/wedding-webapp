package com.weddinginvitation.model;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * Represents a single RSVP submission.
 */
public class RsvpEntry implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;
    private String name;
    private String email;
    private String phone;
    private int guests;
    private String message;
    private LocalDateTime submittedAt;

    public RsvpEntry() {
    }

    public RsvpEntry(int id, String name, String email, String phone, int guests, String message) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.guests = guests;
        this.message = message;
        this.submittedAt = LocalDateTime.now();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getGuests() {
        return guests;
    }

    public void setGuests(int guests) {
        this.guests = guests;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(LocalDateTime submittedAt) {
        this.submittedAt = submittedAt;
    }
}
