package com.group22.hub.Controller;

import com.group22.hub.Model.Event;
import com.group22.hub.Repo.EventRepository;
import com.group22.hub.Repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;

@Controller
public class EventController {
    //user database
    @Autowired
    private UserRepository user_repo;

    //event database
    @Autowired
    private EventRepository event_repo;



    @RequestMapping("/events")
    private String eventSubmission(Model model) {
        model.addAttribute("eventList", event_repo.findAll());
        return "events";
    }

    //adds data to the event creation JSP
    @RequestMapping("/eventCreation")
    private String eventCreation(Model model)
    {
        model.addAttribute("eventcontent", new Event());
        return "event-creation";
    }

    @RequestMapping("/eventdetails")
    private String eventDetails(@RequestParam("event") String event, Model model){
        model.addAttribute("event", event_repo.findEventByTitle(event));

        return "event-details";
    }

    //this submits the new event and redirects to events so it can be viewed
    @PostMapping("/submitEvent")
    private String postEvent(@ModelAttribute("eventcontent") Event eventContent,Principal principal)
    {
        //Gets the user who created the event by accessing token
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);
        //Sets the user of the post
        eventContent.setOrganiser(user_repo.findUserByUserName(userDetails.getUsername()));


        //check that inputs are valid if not return to event-creation preferably with an error message
        if(eventContent.getTitle().equals("")) {
            return "event-creation";
        }
        if(eventContent.getDescription().equals("")) {
            return "event-creation";
        }
        //location doesnt need to be checked
        //these should be in the exact format specified so if not of correct length then bad
        //this is so user can input 3/2/2023 for example but not /2/2023
        if(eventContent.getStringDate().length() < 8 || eventContent.getStringDate().length() > 10) {
            return "event-creation";
        }
        //this is so user can input 3:2 for example but not 3:
        if(eventContent.getStringTime().length() < 3 || eventContent.getStringTime().length() > 5) {
            return "event-creation";
        }


        //reformat date and time, stole this from stack overflow lol
        try {
            //this is so theres more flexibility in how the user can enter the input fields
            DateTimeFormatterBuilder builder = new DateTimeFormatterBuilder();
            builder.parseCaseInsensitive();
            builder.appendPattern("dd/MM/uuuu/HH/mm");

            DateTimeFormatter dateFormatter
                    = builder.toFormatter();

            long millisecondsSinceEpoch = LocalDateTime.parse(
                    eventContent.getStringDate()+"/"+eventContent.getStringTime()
                            , dateFormatter)
                    .atZone(ZoneOffset.UTC)
                    .toInstant()
                    .toEpochMilli();



            eventContent.setDate(millisecondsSinceEpoch);
        }
        //this is a catch all and should be changed
        catch (Exception e)
        {
            //this means they inputted incorrectly
            return "event-creation";
        }


        //finally saves to database
        event_repo.save(eventContent);


        return "redirect:/events";
    }



    // gets the auth user details
    private UserDetails getUserAuthenticationToken(Authentication principal) {
        return (UserDetails) principal.getPrincipal();
    }


}
