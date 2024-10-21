package com.group22.hub.Service;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class ReverseCompute {
    String code;

    public ReverseCompute(String code){
        this.code = code;
    }
    public String ComputeCode(){
        StringBuilder new_code = new StringBuilder();
        int count = 1;
        String[] coding = code.split("\\R");
        for (String i : coding){
            new_code.append(count).append("=").append(i).append("&");
            count += 1;
        }
        String url = new_code.substring(0,new_code.length()-1);
        return url.replaceAll("\\s+","");
    }
    private static final String USER_AGENT = "Mozilla/5.0";
    public String SendGet() throws IOException {
        String GET_URL = "https://hooks.abstra.cloud/jsurges-workspace-b5c06c84/reversecomp?"+ComputeCode();
        URL obj = new URL(GET_URL);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("User-Agent", USER_AGENT);
        int responseCode = con.getResponseCode();
        System.out.println("GET Response Code :: " + responseCode);
        if (responseCode == HttpURLConnection.HTTP_OK) { // success
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            // return result
            return response.toString();
        } else {
            System.out.println("GET request did not work.");
            return "";
        }

    }

    public List<String> GetExecutionCode(String reverseComputeResults) {
        // returns the list of forward and reverse e.g. in json format
        JsonObject jsonObject = new Gson().fromJson(reverseComputeResults, JsonObject.class);
        List<String> objectsList = new ArrayList<>();
        // we previously reversed the code using python through an API
        // we changed the way the code works, so now we don't require getting the 'reverse'
        String forwardExecution = jsonObject.get("forward_execution").toString();
        objectsList.add(forwardExecution);
        return objectsList;
    }

    public String GetStackTrace(String forwardExecution) {
        // gets the forward stack from the forward json
        JsonObject jsonObject = new Gson().fromJson(forwardExecution, JsonObject.class);
        return jsonObject.get("stack").toString();
    }

    public String GetHistory(String forwardExecution) {
        // returns the forward execution history
        JsonObject jsonObject = new Gson().fromJson(forwardExecution, JsonObject.class);
        return jsonObject.get("code_history").toString();
    }

    public String GetCurrentStore(String execution) {
        // returns the reversed version of the current store
        JsonObject jsonObject = new Gson().fromJson(execution, JsonObject.class);
        return jsonObject.get("current_store").toString();
    }

    public int GetStore(String store, String pointer) {
        // gets the individual store based on the pointer
        int storeValue;
        JsonObject jsonObject = new Gson().fromJson(store, JsonObject.class);
        storeValue = jsonObject.get(pointer).getAsInt();
        return storeValue;
    }

    public List<JsonElement> GetHistoryArray(String history, int pointer) {
        // returns the individual array of execution
        JsonArray jsonObject = new Gson().fromJson(history, JsonArray.class);
        List<JsonElement> newArray = new ArrayList<>();
        for (JsonElement value :
                jsonObject.get(pointer).getAsJsonArray()) {
            newArray.add(value);
        }
        return newArray;
    }

    public int CountHistoryElements(String history) {
        // returns the total amount of elements in history
        JsonArray jsonObject = new Gson().fromJson(history, JsonArray.class);
        int count = 0;
        for(JsonElement ignored : jsonObject) {
            if(ignored.isJsonArray()) {
                count += 1;
            }
        }
        return count;
    }
}
