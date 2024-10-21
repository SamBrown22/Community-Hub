package com.group22.hub.Repo;

import com.group22.hub.Model.Event;
import org.springframework.data.repository.CrudRepository;

public interface EventRepository extends CrudRepository<Event, Integer> {

    Event findEventById(int id);
    Event findEventByTitle(String title);
}
