package com.group22.hub.Model;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
public class FundingOpportunity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "User_ID")
    private User user;

    private String fundingName;
    private int totalFund;
    private int singleAward;

    private String description;

    LocalDate today = LocalDate.now();
    private String openDate = String.valueOf(today);
    private String closeDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getFundingName() {
        return fundingName;
    }

    public void setFundingName(String fundingName) {
        this.fundingName = fundingName;
    }

    public int getTotalFund() {
        return totalFund;
    }

    public void setTotalFund(int totalFund) {
        this.totalFund = totalFund;
    }

    public int getSingleAward() {
        return singleAward;
    }

    public void setSingleAward(int singleAward) {
        this.singleAward = singleAward;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getOpenDate() {
        return openDate;
    }

    public void setOpenDate(String openDate) {
        this.openDate = openDate;
    }

    public String getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(String closeDate) {
        this.closeDate = closeDate;
    }
}
