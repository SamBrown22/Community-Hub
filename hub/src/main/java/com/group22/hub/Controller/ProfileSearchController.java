package com.group22.hub.Controller;

import com.group22.hub.Model.Comment;
import com.group22.hub.Model.User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.group22.hub.Repo.UserRepository;

import java.util.ArrayList;
import java.util.List;


@Controller
public class ProfileSearchController {
    //user database
    @Autowired
    private UserRepository user_repo;


    //returns the search page with all the search results within
    @RequestMapping(value ="/search")
    public String loadSearchResults(Model model, @RequestParam("query") String query)
    {



        model.addAttribute("results", search(query,6));


        //this should take the search query as input and then use an algorithm to find all relevant profiles then send that as
        //Sets the user of the post
        //postContent.setUser(user_repo.findUserByUserName(userDetails.getUsername()));
        //an attribute as a list, the jpa should then loop through all list values and post them as links to the relevant profiles

        //goes to the search results JPA
        return "search";
    }

    @RequestMapping(value="/search/viewprofile")
    public String loadUserProfile(Model model, @RequestParam("username") String username)
    {
        //if the user tries manually tying a name incorrectly theyll be given a default search result
        if(user_repo.findUserByUserName(username) == null)
        {
            return "redirect:/search?query=";
        }
        //this should proabbly be changed to only contain relevant info and excluding ppasswords etc
        model.addAttribute("user", user_repo.findUserByUserName(username));
        model.addAttribute("comment", new Comment());




        return "public-profile";
    }



    //inuts are the question being asked as well
    private List<User> search(String query,long numberOfResults)
    {
        //this converts iterable into usable list to search through
        List<User> users = (List<User>) user_repo.findAll();

        //if the number of results is higher than number of objects the value must be appropriatwely lowered
        if(numberOfResults >users.size())
        {
            numberOfResults = users.size();
        }
        //this is the output variable and should contain the best of the results from the repo on return

        List<User> bestResults = new ArrayList<>((int)numberOfResults);

        //-----------ALGORITHM HERE----------------
        //should sort user by highest similarity for the number of spaces in numberOfResults

        //this stores top heuristic data
        int[] heuristicArray = new int[(int)numberOfResults];

        query = query.toLowerCase();


        for(int i = 0;i<users.size();i++)
        {
            //if the values continue containing stuff their consistency increases thus rewardiung more similiar results
            int consistency = 0;
            int heuristicValue = 0;

            String username =users.get(i).getUserName().toLowerCase();

            //Edge case where they search one letter
            if(query.length() == 1)
            {
                if(username.startsWith(query))
                {
                    heuristicValue += 1;
                }
            }
            //its gotta be -1 on query length so that there arent index errors
            for(int j = 0;j<(query.length()-1);j++)
            {
                //checks if the username contains two character segments taken from query
                String substring = query.substring(j,j+2);
                if(username.contains(substring))
                {
                    //this makes it so a single two letter username isnt repeatedly rewarded
                    int substringIndex = username.indexOf(substring);
                    username = username.substring(0,substringIndex) + username.substring(substringIndex+2);

                    heuristicValue+=(1+consistency);
                    consistency+=1;
                }
                else
                {
                    //punish if the chain ends
                    consistency=0;
                }
            }



            if(heuristicValue <= 0)
            {
                continue;
            }

            int tempHeuristicVal = heuristicValue;
            User tempUser = users.get(i);
            //this should replace heuristic values and best results in tandem
            for(int j = 0;j<numberOfResults;j++)
            {
                //this fills the arrays with initial values
                if(bestResults.size() <= j)
                {
                    bestResults.add(j,tempUser);
                    heuristicArray[j] = tempHeuristicVal;
                    break;
                }

                //this just moves each item down the line
                if(tempHeuristicVal > heuristicArray[j])
                {
                    int TH = heuristicArray[j];
                    User TU = bestResults.get(j);

                    //replace values at index
                    heuristicArray[j] = tempHeuristicVal;
                    bestResults.set(j,tempUser);

                    //store prev values in temp
                    tempHeuristicVal = TH;
                    tempUser=TU;
                }
            }
        }


        //----------/ALGORITHM HERE----------------

        return bestResults;
    }

}
