package com.group22.hub.Controller;

import com.group22.hub.Model.FundingOpportunity;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class FundingOpportunityValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return FundingOpportunity.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        //Checks no field is empty
        ValidationUtils.rejectIfEmpty(errors,"fundingName","","Must enter a Title !");
        ValidationUtils.rejectIfEmpty(errors,"totalFund","","Must enter a total fund !");
        ValidationUtils.rejectIfEmpty(errors,"singleAward","","Must enter an award per individual !");
        ValidationUtils.rejectIfEmpty(errors,"closeDate","","Must enter a closing date !");
        ValidationUtils.rejectIfEmpty(errors,"description","","Must enter a description !");

        FundingOpportunity fundingOpportunity = (FundingOpportunity) target;

        //Check if totalFund is an integer
        if (!NumberUtils.isCreatable(String.valueOf(fundingOpportunity.getTotalFund()))) {
            errors.rejectValue("totalFund", "", "Total fund must be a valid integer!");
        }
        //Check if totalFund is an integer
        if (!NumberUtils.isCreatable(String.valueOf(fundingOpportunity.getSingleAward()))) {
            errors.rejectValue("totalFund", "", "Single award must be a valid integer!");
        }
    }
}
