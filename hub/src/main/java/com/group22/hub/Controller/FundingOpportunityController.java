package com.group22.hub.Controller;

import com.group22.hub.Model.FundingOpportunity;
import com.group22.hub.Repo.FundingOpportunityRepository;
import com.group22.hub.Repo.PostRepository;
import com.group22.hub.Repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class FundingOpportunityController {

    @Autowired
    private FundingOpportunityRepository funding_repo;

    @Autowired
    private UserRepository user_repo;

    //Returns Funding Opportunities Page
    @RequestMapping("/FundingOpportunities")
    public String openFundingPage(Model model){
        model.addAttribute("funding_repo",funding_repo);
        model.addAttribute("fundingOpportunity",new FundingOpportunity());
        return "FundingOpportunities";
    }

    //Submits Funding Opportunity Form
    @RequestMapping("/submitFundingOpportunity")
    public String submitFunding(@Valid @ModelAttribute("fundingOpportunity") FundingOpportunity fundingOpportunity, BindingResult result, Principal principal, Model model){
        if (result.hasErrors()){
            model.addAttribute("funding_repo",funding_repo);
            model.addAttribute("fundingOpportunity",new FundingOpportunity());
            return "FundingOpportunities";
        }
        //Get the User that made the funding opportunity by accessing the authentication token
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);

        //Sets the funding opportunity creator
        fundingOpportunity.setUser(user_repo.findUserByUserName(userDetails.getUsername()));

        //Saves funding opportunity to FundingOpportunityRepository
        funding_repo.save(fundingOpportunity);

        //Redirects user to the Funding Opportunities page
        return "redirect:/FundingOpportunities";
    }

    //creates a binder to relate to funding creation validator
    @InitBinder("fundingOpportunity")
    protected void initbinderfunding(WebDataBinder binder){binder.addValidators(new FundingOpportunityValidator());}

    //Retreives the authentication details
    private UserDetails getUserAuthenticationToken(Authentication principal) {
        return (UserDetails) principal.getPrincipal();
    }
}
