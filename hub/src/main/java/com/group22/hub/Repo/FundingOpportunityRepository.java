package com.group22.hub.Repo;

import com.group22.hub.Model.FundingOpportunity;
import org.springframework.data.repository.CrudRepository;

public interface FundingOpportunityRepository extends CrudRepository<FundingOpportunity, Integer> {
    //Finds funding opportunity from its unique id
    FundingOpportunity findFundingOpportunityById(Integer id);
}
